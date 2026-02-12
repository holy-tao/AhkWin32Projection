#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the sync status of the mailbox.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxsyncstatus
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxSyncStatus extends Win32Enum{

    /**
     * The mailbox is idle.
     * @type {Integer (Int32)}
     */
    static Idle => 0

    /**
     * The mailbox is currently syncing.
     * @type {Integer (Int32)}
     */
    static Syncing => 1

    /**
     * The mailbox is up to date.
     * @type {Integer (Int32)}
     */
    static UpToDate => 2

    /**
     * The mailbox has encountered an authentication error and cannot sync.
     * @type {Integer (Int32)}
     */
    static AuthenticationError => 3

    /**
     * The mailbox has encountered a policy error and cannot sync.
     * @type {Integer (Int32)}
     */
    static PolicyError => 4

    /**
     * The mailbox has encountered an unknown error and cannot sync.
     * @type {Integer (Int32)}
     */
    static UnknownError => 5

    /**
     * The account must be manually removed.
     * @type {Integer (Int32)}
     */
    static ManualAccountRemovalRequired => 6
}
