#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the sensitivity of a task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasksensitivity
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskSensitivity extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Public => 0

    /**
     * @type {Integer (Int32)}
     */
    static Private => 1
}
