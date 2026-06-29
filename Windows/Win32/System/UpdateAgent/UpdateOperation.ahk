#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines operations that can be attempted on an update.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/ne-wuapi-updateoperation
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct UpdateOperation {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Under the security context of the caller, install the update on the target computer.
     * @type {Integer (Int32)}
     */
    static uoInstallation => 1

    /**
     * Under the security context of the caller, uninstall the updates  from the target computer.
     * @type {Integer (Int32)}
     */
    static uoUninstallation => 2
}
