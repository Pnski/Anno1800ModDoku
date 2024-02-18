import Anno6

class Benchmark:

	def __init__(self):
		self.nextSequence = 0;

		# Name (Old)																					ID
		# benchmark_postcard	Flug auf bebaute Insel aus Postcard view								7
		# benchmark_medium		Flug über bebaute Insel aus mittlerer Perspektive (Gamecamera)			8
		# benchmark_far			Flug über bebaute Insel aus entfernter Perspektive (Gamecamera)			9
		# benchmark_close		Flug über bebaute Insel aus naher Perspektive (Gamecamera)				10
		# benchmark_zoomout		Zoomout von naher Perspektive zu entfernter Perspektive (Gamecamera)	11

		# Name																							ID
		# benchmark_postcard	Flug auf bebaute Insel aus Postcard view								7
		# benchmark_medium_v2	Flug über bebaute Insel aus mittlerer Perspektive (Gamecamera)			13
		# benchmark_far_v2		Flug über bebaute Insel aus entfernter Perspektive (Gamecamera)			14
		# benchmark_close_v2	Flug über bebaute Insel aus naher Perspektive (Gamecamera)				12
		# benchmark_zoomout		Zoomout von naher Perspektive zu entfernter Perspektive (Gamecamera)	11

		self.playlist = [12, 12, 12, 13, 13, 13, 14, 14, 14]#, 11, 11, 11, 7, 7, 7]
		pass

	def OnSessionLoad(self, guid):
		TextSources.TextSourceRoots.Cheat.GlobalCheats.DisableUndiscovered()

	#def OnSessionLoaded(self, guid):
		#TextSources.TextSourceRoots.Discovery.ShowAll()

	def OnSessionEnter(self, guid):
		render.benchmarkStarted()
		self.StartSequence()
		TextSources.TextSourceRoots.Interface.ToggleUI()
		
	def OnSequenceEnd(self, sequenceInfo):
		if int(sequenceInfo.cameraSequenceID) == self.playlist[self.nextSequence]:
			render.benchmarkSequenceStopped(sequenceInfo.cameraSequenceID)
			self.nextSequence = self.nextSequence + 1
			self.StartSequence()
		
	def StartSequence(self):
		if len(self.playlist) <= self.nextSequence:
			render.benchmarkStopped()
			# game.fastQuit(2)
		else:
			render.benchmarkSequenceStarted(self.playlist[self.nextSequence])
			session.startSequence(self.playlist[self.nextSequence])

# create the benchmark object
benchmark = Benchmark()

# register initial event
Anno6.GameEvents.onSessionLoad.append(benchmark.OnSessionLoad)
#Anno6.GameEvents.onSessionLoaded.append(benchmark.OnSessionLoaded)
Anno6.GameEvents.onSessionEnter.append(benchmark.OnSessionEnter)
Anno6.GameEvents.onCameraSequenceEnd.append(benchmark.OnSequenceEnd)