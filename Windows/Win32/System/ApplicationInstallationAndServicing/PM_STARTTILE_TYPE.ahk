#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_STARTTILE_TYPE {
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
    static PM_STARTTILE_TYPE_PRIMARY => 1

    /**
     * @type {Integer (Int32)}
     */
    static PM_STARTTILE_TYPE_SECONDARY => 2

    /**
     * @type {Integer (Int32)}
     */
    static PM_STARTTILE_TYPE_APPLIST => 3

    /**
     * @type {Integer (Int32)}
     */
    static PM_STARTTILE_TYPE_APPLISTPRIMARY => 4

    /**
     * @type {Integer (Int32)}
     */
    static PM_STARTTILE_TYPE_INVALID => 5
}
