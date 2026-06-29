#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the type of user.
 * @remarks
 * The AutomaticUpdatesUserType is used in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings2-checkpermission">IAutomaticUpdatesSettings2::CheckPermission</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/ne-wuapi-automaticupdatesusertype
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct AutomaticUpdatesUserType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The context of the current user.
     * @type {Integer (Int32)}
     */
    static auutCurrentUser => 1

    /**
     * Any administrator on the local computer.
     * @type {Integer (Int32)}
     */
    static auutLocalAdministrator => 2
}
