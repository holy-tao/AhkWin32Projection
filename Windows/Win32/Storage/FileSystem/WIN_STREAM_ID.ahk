#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct WIN_STREAM_ID {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static BACKUP_ALTERNATE_DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BACKUP_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BACKUP_EA_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BACKUP_LINK => 5

    /**
     * @type {Integer (UInt32)}
     */
    static BACKUP_OBJECT_ID => 7

    /**
     * @type {Integer (UInt32)}
     */
    static BACKUP_PROPERTY_DATA => 6

    /**
     * @type {Integer (UInt32)}
     */
    static BACKUP_REPARSE_DATA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BACKUP_SECURITY_DATA => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BACKUP_SPARSE_BLOCK => 9

    /**
     * @type {Integer (UInt32)}
     */
    static BACKUP_TXFS_DATA => 10
}
