#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines whether an application can read from a mailbox.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxotherappreadaccess
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxOtherAppReadAccess extends Win32Enum{

    /**
     * Only system level applications can read from this mailbox.
     * @type {Integer (Int32)}
     */
    static SystemOnly => 0

    /**
     * All applications can read from this mailbox.
     * @type {Integer (Int32)}
     */
    static Full => 1

    /**
     * No other apps can read from this mailbox.
     * @type {Integer (Int32)}
     */
    static None => 2
}
