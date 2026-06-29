#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_CAPTURE_ENGINE_SOURCE {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
