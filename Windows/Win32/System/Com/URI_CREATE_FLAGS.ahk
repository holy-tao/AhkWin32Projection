#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct URI_CREATE_FLAGS {
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
    static Uri_CREATE_ALLOW_RELATIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_CREATE_ALLOW_IMPLICIT_WILDCARD_SCHEME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_CREATE_ALLOW_IMPLICIT_FILE_SCHEME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_CREATE_NOFRAG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_CREATE_NO_CANONICALIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_CREATE_CANONICALIZE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_CREATE_FILE_USE_DOS_PATH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_CREATE_DECODE_EXTRA_INFO => 64

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_CREATE_NO_DECODE_EXTRA_INFO => 128

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_CREATE_CRACK_UNKNOWN_SCHEMES => 512

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_CREATE_NO_CRACK_UNKNOWN_SCHEMES => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_CREATE_PRE_PROCESS_HTML_URI => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_CREATE_NO_PRE_PROCESS_HTML_URI => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_CREATE_IE_SETTINGS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_CREATE_NO_IE_SETTINGS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_CREATE_NO_ENCODE_FORBIDDEN_CHARACTERS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_CREATE_NORMALIZE_INTL_CHARACTERS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_CREATE_CANONICALIZE_ABSOLUTE => 131072
}
