# swift_tts

A swift binding to [nolan's tts-rs library](https://github.com/ndarilek/tts-rs)

# Building.

To build on windows, You just have to take the tts.dll.lib from the libs/windows directory, Put it at the same directory where you're building you're swift program and build.

Different platforms are not yet tested, But if you want to you can try building the tts-rs library with the feature ffi from [this forck](https://github.com/mcb2003/tts-rs/tree/c-ffi)

And then you could just put the library at the same location where you're building you're spm package and should work fine, If not submit an issue.

# Example
```
import tts
var t: Tts?
#if os(windows
    t = Tts(Backend.tolk)
#else
    t = Tts()
#endif
t.speak("Hello, World.")
```
