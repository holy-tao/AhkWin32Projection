#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a type of capture sink.
 * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/ne-mfcaptureengine-mf_capture_engine_sink_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_CAPTURE_ENGINE_SINK_TYPE extends Win32Enum {

    /**
     * A recording sink, for capturing audio and video to a file.
     * Native name: MF_CAPTURE_ENGINE_SINK_TYPE_RECORD
     * @type {Integer (Int32)}
     */
    static RECORD => 0

    /**
     * A preview sink, for previewing live audio or video.
     * Native name: MF_CAPTURE_ENGINE_SINK_TYPE_PREVIEW
     * @type {Integer (Int32)}
     */
    static PREVIEW => 1

    /**
     * A photo sink, for capturing still images.
     * Native name: MF_CAPTURE_ENGINE_SINK_TYPE_PHOTO
     * @type {Integer (Int32)}
     */
    static PHOTO => 2
}
