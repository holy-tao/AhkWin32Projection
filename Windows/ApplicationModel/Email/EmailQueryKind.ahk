#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the type of email query.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailquerykind
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailQueryKind extends Win32Enum{

    /**
     * The query is for all email messages.
     * @type {Integer (Int32)}
     */
    static All => 0

    /**
     * The query is for email messages marked Important.
     * @type {Integer (Int32)}
     */
    static Important => 1

    /**
     * The query is for email messages that have been flagged.
     * @type {Integer (Int32)}
     */
    static Flagged => 2

    /**
     * The query is for all unread email messages.
     * @type {Integer (Int32)}
     */
    static Unread => 3

    /**
     * The query is for all email messages that have been read.
     * @type {Integer (Int32)}
     */
    static Read => 4

    /**
     * The query is for all email messages that have not yet been seen.
     * @type {Integer (Int32)}
     */
    static Unseen => 5
}
