#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines operations that can be attempted on an update.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/ne-wuapi-updateoperation
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class UpdateOperation extends Win32Enum{

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
