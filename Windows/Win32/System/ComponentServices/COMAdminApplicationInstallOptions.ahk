#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct COMAdminApplicationInstallOptions {
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
    static COMAdminInstallNoUsers => 0

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminInstallUsers => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminInstallForceOverwriteOfFiles => 2
}
