#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct URLZONE {
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
    static URLZONE_INVALID => -1

    /**
     * @type {Integer (Int32)}
     */
    static URLZONE_PREDEFINED_MIN => 0

    /**
     * @type {Integer (Int32)}
     */
    static URLZONE_LOCAL_MACHINE => 0

    /**
     * @type {Integer (Int32)}
     */
    static URLZONE_INTRANET => 1

    /**
     * @type {Integer (Int32)}
     */
    static URLZONE_TRUSTED => 2

    /**
     * @type {Integer (Int32)}
     */
    static URLZONE_INTERNET => 3

    /**
     * @type {Integer (Int32)}
     */
    static URLZONE_UNTRUSTED => 4

    /**
     * @type {Integer (Int32)}
     */
    static URLZONE_PREDEFINED_MAX => 999

    /**
     * @type {Integer (Int32)}
     */
    static URLZONE_USER_MIN => 1000

    /**
     * @type {Integer (Int32)}
     */
    static URLZONE_USER_MAX => 10000
}
