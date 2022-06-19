import tts
var t: Tts?
#if os(windows
    t = Tts(Backend.tolk)
#else
    t = Tts()
#endif
t.speak("Hello, World.")
