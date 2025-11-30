#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_FLAGS_AND_ATTRIBUTES extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_READONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_HIDDEN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_SYSTEM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_DIRECTORY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_ARCHIVE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_DEVICE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_NORMAL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_TEMPORARY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_SPARSE_FILE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_REPARSE_POINT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_COMPRESSED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_OFFLINE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_NOT_CONTENT_INDEXED => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_ENCRYPTED => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_INTEGRITY_STREAM => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_VIRTUAL => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_NO_SCRUB_DATA => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_EA => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_PINNED => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_UNPINNED => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_RECALL_ON_OPEN => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_RECALL_ON_DATA_ACCESS => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_FLAG_WRITE_THROUGH => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_FLAG_OVERLAPPED => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_FLAG_NO_BUFFERING => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_FLAG_RANDOM_ACCESS => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_FLAG_SEQUENTIAL_SCAN => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_FLAG_DELETE_ON_CLOSE => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_FLAG_BACKUP_SEMANTICS => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_FLAG_POSIX_SEMANTICS => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_FLAG_SESSION_AWARE => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_FLAG_OPEN_REPARSE_POINT => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_FLAG_OPEN_NO_RECALL => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_FLAG_FIRST_PIPE_INSTANCE => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_ACCESS_DUPLEX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_ACCESS_INBOUND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_ACCESS_OUTBOUND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_ANONYMOUS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_IDENTIFICATION => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_IMPERSONATION => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_DELEGATION => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_CONTEXT_TRACKING => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_EFFECTIVE_ONLY => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_SQOS_PRESENT => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_VALID_SQOS_FLAGS => 2031616
}
