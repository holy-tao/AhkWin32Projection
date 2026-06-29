#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct COMAdminSynchronizationOptions {
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
    static COMAdminSynchronizationIgnored => 0

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminSynchronizationNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminSynchronizationSupported => 2

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminSynchronizationRequired => 3

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminSynchronizationRequiresNew => 4
}
