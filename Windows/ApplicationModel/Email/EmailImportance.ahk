#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the importance of an email message.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailimportance
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailImportance extends Win32Enum{

    /**
     * The email message is of normal importance.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * The email message is of high importance.
     * @type {Integer (Int32)}
     */
    static High => 1

    /**
     * The email message is of low importance.
     * @type {Integer (Int32)}
     */
    static Low => 2
}
