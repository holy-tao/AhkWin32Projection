#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_APPLICATION_STATE {
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
    static PM_APPLICATION_STATE_MIN => 0

    /**
     * @type {Integer (Int32)}
     */
    static PM_APPLICATION_STATE_INSTALLED => 1

    /**
     * @type {Integer (Int32)}
     */
    static PM_APPLICATION_STATE_INSTALLING => 2

    /**
     * @type {Integer (Int32)}
     */
    static PM_APPLICATION_STATE_UPDATING => 3

    /**
     * @type {Integer (Int32)}
     */
    static PM_APPLICATION_STATE_UNINSTALLING => 4

    /**
     * @type {Integer (Int32)}
     */
    static PM_APPLICATION_STATE_LICENSE_UPDATING => 5

    /**
     * @type {Integer (Int32)}
     */
    static PM_APPLICATION_STATE_MOVING => 6

    /**
     * @type {Integer (Int32)}
     */
    static PM_APPLICATION_STATE_DISABLED_SD_CARD => 7

    /**
     * @type {Integer (Int32)}
     */
    static PM_APPLICATION_STATE_DISABLED_ENTERPRISE => 8

    /**
     * @type {Integer (Int32)}
     */
    static PM_APPLICATION_STATE_DISABLED_BACKING_UP => 9

    /**
     * @type {Integer (Int32)}
     */
    static PM_APPLICATION_STATE_DISABLED_MDIL_BINDING => 10

    /**
     * @type {Integer (Int32)}
     */
    static PM_APPLICATION_STATE_MAX => 10

    /**
     * @type {Integer (Int32)}
     */
    static PM_APPLICATION_STATE_INVALID => 11
}
