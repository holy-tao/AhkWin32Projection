#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the type of access the app has to the [UserDataTaskStore](userdatataskstore.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskstoreaccesstype
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskStoreAccessType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AppTasksReadWrite => 0

    /**
     * @type {Integer (Int32)}
     */
    static AllTasksLimitedReadWrite => 1
}
