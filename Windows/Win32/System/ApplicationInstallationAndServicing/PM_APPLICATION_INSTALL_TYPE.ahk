#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_APPLICATION_INSTALL_TYPE {
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
    static PM_APPLICATION_INSTALL_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static PM_APPLICATION_INSTALL_IN_ROM => 1

    /**
     * @type {Integer (Int32)}
     */
    static PM_APPLICATION_INSTALL_PA => 2

    /**
     * @type {Integer (Int32)}
     */
    static PM_APPLICATION_INSTALL_DEBUG => 3

    /**
     * @type {Integer (Int32)}
     */
    static PM_APPLICATION_INSTALL_ENTERPRISE => 4

    /**
     * @type {Integer (Int32)}
     */
    static PM_APPLICATION_INSTALL_INVALID => 5
}
