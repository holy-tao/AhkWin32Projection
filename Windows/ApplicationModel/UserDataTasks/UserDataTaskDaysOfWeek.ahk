#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the days of the week on which an task occurs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskdaysofweek
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskDaysOfWeek extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * @type {Integer (UInt32)}
     */
    static Sunday => 1

    /**
     * @type {Integer (UInt32)}
     */
    static Monday => 2

    /**
     * @type {Integer (UInt32)}
     */
    static Tuesday => 4

    /**
     * @type {Integer (UInt32)}
     */
    static Wednesday => 8

    /**
     * @type {Integer (UInt32)}
     */
    static Thursday => 16

    /**
     * @type {Integer (UInt32)}
     */
    static Friday => 32

    /**
     * @type {Integer (UInt32)}
     */
    static Saturday => 64
}
