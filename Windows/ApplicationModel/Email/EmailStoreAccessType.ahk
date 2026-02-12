#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the scope for store access.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailstoreaccesstype
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailStoreAccessType extends Win32Enum{

    /**
     * Full access to all APIs.
     * @type {Integer (Int32)}
     */
    static AppMailboxesReadWrite => 0

    /**
     * Scope limited to read all data but only call write APIs that are on the mailbox and do not save.
     * @type {Integer (Int32)}
     */
    static AllMailboxesLimitedReadWrite => 1
}
