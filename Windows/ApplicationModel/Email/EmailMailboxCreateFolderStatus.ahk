#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the result of a call to [TryCreateFolderAsync](emailmailbox_trycreatefolderasync_142768409.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxcreatefolderstatus
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxCreateFolderStatus extends Win32Enum{

    /**
     * The folder was created successfully.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * There was a network error while trying to create the folder.
     * @type {Integer (Int32)}
     */
    static NetworkError => 1

    /**
     * There was a permissions error while trying to create the folder.
     * @type {Integer (Int32)}
     */
    static PermissionsError => 2

    /**
     * There was a server error while trying to create the folder.
     * @type {Integer (Int32)}
     */
    static ServerError => 3

    /**
     * Folder creation failed for an unknown reason.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 4

    /**
     * The folder already exists.
     * @type {Integer (Int32)}
     */
    static NameCollision => 5

    /**
     * The server rejected the request to create a new folder.
     * @type {Integer (Int32)}
     */
    static ServerRejected => 6
}
