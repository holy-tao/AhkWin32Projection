#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class FILE_FLAGS_AND_ATTRIBUTES extends Win32BitflagEnum {

    /**
     * Native name: FILE_ATTRIBUTE_READONLY
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_READONLY => 1

    /**
     * Native name: FILE_ATTRIBUTE_HIDDEN
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_HIDDEN => 2

    /**
     * Native name: FILE_ATTRIBUTE_SYSTEM
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_SYSTEM => 4

    /**
     * Native name: FILE_ATTRIBUTE_DIRECTORY
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_DIRECTORY => 16

    /**
     * Native name: FILE_ATTRIBUTE_ARCHIVE
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_ARCHIVE => 32

    /**
     * Native name: FILE_ATTRIBUTE_DEVICE
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_DEVICE => 64

    /**
     * Native name: FILE_ATTRIBUTE_NORMAL
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_NORMAL => 128

    /**
     * Native name: FILE_ATTRIBUTE_TEMPORARY
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_TEMPORARY => 256

    /**
     * Native name: FILE_ATTRIBUTE_SPARSE_FILE
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_SPARSE_FILE => 512

    /**
     * Native name: FILE_ATTRIBUTE_REPARSE_POINT
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_REPARSE_POINT => 1024

    /**
     * Native name: FILE_ATTRIBUTE_COMPRESSED
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_COMPRESSED => 2048

    /**
     * Native name: FILE_ATTRIBUTE_OFFLINE
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_OFFLINE => 4096

    /**
     * Native name: FILE_ATTRIBUTE_NOT_CONTENT_INDEXED
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_NOT_CONTENT_INDEXED => 8192

    /**
     * Native name: FILE_ATTRIBUTE_ENCRYPTED
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_ENCRYPTED => 16384

    /**
     * Native name: FILE_ATTRIBUTE_INTEGRITY_STREAM
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_INTEGRITY_STREAM => 32768

    /**
     * Native name: FILE_ATTRIBUTE_VIRTUAL
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_VIRTUAL => 65536

    /**
     * Native name: FILE_ATTRIBUTE_NO_SCRUB_DATA
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_NO_SCRUB_DATA => 131072

    /**
     * Native name: FILE_ATTRIBUTE_EA
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_EA => 262144

    /**
     * Native name: FILE_ATTRIBUTE_PINNED
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_PINNED => 524288

    /**
     * Native name: FILE_ATTRIBUTE_UNPINNED
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_UNPINNED => 1048576

    /**
     * Native name: FILE_ATTRIBUTE_RECALL_ON_OPEN
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_RECALL_ON_OPEN => 262144

    /**
     * Native name: FILE_ATTRIBUTE_RECALL_ON_DATA_ACCESS
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_RECALL_ON_DATA_ACCESS => 4194304

    /**
     * Native name: FILE_FLAG_WRITE_THROUGH
     * @type {Integer (UInt32)}
     */
    static FLAG_WRITE_THROUGH => 2147483648

    /**
     * Native name: FILE_FLAG_OVERLAPPED
     * @type {Integer (UInt32)}
     */
    static FLAG_OVERLAPPED => 1073741824

    /**
     * Native name: FILE_FLAG_NO_BUFFERING
     * @type {Integer (UInt32)}
     */
    static FLAG_NO_BUFFERING => 536870912

    /**
     * Native name: FILE_FLAG_RANDOM_ACCESS
     * @type {Integer (UInt32)}
     */
    static FLAG_RANDOM_ACCESS => 268435456

    /**
     * Native name: FILE_FLAG_SEQUENTIAL_SCAN
     * @type {Integer (UInt32)}
     */
    static FLAG_SEQUENTIAL_SCAN => 134217728

    /**
     * Native name: FILE_FLAG_DELETE_ON_CLOSE
     * @type {Integer (UInt32)}
     */
    static FLAG_DELETE_ON_CLOSE => 67108864

    /**
     * Native name: FILE_FLAG_BACKUP_SEMANTICS
     * @type {Integer (UInt32)}
     */
    static FLAG_BACKUP_SEMANTICS => 33554432

    /**
     * Native name: FILE_FLAG_POSIX_SEMANTICS
     * @type {Integer (UInt32)}
     */
    static FLAG_POSIX_SEMANTICS => 16777216

    /**
     * Native name: FILE_FLAG_SESSION_AWARE
     * @type {Integer (UInt32)}
     */
    static FLAG_SESSION_AWARE => 8388608

    /**
     * Native name: FILE_FLAG_OPEN_REPARSE_POINT
     * @type {Integer (UInt32)}
     */
    static FLAG_OPEN_REPARSE_POINT => 2097152

    /**
     * Native name: FILE_FLAG_OPEN_NO_RECALL
     * @type {Integer (UInt32)}
     */
    static FLAG_OPEN_NO_RECALL => 1048576

    /**
     * Native name: FILE_FLAG_FIRST_PIPE_INSTANCE
     * @type {Integer (UInt32)}
     */
    static FLAG_FIRST_PIPE_INSTANCE => 524288

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
