#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct PUAF {
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
    static PUAF_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static PUAF_NOUI => 1

    /**
     * @type {Integer (Int32)}
     */
    static PUAF_ISFILE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PUAF_WARN_IF_DENIED => 4

    /**
     * @type {Integer (Int32)}
     */
    static PUAF_FORCEUI_FOREGROUND => 8

    /**
     * @type {Integer (Int32)}
     */
    static PUAF_CHECK_TIFS => 16

    /**
     * @type {Integer (Int32)}
     */
    static PUAF_DONTCHECKBOXINDIALOG => 32

    /**
     * @type {Integer (Int32)}
     */
    static PUAF_TRUSTED => 64

    /**
     * @type {Integer (Int32)}
     */
    static PUAF_ACCEPT_WILDCARD_SCHEME => 128

    /**
     * @type {Integer (Int32)}
     */
    static PUAF_ENFORCERESTRICTED => 256

    /**
     * @type {Integer (Int32)}
     */
    static PUAF_NOSAVEDFILECHECK => 512

    /**
     * @type {Integer (Int32)}
     */
    static PUAF_REQUIRESAVEDFILECHECK => 1024

    /**
     * @type {Integer (Int32)}
     */
    static PUAF_DONT_USE_CACHE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static PUAF_RESERVED1 => 8192

    /**
     * @type {Integer (Int32)}
     */
    static PUAF_RESERVED2 => 16384

    /**
     * @type {Integer (Int32)}
     */
    static PUAF_LMZ_UNLOCKED => 65536

    /**
     * @type {Integer (Int32)}
     */
    static PUAF_LMZ_LOCKED => 131072

    /**
     * @type {Integer (Int32)}
     */
    static PUAF_DEFAULTZONEPOL => 262144

    /**
     * @type {Integer (Int32)}
     */
    static PUAF_NPL_USE_LOCKED_IF_RESTRICTED => 524288

    /**
     * @type {Integer (Int32)}
     */
    static PUAF_NOUIIFLOCKED => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static PUAF_DRAGPROTOCOLCHECK => 2097152
}
