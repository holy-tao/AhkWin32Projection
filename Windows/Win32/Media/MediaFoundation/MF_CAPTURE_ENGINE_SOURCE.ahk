#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_CAPTURE_ENGINE_SOURCE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static MF_CAPTURE_ENGINE_PREFERRED_SOURCE_STREAM_FOR_VIDEO_PREVIEW => 4294967290

    /**
     * @type {Integer (UInt32)}
     */
    static MF_CAPTURE_ENGINE_PREFERRED_SOURCE_STREAM_FOR_VIDEO_RECORD => 4294967289

    /**
     * @type {Integer (UInt32)}
     */
    static MF_CAPTURE_ENGINE_PREFERRED_SOURCE_STREAM_FOR_PHOTO => 4294967288

    /**
     * @type {Integer (UInt32)}
     */
    static MF_CAPTURE_ENGINE_PREFERRED_SOURCE_STREAM_FOR_AUDIO => 4294967287

    /**
     * @type {Integer (UInt32)}
     */
    static MF_CAPTURE_ENGINE_PREFERRED_SOURCE_STREAM_FOR_METADATA => 4294967286

    /**
     * @type {Integer (UInt32)}
     */
    static MF_CAPTURE_ENGINE_MEDIASOURCE => 4294967295
}
