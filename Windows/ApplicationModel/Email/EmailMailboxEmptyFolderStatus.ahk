#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the result of a call to [TryEmptyFolderAsync](emailmailbox_tryemptyfolderasync_1505533787.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxemptyfolderstatus
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxEmptyFolderStatus extends Win32Enum{

    /**
     * The folder was successfully emptied.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * There was a network error while trying to empty the folder.
     * @type {Integer (Int32)}
     */
    static NetworkError => 1

    /**
     * There was a permissions error while trying to empty the folder.
     * @type {Integer (Int32)}
     */
    static PermissionsError => 2

    /**
     * There was a server error while trying to empty the folder.
     * @type {Integer (Int32)}
     */
    static ServerError => 3

    /**
     * There was an unknown error while trying to empty the folder.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 4

    /**
     * An error occurred while deleting parts of the folder.
     * @type {Integer (Int32)}
     */
    static CouldNotDeleteEverything => 5
}
