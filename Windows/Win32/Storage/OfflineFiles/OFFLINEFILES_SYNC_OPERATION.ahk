#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of sync operation that was being performed when a sync error was encountered.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/ne-cscobj-offlinefiles_sync_operation
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
class OFFLINEFILES_SYNC_OPERATION extends Win32Enum {

    /**
     * Operation was creating a new file or directory copy on the server.
     * Native name: OFFLINEFILES_SYNC_OPERATION_CREATE_COPY_ON_SERVER
     * @type {Integer (Int32)}
     */
    static CREATE_COPY_ON_SERVER => 0

    /**
     * Operation was creating a new file or directory copy on the client.
     * Native name: OFFLINEFILES_SYNC_OPERATION_CREATE_COPY_ON_CLIENT
     * @type {Integer (Int32)}
     */
    static CREATE_COPY_ON_CLIENT => 1

    /**
     * Operation was synchronizing a file or directory from the client to the server.
     * Native name: OFFLINEFILES_SYNC_OPERATION_SYNC_TO_SERVER
     * @type {Integer (Int32)}
     */
    static SYNC_TO_SERVER => 2

    /**
     * Operation was synchronizing a file or directory from the server to the client.
     * Native name: OFFLINEFILES_SYNC_OPERATION_SYNC_TO_CLIENT
     * @type {Integer (Int32)}
     */
    static SYNC_TO_CLIENT => 3

    /**
     * Operation was deleting a copy from the server.
     * Native name: OFFLINEFILES_SYNC_OPERATION_DELETE_SERVER_COPY
     * @type {Integer (Int32)}
     */
    static DELETE_SERVER_COPY => 4

    /**
     * Operation was deleting a copy from the local cache on the client.
     * Native name: OFFLINEFILES_SYNC_OPERATION_DELETE_CLIENT_COPY
     * @type {Integer (Int32)}
     */
    static DELETE_CLIENT_COPY => 5

    /**
     * Operation was pinning a file or directory into the local cache.
     * Native name: OFFLINEFILES_SYNC_OPERATION_PIN
     * @type {Integer (Int32)}
     */
    static PIN => 6

    /**
     * Operation was preparing for the synchronization.  Preparation involves obtaining directory listings from the client and server, comparing the two, and building a list of items to be synchronized.
     * Native name: OFFLINEFILES_SYNC_OPERATION_PREPARE
     * @type {Integer (Int32)}
     */
    static PREPARE => 7
}
