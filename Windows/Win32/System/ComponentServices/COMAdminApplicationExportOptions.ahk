#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct COMAdminApplicationExportOptions {
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
    static COMAdminExportNoUsers => 0

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminExportUsers => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminExportApplicationProxy => 2

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminExportForceOverwriteOfFiles => 4

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminExportIn10Format => 16
}
