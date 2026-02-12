#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the frequency for which a task occurs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskregenerationunit
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskRegenerationUnit extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Daily => 0

    /**
     * @type {Integer (Int32)}
     */
    static Weekly => 1

    /**
     * @type {Integer (Int32)}
     */
    static Monthly => 2

    /**
     * @type {Integer (Int32)}
     */
    static Yearly => 4
}
