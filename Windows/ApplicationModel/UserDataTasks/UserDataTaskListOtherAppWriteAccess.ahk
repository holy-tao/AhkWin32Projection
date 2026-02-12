#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the level of task write access granted to other apps.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklistotherappwriteaccess
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskListOtherAppWriteAccess extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Limited => 0

    /**
     * @type {Integer (Int32)}
     */
    static None => 1
}
