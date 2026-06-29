#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFT_ENUM_FLAG {
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
    static MFT_ENUM_FLAG_SYNCMFT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MFT_ENUM_FLAG_ASYNCMFT => 2

    /**
     * @type {Integer (Int32)}
     */
    static MFT_ENUM_FLAG_HARDWARE => 4

    /**
     * @type {Integer (Int32)}
     */
    static MFT_ENUM_FLAG_FIELDOFUSE => 8

    /**
     * @type {Integer (Int32)}
     */
    static MFT_ENUM_FLAG_LOCALMFT => 16

    /**
     * @type {Integer (Int32)}
     */
    static MFT_ENUM_FLAG_TRANSCODE_ONLY => 32

    /**
     * @type {Integer (Int32)}
     */
    static MFT_ENUM_FLAG_SORTANDFILTER => 64

    /**
     * @type {Integer (Int32)}
     */
    static MFT_ENUM_FLAG_SORTANDFILTER_APPROVED_ONLY => 192

    /**
     * @type {Integer (Int32)}
     */
    static MFT_ENUM_FLAG_SORTANDFILTER_WEB_ONLY => 320

    /**
     * @type {Integer (Int32)}
     */
    static MFT_ENUM_FLAG_SORTANDFILTER_WEB_ONLY_EDGEMODE => 576

    /**
     * @type {Integer (Int32)}
     */
    static MFT_ENUM_FLAG_UNTRUSTED_STOREMFT => 1024

    /**
     * @type {Integer (Int32)}
     */
    static MFT_ENUM_FLAG_ALL => 63
}
