#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct INSTALLTYPE {
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
    static INSTALLTYPE_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLTYPE_NETWORK_IMAGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLTYPE_SINGLE_INSTANCE => 2
}
