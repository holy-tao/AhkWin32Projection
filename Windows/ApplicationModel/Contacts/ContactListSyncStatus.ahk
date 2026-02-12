#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the [ContactList](contactlist.md) sync status.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncstatus
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactListSyncStatus extends Win32Enum{

    /**
     * Idle.
     * @type {Integer (Int32)}
     */
    static Idle => 0

    /**
     * Currently syncing.
     * @type {Integer (Int32)}
     */
    static Syncing => 1

    /**
     * The contact list is up-to-date.
     * @type {Integer (Int32)}
     */
    static UpToDate => 2

    /**
     * There was an authentication error.
     * @type {Integer (Int32)}
     */
    static AuthenticationError => 3

    /**
     * There was a policy error.
     * @type {Integer (Int32)}
     */
    static PolicyError => 4

    /**
     * An unknown error occurred.
     * @type {Integer (Int32)}
     */
    static UnknownError => 5

    /**
     * The account must be manually removed.
     * @type {Integer (Int32)}
     */
    static ManualAccountRemovalRequired => 6
}
