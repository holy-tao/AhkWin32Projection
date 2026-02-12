#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the type of task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskkind
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Single => 0

    /**
     * @type {Integer (Int32)}
     */
    static Recurring => 1

    /**
     * @type {Integer (Int32)}
     */
    static Regenerating => 2
}
