#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a type of capture sink.
 * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/ne-mfcaptureengine-mf_capture_engine_sink_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_CAPTURE_ENGINE_SINK_TYPE extends Win32Enum{

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
