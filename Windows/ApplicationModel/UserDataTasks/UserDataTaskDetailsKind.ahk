#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the type of content in task details.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskdetailskind
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskDetailsKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PlainText => 0

    /**
     * @type {Integer (Int32)}
     */
    static Html => 1
}
