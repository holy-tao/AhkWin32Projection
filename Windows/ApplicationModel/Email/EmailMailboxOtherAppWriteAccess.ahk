#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines whether an application can write to a mailbox.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxotherappwriteaccess
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxOtherAppWriteAccess extends Win32Enum{

    /**
     * No external applications may write to this mailbox.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Specific applications may write to this mailbox.
     * @type {Integer (Int32)}
     */
    static Limited => 1
}
