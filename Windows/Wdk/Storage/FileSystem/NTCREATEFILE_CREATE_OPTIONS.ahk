#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class NTCREATEFILE_CREATE_OPTIONS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DIRECTORY_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NON_DIRECTORY_FILE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_WRITE_THROUGH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SEQUENTIAL_ONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_RANDOM_ACCESS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NO_INTERMEDIATE_BUFFERING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SYNCHRONOUS_IO_ALERT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SYNCHRONOUS_IO_NONALERT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CREATE_TREE_CONNECTION => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NO_EA_KNOWLEDGE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OPEN_REPARSE_POINT => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DELETE_ON_CLOSE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OPEN_BY_FILE_ID => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OPEN_FOR_BACKUP_INTENT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_RESERVE_OPFILTER => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OPEN_REQUIRING_OPLOCK => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_COMPLETE_IF_OPLOCKED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OPEN_FOR_FREE_SPACE_QUERY => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CONTAINS_EXTENDED_CREATE_INFORMATION => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NO_COMPRESSION => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DISALLOW_EXCLUSIVE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SESSION_AWARE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OPEN_NO_RECALL => 4194304
}
