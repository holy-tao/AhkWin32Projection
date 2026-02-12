#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the result of a call to [TryDeleteFolderAsync](emailmailbox_trydeletefolderasync_1435582098.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxdeletefolderstatus
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxDeleteFolderStatus extends Win32Enum{

    /**
     * The folder was successfully deleted.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * There was a network error while trying to delete the folder.
     * @type {Integer (Int32)}
     */
    static NetworkError => 1

    /**
     * There was a permissions error while trying to delete the folder.
     * @type {Integer (Int32)}
     */
    static PermissionsError => 2

    /**
     * There was a server error while trying to delete the folder.
     * @type {Integer (Int32)}
     */
    static ServerError => 3

    /**
     * Folder deletion failed for an unknown reason.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 4

    /**
     * An error occurred while deleting parts of the folder.
     * @type {Integer (Int32)}
     */
    static CouldNotDeleteEverything => 5
}
