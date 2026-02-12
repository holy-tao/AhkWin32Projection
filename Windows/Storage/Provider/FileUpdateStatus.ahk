#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the status of a file update request.
 * @remarks
 * If your app participates in the Cached File Updater contract, you use this enumeration to communicate the status of a file update request to another app that initiated the update (for example, by calling [CachedFileManager.CompleteUpdatesAsync](../windows.storage/cachedfilemanager_completeupdatesasync_1507988567.md)).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.fileupdatestatus
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class FileUpdateStatus extends Win32Enum{

    /**
     * The file update was not fully completed and should be retried.
     * @type {Integer (Int32)}
     */
    static Incomplete => 0

    /**
     * The file update was completed successfully.
     * @type {Integer (Int32)}
     */
    static Complete => 1

    /**
     * User input (like credentials) is needed to update the file.
     * @type {Integer (Int32)}
     */
    static UserInputNeeded => 2

    /**
     * The remote version of the file was not updated because the storage location wasn't available. The file remains valid and subsequent updates to the file may succeed.
     * @type {Integer (Int32)}
     */
    static CurrentlyUnavailable => 3

    /**
     * The file is now invalid and can't be updated now or in the future. For example, this could occur if the remote version of the file was deleted.
     * @type {Integer (Int32)}
     */
    static Failed => 4

    /**
     * The file update was completed successfully and the file has been renamed. For example, this could occur if the user chose to save their changes under a different file name because of conflicting changes made to the remote version of the file.
     * @type {Integer (Int32)}
     */
    static CompleteAndRenamed => 5
}
