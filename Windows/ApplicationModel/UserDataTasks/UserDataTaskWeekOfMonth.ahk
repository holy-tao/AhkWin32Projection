#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the week of the month for which the task occurs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskweekofmonth
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskWeekOfMonth extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static First => 0

    /**
     * @type {Integer (Int32)}
     */
    static Second => 1

    /**
     * @type {Integer (Int32)}
     */
    static Third => 2

    /**
     * @type {Integer (Int32)}
     */
    static Fourth => 3

    /**
     * @type {Integer (Int32)}
     */
    static Last => 4
}
