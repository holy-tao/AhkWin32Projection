#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the sync state of an Offline Files item.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/ne-cscobj-offlinefiles_sync_state
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class OFFLINEFILES_SYNC_STATE extends Win32Enum{

    /**
     * The client and server copies of the file are in sync.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_Stable => 0

    /**
     * The file exists on the client. The directory exists on the server.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileOnClient_DirOnServer => 1

    /**
     * The file exists only on the client.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileOnClient_NoServerCopy => 2

    /**
     * The directory exists on the client. The file exists on the server.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DirOnClient_FileOnServer => 3

    /**
     * The directory exists on the client. The server copy of the file has changed.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DirOnClient_FileChangedOnServer => 4

    /**
     * The directory exists only on the client.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DirOnClient_NoServerCopy => 5

    /**
     * The file was created on the client. There is no server copy of the file.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_NoServerCopy => 6

    /**
     * The file was created on the client. The server copy of the file has changed.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_FileChangedOnServer => 7

    /**
     * The file was created on the client. The directory on the server has changed.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_DirChangedOnServer => 8

    /**
     * The file was created on the client. The server has a file with the same name.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_FileOnServer => 9

    /**
     * The file was created on the client. A directory with the same name exists on the server.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_DirOnServer => 10

    /**
     * The file was created on the client. The server copy of the file was deleted.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_DeletedOnServer => 11

    /**
     * The client copy of the file has changed. The server copy of the file has changed. This value represents the classic change/change sync conflict.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileChangedOnClient_ChangedOnServer => 12

    /**
     * The client copy of the file has changed. The directory exists on the server.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileChangedOnClient_DirOnServer => 13

    /**
     * The client copy of the file has changed. The directory on the server has changed.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileChangedOnClient_DirChangedOnServer => 14

    /**
     * The client copy of the file has changed. The server copy of the file has been deleted.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileChangedOnClient_DeletedOnServer => 15

    /**
     * The file is sparsely cached on the client. The server copy of the file has changed.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileSparseOnClient_ChangedOnServer => 16

    /**
     * The file is sparsely cached on the client. The server copy of the file has been deleted.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileSparseOnClient_DeletedOnServer => 17

    /**
     * The file is sparsely cached on the client. The directory exists on the server.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileSparseOnClient_DirOnServer => 18

    /**
     * The file is sparsely cached on the client. The directory on the server has changed.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileSparseOnClient_DirChangedOnServer => 19

    /**
     * The directory has been created on the client. There is no server copy of the directory.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_NoServerCopy => 20

    /**
     * The directory has been created on the client. A directory with the same name exists on the server.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_DirOnServer => 21

    /**
     * The directory has been created on the client. A file with the same name exists on the server.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_FileOnServer => 22

    /**
     * The directory has been created on the client. The server copy of the file has changed.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_FileChangedOnServer => 23

    /**
     * The directory has been created on the client. The directory on the server has changed.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_DirChangedOnServer => 24

    /**
     * The directory has been created on the client. The directory on the server has been deleted.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_DeletedOnServer => 25

    /**
     * The client directory has changed. The server has a copy of the file.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DirChangedOnClient_FileOnServer => 26

    /**
     * The client directory has changed. The server copy of the file has been changed.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DirChangedOnClient_FileChangedOnServer => 27

    /**
     * The client directory has changed. The server directory has also changed.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DirChangedOnClient_ChangedOnServer => 28

    /**
     * The client directory has changed. The directory on the server has been deleted.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DirChangedOnClient_DeletedOnServer => 29

    /**
     * The file exists only on the server.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_NoClientCopy_FileOnServer => 30

    /**
     * The directory exists only on the server.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_NoClientCopy_DirOnServer => 31

    /**
     * The file exists only on the server, and the server copy of the file has changed.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_NoClientCopy_FileChangedOnServer => 32

    /**
     * The directory exists only on the server, and the server directory has changed.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_NoClientCopy_DirChangedOnServer => 33

    /**
     * The file exists only on the server, because the client copy of the file has been deleted.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DeletedOnClient_FileOnServer => 34

    /**
     * The directory exists only on the server, because the client directory has been deleted.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DeletedOnClient_DirOnServer => 35

    /**
     * The client copy of the file has been deleted, and the server copy of the file has changed. This value represents the classic delete/change conflict.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DeletedOnClient_FileChangedOnServer => 36

    /**
     * The client copy of the directory has been deleted, and the server copy of the directory has changed.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DeletedOnClient_DirChangedOnServer => 37

    /**
     * The file is sparsely cached on the client.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileSparseOnClient => 38

    /**
     * The file has been changed on the client.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileChangedOnClient => 39

    /**
     * This value is reserved for future use.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileRenamedOnClient => 40

    /**
     * The directory is sparsely cached on the client.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DirSparseOnClient => 41

    /**
     * The directory has been changed on the client.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DirChangedOnClient => 42

    /**
     * This value is reserved for future use.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DirRenamedOnClient => 43

    /**
     * The server copy of the file has been changed.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileChangedOnServer => 44

    /**
     * This value is reserved for future use.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileRenamedOnServer => 45

    /**
     * The server copy of the file has been deleted.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileDeletedOnServer => 46

    /**
     * The server directory has been changed.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DirChangedOnServer => 47

    /**
     * This value is reserved for future use.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DirRenamedOnServer => 48

    /**
     * The server directory has been deleted.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_DirDeletedOnServer => 49

    /**
     * The file has been replaced and deleted on the client. The server has a copy of the file.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileReplacedAndDeletedOnClient_FileOnServer => 50

    /**
     * The file has been replaced and deleted on the client. The server copy of the file has changed.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileReplacedAndDeletedOnClient_FileChangedOnServer => 51

    /**
     * The file has been replaced and deleted on the client. The directory exists on the server.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileReplacedAndDeletedOnClient_DirOnServer => 52

    /**
     * The file has been replaced and deleted on the client. The directory has changed on the server.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_FileReplacedAndDeletedOnClient_DirChangedOnServer => 53

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_STATE_NUMSTATES => 54
}
