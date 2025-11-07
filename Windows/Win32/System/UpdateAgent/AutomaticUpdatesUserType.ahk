#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the type of user.
 * @remarks
 * 
 * The AutomaticUpdatesUserType is used in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings2-checkpermission">IAutomaticUpdatesSettings2::CheckPermission</a> method.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/ne-wuapi-automaticupdatesusertype
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class AutomaticUpdatesUserType{

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
