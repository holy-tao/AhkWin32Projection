#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the sync state of an Offline Files item.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/ne-cscobj-offlinefiles_sync_state
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
class OFFLINEFILES_SYNC_STATE extends Win32Enum {

    /**
     * The client and server copies of the file are in sync.
     * Native name: OFFLINEFILES_SYNC_STATE_Stable
     * @type {Integer (Int32)}
     */
    static Stable => 0

    /**
     * The file exists on the client. The directory exists on the server.
     * Native name: OFFLINEFILES_SYNC_STATE_FileOnClient_DirOnServer
     * @type {Integer (Int32)}
     */
    static FileOnClient_DirOnServer => 1

    /**
     * The file exists only on the client.
     * Native name: OFFLINEFILES_SYNC_STATE_FileOnClient_NoServerCopy
     * @type {Integer (Int32)}
     */
    static FileOnClient_NoServerCopy => 2

    /**
     * The directory exists on the client. The file exists on the server.
     * Native name: OFFLINEFILES_SYNC_STATE_DirOnClient_FileOnServer
     * @type {Integer (Int32)}
     */
    static DirOnClient_FileOnServer => 3

    /**
     * The directory exists on the client. The server copy of the file has changed.
     * Native name: OFFLINEFILES_SYNC_STATE_DirOnClient_FileChangedOnServer
     * @type {Integer (Int32)}
     */
    static DirOnClient_FileChangedOnServer => 4

    /**
     * The directory exists only on the client.
     * Native name: OFFLINEFILES_SYNC_STATE_DirOnClient_NoServerCopy
     * @type {Integer (Int32)}
     */
    static DirOnClient_NoServerCopy => 5

    /**
     * The file was created on the client. There is no server copy of the file.
     * Native name: OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_NoServerCopy
     * @type {Integer (Int32)}
     */
    static FileCreatedOnClient_NoServerCopy => 6

    /**
     * The file was created on the client. The server copy of the file has changed.
     * Native name: OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_FileChangedOnServer
     * @type {Integer (Int32)}
     */
    static FileCreatedOnClient_FileChangedOnServer => 7

    /**
     * The file was created on the client. The directory on the server has changed.
     * Native name: OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_DirChangedOnServer
     * @type {Integer (Int32)}
     */
    static FileCreatedOnClient_DirChangedOnServer => 8

    /**
     * The file was created on the client. The server has a file with the same name.
     * Native name: OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_FileOnServer
     * @type {Integer (Int32)}
     */
    static FileCreatedOnClient_FileOnServer => 9

    /**
     * The file was created on the client. A directory with the same name exists on the server.
     * Native name: OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_DirOnServer
     * @type {Integer (Int32)}
     */
    static FileCreatedOnClient_DirOnServer => 10

    /**
     * The file was created on the client. The server copy of the file was deleted.
     * Native name: OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_DeletedOnServer
     * @type {Integer (Int32)}
     */
    static FileCreatedOnClient_DeletedOnServer => 11

    /**
     * The client copy of the file has changed. The server copy of the file has changed. This value represents the classic change/change sync conflict.
     * Native name: OFFLINEFILES_SYNC_STATE_FileChangedOnClient_ChangedOnServer
     * @type {Integer (Int32)}
     */
    static FileChangedOnClient_ChangedOnServer => 12

    /**
     * The client copy of the file has changed. The directory exists on the server.
     * Native name: OFFLINEFILES_SYNC_STATE_FileChangedOnClient_DirOnServer
     * @type {Integer (Int32)}
     */
    static FileChangedOnClient_DirOnServer => 13

    /**
     * The client copy of the file has changed. The directory on the server has changed.
     * Native name: OFFLINEFILES_SYNC_STATE_FileChangedOnClient_DirChangedOnServer
     * @type {Integer (Int32)}
     */
    static FileChangedOnClient_DirChangedOnServer => 14

    /**
     * The client copy of the file has changed. The server copy of the file has been deleted.
     * Native name: OFFLINEFILES_SYNC_STATE_FileChangedOnClient_DeletedOnServer
     * @type {Integer (Int32)}
     */
    static FileChangedOnClient_DeletedOnServer => 15

    /**
     * The file is sparsely cached on the client. The server copy of the file has changed.
     * Native name: OFFLINEFILES_SYNC_STATE_FileSparseOnClient_ChangedOnServer
     * @type {Integer (Int32)}
     */
    static FileSparseOnClient_ChangedOnServer => 16

    /**
     * The file is sparsely cached on the client. The server copy of the file has been deleted.
     * Native name: OFFLINEFILES_SYNC_STATE_FileSparseOnClient_DeletedOnServer
     * @type {Integer (Int32)}
     */
    static FileSparseOnClient_DeletedOnServer => 17

