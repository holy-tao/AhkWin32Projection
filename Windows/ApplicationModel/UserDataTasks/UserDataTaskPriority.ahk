#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the priority of the task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskpriority
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskPriority extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * @type {Integer (Int32)}
     */
    static Low => -1

    /**
     * @type {Integer (Int32)}
     */
    static High => 1
}
