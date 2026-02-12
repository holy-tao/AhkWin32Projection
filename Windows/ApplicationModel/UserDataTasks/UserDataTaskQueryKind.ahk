#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the type of task query.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskquerykind
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskQueryKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static All => 0

    /**
     * @type {Integer (Int32)}
     */
    static Incomplete => 1

    /**
     * @type {Integer (Int32)}
     */
    static Complete => 2
}
