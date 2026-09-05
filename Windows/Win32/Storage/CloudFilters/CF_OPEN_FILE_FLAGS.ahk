#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags to request various permissions on opening a file.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_open_file_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
class CF_OPEN_FILE_FLAGS extends Win32BitflagEnum {

    /**
     * No open file flags.
     * Native name: CF_OPEN_FILE_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * When specified, [CfOpenFileWithOplock](nf-cfapi-cfopenfilewithoplock.md) returns a share-none handle and requests an RH (OPLOCK_LEVEL_CACHE_READ\|OPLOCK_LEVEL_CACHE_HANDLE) oplock on the file.
     * Native name: CF_OPEN_FILE_FLAG_EXCLUSIVE
     * @type {Integer (Int32)}
     */
    static FLAG_EXCLUSIVE => 1

    /**
     * When specified, [CfOpenFileWithOplock](nf-cfapi-cfopenfilewithoplock.md) attempts to open the file or directory with FILE_READ_DATA/FILE_LIST_DIRECTORY and FILE_WRITE_DATA/FILE_ADD_FILE access; otherwise it attempts to open the file or directory with FILE_READ_DATA/FILE_LIST_DIRECTORY.
     * Native name: CF_OPEN_FILE_FLAG_WRITE_ACCESS
     * @type {Integer (Int32)}
     */
    static FLAG_WRITE_ACCESS => 2

    /**
     * When specified, [CfOpenFileWithOplock](nf-cfapi-cfopenfilewithoplock.md) attempts to open the file or directory with DELETE access; otherwise it opens the file normally.
     * Native name: CF_OPEN_FILE_FLAG_DELETE_ACCESS
     * @type {Integer (Int32)}
     */
    static FLAG_DELETE_ACCESS => 4

    /**
     * Native name: CF_OPEN_FILE_FLAG_FOREGROUND
     * @type {Integer (Int32)}
     */
    static FLAG_FOREGROUND => 8
}
