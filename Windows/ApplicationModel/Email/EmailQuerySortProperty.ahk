#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The property by which to sort. Currently limited to date.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailquerysortproperty
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailQuerySortProperty extends Win32Enum{

    /**
     * Sort by date.
     * @type {Integer (Int32)}
     */
    static Date => 0
}