    /**
     * The file is sparsely cached on the client. The directory exists on the server.
     * Native name: OFFLINEFILES_SYNC_STATE_FileSparseOnClient_DirOnServer
     * @type {Integer (Int32)}
     */
    static FileSparseOnClient_DirOnServer => 18

    /**
     * The file is sparsely cached on the client. The directory on the server has changed.
     * Native name: OFFLINEFILES_SYNC_STATE_FileSparseOnClient_DirChangedOnServer
     * @type {Integer (Int32)}
     */
    static FileSparseOnClient_DirChangedOnServer => 19

    /**
     * The directory has been created on the client. There is no server copy of the directory.
     * Native name: OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_NoServerCopy
     * @type {Integer (Int32)}
     */
    static DirCreatedOnClient_NoServerCopy => 20

    /**
     * The directory has been created on the client. A directory with the same name exists on the server.
     * Native name: OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_DirOnServer
     * @type {Integer (Int32)}
     */
    static DirCreatedOnClient_DirOnServer => 21

    /**
     * The directory has been created on the client. A file with the same name exists on the server.
     * Native name: OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_FileOnServer
     * @type {Integer (Int32)}
     */
    static DirCreatedOnClient_FileOnServer => 22

    /**
     * The directory has been created on the client. The server copy of the file has changed.
     * Native name: OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_FileChangedOnServer
     * @type {Integer (Int32)}
     */
    static DirCreatedOnClient_FileChangedOnServer => 23

    /**
     * The directory has been created on the client. The directory on the server has changed.
     * Native name: OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_DirChangedOnServer
     * @type {Integer (Int32)}
     */
    static DirCreatedOnClient_DirChangedOnServer => 24

    /**
     * The directory has been created on the client. The directory on the server has been deleted.
     * Native name: OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_DeletedOnServer
     * @type {Integer (Int32)}
     */
    static DirCreatedOnClient_DeletedOnServer => 25

    /**
     * The client directory has changed. The server has a copy of the file.
     * Native name: OFFLINEFILES_SYNC_STATE_DirChangedOnClient_FileOnServer
     * @type {Integer (Int32)}
     */
    static DirChangedOnClient_FileOnServer => 26

    /**
     * The client directory has changed. The server copy of the file has been changed.
     * Native name: OFFLINEFILES_SYNC_STATE_DirChangedOnClient_FileChangedOnServer
     * @type {Integer (Int32)}
     */
    static DirChangedOnClient_FileChangedOnServer => 27

    /**
     * The client directory has changed. The server directory has also changed.
     * Native name: OFFLINEFILES_SYNC_STATE_DirChangedOnClient_ChangedOnServer
     * @type {Integer (Int32)}
     */
    static DirChangedOnClient_ChangedOnServer => 28

    /**
     * The client directory has changed. The directory on the server has been deleted.
     * Native name: OFFLINEFILES_SYNC_STATE_DirChangedOnClient_DeletedOnServer
     * @type {Integer (Int32)}
     */
    static DirChangedOnClient_DeletedOnServer => 29

    /**
     * The file exists only on the server.
     * Native name: OFFLINEFILES_SYNC_STATE_NoClientCopy_FileOnServer
     * @type {Integer (Int32)}
     */
    static NoClientCopy_FileOnServer => 30

    /**
     * The directory exists only on the server.
     * Native name: OFFLINEFILES_SYNC_STATE_NoClientCopy_DirOnServer
     * @type {Integer (Int32)}
     */
    static NoClientCopy_DirOnServer => 31

    /**
     * The file exists only on the server, and the server copy of the file has changed.
     * Native name: OFFLINEFILES_SYNC_STATE_NoClientCopy_FileChangedOnServer
     * @type {Integer (Int32)}
     */
    static NoClientCopy_FileChangedOnServer => 32

    /**
     * The directory exists only on the server, and the server directory has changed.
     * Native name: OFFLINEFILES_SYNC_STATE_NoClientCopy_DirChangedOnServer
     * @type {Integer (Int32)}
     */
    static NoClientCopy_DirChangedOnServer => 33

    /**
     * The file exists only on the server, because the client copy of the file has been deleted.
     * Native name: OFFLINEFILES_SYNC_STATE_DeletedOnClient_FileOnServer
     * @type {Integer (Int32)}
     */
    static DeletedOnClient_FileOnServer => 34

    /**
     * The directory exists only on the server, because the client directory has been deleted.
     * Native name: OFFLINEFILES_SYNC_STATE_DeletedOnClient_DirOnServer
     * @type {Integer (Int32)}
     */
    static DeletedOnClient_DirOnServer => 35

