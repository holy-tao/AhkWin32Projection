#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_CAPTURE_ENGINE_SOURCE extends Win32Enum {

    /**
     * Native name: MF_CAPTURE_ENGINE_PREFERRED_SOURCE_STREAM_FOR_VIDEO_PREVIEW
     * @type {Integer (UInt32)}
     */
    static PREFERRED_SOURCE_STREAM_FOR_VIDEO_PREVIEW => 4294967290

    /**
     * Native name: MF_CAPTURE_ENGINE_PREFERRED_SOURCE_STREAM_FOR_VIDEO_RECORD
     * @type {Integer (UInt32)}
     */
    static PREFERRED_SOURCE_STREAM_FOR_VIDEO_RECORD => 4294967289

    /**
     * Native name: MF_CAPTURE_ENGINE_PREFERRED_SOURCE_STREAM_FOR_PHOTO
     * @type {Integer (UInt32)}
     */
    static PREFERRED_SOURCE_STREAM_FOR_PHOTO => 4294967288

    /**
     * Native name: MF_CAPTURE_ENGINE_PREFERRED_SOURCE_STREAM_FOR_AUDIO
     * @type {Integer (UInt32)}
     */
    static PREFERRED_SOURCE_STREAM_FOR_AUDIO => 4294967287

    /**
     * Native name: MF_CAPTURE_ENGINE_PREFERRED_SOURCE_STREAM_FOR_METADATA
     * @type {Integer (UInt32)}
     */
    static PREFERRED_SOURCE_STREAM_FOR_METADATA => 4294967286

    /**
     * Native name: MF_CAPTURE_ENGINE_MEDIASOURCE
     * @type {Integer (UInt32)}
     */
    static MEDIASOURCE => 4294967295
}
