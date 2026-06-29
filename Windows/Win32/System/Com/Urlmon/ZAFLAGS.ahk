#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct ZAFLAGS {
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
    static ZAFLAGS_CUSTOM_EDIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static ZAFLAGS_ADD_SITES => 2

    /**
     * @type {Integer (Int32)}
     */
    static ZAFLAGS_REQUIRE_VERIFICATION => 4

    /**
     * @type {Integer (Int32)}
     */
    static ZAFLAGS_INCLUDE_PROXY_OVERRIDE => 8

    /**
     * @type {Integer (Int32)}
     */
    static ZAFLAGS_INCLUDE_INTRANET_SITES => 16

    /**
     * @type {Integer (Int32)}
     */
    static ZAFLAGS_NO_UI => 32

    /**
     * @type {Integer (Int32)}
     */
    static ZAFLAGS_SUPPORTS_VERIFICATION => 64

    /**
     * @type {Integer (Int32)}
     */
    static ZAFLAGS_UNC_AS_INTRANET => 128

    /**
     * @type {Integer (Int32)}
     */
    static ZAFLAGS_DETECT_INTRANET => 256

    /**
     * @type {Integer (Int32)}
     */
    static ZAFLAGS_USE_LOCKED_ZONES => 65536

    /**
     * @type {Integer (Int32)}
     */
    static ZAFLAGS_VERIFY_TEMPLATE_SETTINGS => 131072

    /**
     * @type {Integer (Int32)}
     */
    static ZAFLAGS_NO_CACHE => 262144
}
