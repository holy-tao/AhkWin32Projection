#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the level of task read access granted to other apps.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklistotherappreadaccess
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskListOtherAppReadAccess extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Full => 0

    /**
     * @type {Integer (Int32)}
     */
    static SystemOnly => 1

    /**
     * @type {Integer (Int32)}
     */
    static None => 2
}
