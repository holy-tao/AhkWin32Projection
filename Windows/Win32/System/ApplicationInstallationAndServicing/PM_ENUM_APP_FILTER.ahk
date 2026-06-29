#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_ENUM_APP_FILTER {
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
    static PM_APP_FILTER_ALL => 0

    /**
     * @type {Integer (Int32)}
     */
    static PM_APP_FILTER_VISIBLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static PM_APP_FILTER_GENRE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PM_APP_FILTER_NONGAMES => 3

    /**
     * @type {Integer (Int32)}
     */
    static PM_APP_FILTER_HUBTYPE => 4

    /**
     * @type {Integer (Int32)}
     */
    static PM_APP_FILTER_PINABLEONKIDZONE => 5

    /**
     * @type {Integer (Int32)}
     */
    static PM_APP_FILTER_ALL_INCLUDE_MODERN => 6

    /**
     * @type {Integer (Int32)}
     */
    static PM_APP_FILTER_FRAMEWORK => 7

    /**
     * @type {Integer (Int32)}
     */
    static PM_APP_FILTER_MAX => 8
}
