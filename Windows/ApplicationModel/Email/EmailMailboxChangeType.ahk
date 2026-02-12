#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the type of change made to the mailbox item.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxchangetype
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxChangeType extends Win32Enum{

    /**
     * A message was created.
     * @type {Integer (Int32)}
     */
    static MessageCreated => 0

    /**
     * A message was modified.
     * @type {Integer (Int32)}
     */
    static MessageModified => 1

    /**
     * A message was deleted.
     * @type {Integer (Int32)}
     */
    static MessageDeleted => 2

    /**
     * A folder was created.
     * @type {Integer (Int32)}
     */
    static FolderCreated => 3

    /**
     * A folder was modified.
     * @type {Integer (Int32)}
     */
    static FolderModified => 4

    /**
     * A folder was deleted.
     * @type {Integer (Int32)}
     */
    static FolderDeleted => 5

    /**
     * Change unknown because change tracking was lost.
     * @type {Integer (Int32)}
     */
    static ChangeTrackingLost => 6
}
