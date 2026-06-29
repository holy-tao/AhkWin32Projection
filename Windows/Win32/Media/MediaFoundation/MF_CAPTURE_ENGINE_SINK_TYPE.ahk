#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a type of capture sink.
 * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/ne-mfcaptureengine-mf_capture_engine_sink_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_CAPTURE_ENGINE_SINK_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A recording sink, for capturing audio and video to a file.
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_SINK_TYPE_RECORD => 0

    /**
     * A preview sink, for previewing live audio or video.
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_SINK_TYPE_PREVIEW => 1

    /**
     * A photo sink, for capturing still images.
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_SINK_TYPE_PHOTO => 2
}
