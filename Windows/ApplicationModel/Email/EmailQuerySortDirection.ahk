#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the order in which to sort query results.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailquerysortdirection
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailQuerySortDirection extends Win32Enum{

    /**
     * Sort query results in descending order.
     * @type {Integer (Int32)}
     */
    static Descending => 0

    /**
     * Sort query results in ascending order.
     * @type {Integer (Int32)}
     */
    static Ascending => 1
}
