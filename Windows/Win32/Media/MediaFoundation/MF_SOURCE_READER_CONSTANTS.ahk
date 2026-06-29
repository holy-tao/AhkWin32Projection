#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_SOURCE_READER_CONSTANTS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static MF_SOURCE_READER_INVALID_STREAM_INDEX => -1

    /**
     * @type {Integer (Int32)}
     */
    static MF_SOURCE_READER_ALL_STREAMS => -2

    /**
     * @type {Integer (Int32)}
     */
    static MF_SOURCE_READER_ANY_STREAM => -2

    /**
     * @type {Integer (Int32)}
     */
    static MF_SOURCE_READER_FIRST_AUDIO_STREAM => -3

    /**
     * @type {Integer (Int32)}
     */
    static MF_SOURCE_READER_FIRST_VIDEO_STREAM => -4

    /**
     * @type {Integer (Int32)}
     */
    static MF_SOURCE_READER_MEDIASOURCE => -1
}
