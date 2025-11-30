#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of sync operation that was being performed when a sync error was encountered.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/ne-cscobj-offlinefiles_sync_operation
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class OFFLINEFILES_SYNC_OPERATION extends Win32Enum{

    /**
     * Operation was creating a new file or directory copy on the server.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_OPERATION_CREATE_COPY_ON_SERVER => 0

    /**
     * Operation was creating a new file or directory copy on the client.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_OPERATION_CREATE_COPY_ON_CLIENT => 1

    /**
     * Operation was synchronizing a file or directory from the client to the server.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_OPERATION_SYNC_TO_SERVER => 2

    /**
     * Operation was synchronizing a file or directory from the server to the client.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_OPERATION_SYNC_TO_CLIENT => 3

    /**
     * Operation was deleting a copy from the server.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_OPERATION_DELETE_SERVER_COPY => 4

    /**
     * Operation was deleting a copy from the local cache on the client.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_OPERATION_DELETE_CLIENT_COPY => 5

    /**
     * Operation was pinning a file or directory into the local cache.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_OPERATION_PIN => 6

    /**
     * Operation was preparing for the synchronization.  Preparation involves obtaining directory listings from the client and server, comparing the two, and building a list of items to be synchronized.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_OPERATION_PREPARE => 7
}
