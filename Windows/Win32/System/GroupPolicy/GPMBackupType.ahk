#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The type of backup created.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/ne-gpmgmt-gpmbackuptype
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct GPMBackupType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Backup of a Group Policy object.
     * @type {Integer (Int32)}
     */
    static typeGPO => 0

    /**
     * Backup of a Starter Group Policy object.
     * @type {Integer (Int32)}
     */
    static typeStarterGPO => 1
}
