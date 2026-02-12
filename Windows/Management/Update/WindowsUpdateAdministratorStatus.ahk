#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify status codes to indicate whether the registration/unregistration of a Windows update administrator succeeded.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateadministratorstatus
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsUpdateAdministratorStatus extends Win32Enum{

    /**
     * The requested operation completed successfully.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * The operation failed due to no Windows Update administrator being previously registered.
     * @type {Integer (Int32)}
     */
    static NoAdministratorRegistered => 1

    /**
     * The operation failed due to another Windows Update administrator already being registered.
     * @type {Integer (Int32)}
     */
    static OtherAdministratorIsRegistered => 2
}
