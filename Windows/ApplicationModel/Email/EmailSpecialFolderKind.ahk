#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the email special folders.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailspecialfolderkind
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailSpecialFolderKind extends Win32Enum{

    /**
     * This is not a special folder.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * This is the root folder.
     * @type {Integer (Int32)}
     */
    static Root => 1

    /**
     * This is the inbox folder.
     * @type {Integer (Int32)}
     */
    static Inbox => 2

    /**
     * This is the outbox folder.
     * @type {Integer (Int32)}
     */
    static Outbox => 3

    /**
     * This is the drafts folder.
     * @type {Integer (Int32)}
     */
    static Drafts => 4

    /**
     * This is the deleted items folder.
     * @type {Integer (Int32)}
     */
    static DeletedItems => 5

    /**
     * This is the sent items folder.
     * @type {Integer (Int32)}
     */
    static Sent => 6
}
