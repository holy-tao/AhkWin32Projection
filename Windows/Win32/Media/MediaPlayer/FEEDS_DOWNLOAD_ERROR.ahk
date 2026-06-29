#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct FEEDS_DOWNLOAD_ERROR {
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
    static FDE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static FDE_DOWNLOAD_FAILED => 1

    /**
     * @type {Integer (Int32)}
     */
    static FDE_INVALID_FEED_FORMAT => 2

    /**
     * @type {Integer (Int32)}
     */
    static FDE_NORMALIZATION_FAILED => 3

    /**
     * @type {Integer (Int32)}
     */
    static FDE_PERSISTENCE_FAILED => 4

    /**
     * @type {Integer (Int32)}
     */
    static FDE_DOWNLOAD_BLOCKED => 5

    /**
     * @type {Integer (Int32)}
     */
    static FDE_CANCELED => 6

    /**
     * @type {Integer (Int32)}
     */
    static FDE_UNSUPPORTED_AUTH => 7

    /**
     * @type {Integer (Int32)}
     */
    static FDE_BACKGROUND_DOWNLOAD_DISABLED => 8

    /**
     * @type {Integer (Int32)}
     */
    static FDE_NOT_EXIST => 9

    /**
     * @type {Integer (Int32)}
     */
    static FDE_UNSUPPORTED_MSXML => 10

    /**
     * @type {Integer (Int32)}
     */
    static FDE_UNSUPPORTED_DTD => 11

    /**
     * @type {Integer (Int32)}
     */
    static FDE_DOWNLOAD_SIZE_LIMIT_EXCEEDED => 12

    /**
     * @type {Integer (Int32)}
     */
    static FDE_ACCESS_DENIED => 13

    /**
     * @type {Integer (Int32)}
     */
    static FDE_AUTH_FAILED => 14

    /**
     * @type {Integer (Int32)}
     */
    static FDE_INVALID_AUTH => 15
}
