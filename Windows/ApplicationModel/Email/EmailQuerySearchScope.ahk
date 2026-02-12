#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the scope of a query.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailquerysearchscope
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailQuerySearchScope extends Win32Enum{

    /**
     * Query only the local email message collection.
     * @type {Integer (Int32)}
     */
    static Local => 0

    /**
     * Query the entire email message collection contained on the email server.
     * @type {Integer (Int32)}
     */
    static Server => 1
}