    /**
     * The client copy of the file has been deleted, and the server copy of the file has changed. This value represents the classic delete/change conflict.
     * Native name: OFFLINEFILES_SYNC_STATE_DeletedOnClient_FileChangedOnServer
     * @type {Integer (Int32)}
     */
    static DeletedOnClient_FileChangedOnServer => 36

    /**
     * The client copy of the directory has been deleted, and the server copy of the directory has changed.
     * Native name: OFFLINEFILES_SYNC_STATE_DeletedOnClient_DirChangedOnServer
     * @type {Integer (Int32)}
     */
    static DeletedOnClient_DirChangedOnServer => 37

    /**
     * The file is sparsely cached on the client.
     * Native name: OFFLINEFILES_SYNC_STATE_FileSparseOnClient
     * @type {Integer (Int32)}
     */
    static FileSparseOnClient => 38

    /**
     * The file has been changed on the client.
     * Native name: OFFLINEFILES_SYNC_STATE_FileChangedOnClient
     * @type {Integer (Int32)}
     */
    static FileChangedOnClient => 39

    /**
     * This value is reserved for future use.
     * Native name: OFFLINEFILES_SYNC_STATE_FileRenamedOnClient
     * @type {Integer (Int32)}
     */
    static FileRenamedOnClient => 40

    /**
     * The directory is sparsely cached on the client.
     * Native name: OFFLINEFILES_SYNC_STATE_DirSparseOnClient
     * @type {Integer (Int32)}
     */
    static DirSparseOnClient => 41

    /**
     * The directory has been changed on the client.
     * Native name: OFFLINEFILES_SYNC_STATE_DirChangedOnClient
     * @type {Integer (Int32)}
     */
    static DirChangedOnClient => 42

    /**
     * This value is reserved for future use.
     * Native name: OFFLINEFILES_SYNC_STATE_DirRenamedOnClient
     * @type {Integer (Int32)}
     */
    static DirRenamedOnClient => 43

    /**
     * The server copy of the file has been changed.
     * Native name: OFFLINEFILES_SYNC_STATE_FileChangedOnServer
     * @type {Integer (Int32)}
     */
    static FileChangedOnServer => 44

    /**
     * This value is reserved for future use.
     * Native name: OFFLINEFILES_SYNC_STATE_FileRenamedOnServer
     * @type {Integer (Int32)}
     */
    static FileRenamedOnServer => 45

    /**
     * The server copy of the file has been deleted.
     * Native name: OFFLINEFILES_SYNC_STATE_FileDeletedOnServer
     * @type {Integer (Int32)}
     */
    static FileDeletedOnServer => 46

    /**
     * The server directory has been changed.
     * Native name: OFFLINEFILES_SYNC_STATE_DirChangedOnServer
     * @type {Integer (Int32)}
     */
    static DirChangedOnServer => 47

    /**
     * This value is reserved for future use.
     * Native name: OFFLINEFILES_SYNC_STATE_DirRenamedOnServer
     * @type {Integer (Int32)}
     */
    static DirRenamedOnServer => 48

    /**
     * The server directory has been deleted.
     * Native name: OFFLINEFILES_SYNC_STATE_DirDeletedOnServer
     * @type {Integer (Int32)}
     */
    static DirDeletedOnServer => 49

    /**
     * The file has been replaced and deleted on the client. The server has a copy of the file.
     * Native name: OFFLINEFILES_SYNC_STATE_FileReplacedAndDeletedOnClient_FileOnServer
     * @type {Integer (Int32)}
     */
    static FileReplacedAndDeletedOnClient_FileOnServer => 50

    /**
     * The file has been replaced and deleted on the client. The server copy of the file has changed.
     * Native name: OFFLINEFILES_SYNC_STATE_FileReplacedAndDeletedOnClient_FileChangedOnServer
     * @type {Integer (Int32)}
     */
    static FileReplacedAndDeletedOnClient_FileChangedOnServer => 51

    /**
     * The file has been replaced and deleted on the client. The directory exists on the server.
     * Native name: OFFLINEFILES_SYNC_STATE_FileReplacedAndDeletedOnClient_DirOnServer
     * @type {Integer (Int32)}
     */
    static FileReplacedAndDeletedOnClient_DirOnServer => 52

    /**
     * The file has been replaced and deleted on the client. The directory has changed on the server.
     * Native name: OFFLINEFILES_SYNC_STATE_FileReplacedAndDeletedOnClient_DirChangedOnServer
     * @type {Integer (Int32)}
     */
    static FileReplacedAndDeletedOnClient_DirChangedOnServer => 53

    /**
     * Native name: OFFLINEFILES_SYNC_STATE_NUMSTATES
     * @type {Integer (Int32)}
     */
    static NUMSTATES => 54
}
