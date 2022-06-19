import Ctts
public enum Backend: Int32 {
#if os(Windows)
case tolk = 0
case winRt
#elseif os(Linux)
case speechDispatcher
#else
case avFoundation
case appKit
#endif
}
enum TtsError: Error {
    case err(info: String)
}
public class TextToSpeech {
    private var tts: OpaquePointer?
    public init() throws {
        tts = tts_default()
        if tts == nil {
            defer { tts_clear_error() }
            throw TtsError.err(info: String(cString: tts_get_error()!))
        }
    }
    public init(_ backend: Backend) throws {
        tts = tts_new(Backends(rawValue: backend.rawValue))
        if tts == nil {
            defer { tts_clear_error() }
            throw TtsError.err(info: String(cString: tts_get_error()!))
        }
    }
    deinit {
        tts_free(tts)
        tts_clear_error()
        tts = nil
    }
    @discardableResult
    public func speak(_ text: String, _ interrupt: Bool = false) -> Bool {
        return tts_speak(tts, text, interrupt, nil)
    }
    public func stop() -> Bool {
        return tts_stop(tts)
    }
    public func minRate() -> Float {
        return tts_min_rate(tts)
    }
    public func maxRate() -> Float {
        return tts_max_rate(tts)
    }
    public func normalRate() -> Float {
        return tts_normal_rate(tts)
    }
    public func getRate() -> Float {
        var ret: Float = 0.0
        tts_get_rate(tts, &ret)
        return ret
    }
    public func setRate(_ rate: Float) -> Bool {
        return tts_set_rate(tts, rate)
    }
}