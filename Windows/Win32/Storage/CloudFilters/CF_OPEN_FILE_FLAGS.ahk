#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags to request various permissions on opening a file.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_open_file_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_OPEN_FILE_FLAGS extends Win32BitflagEnum{

    /**
     * No open file flags.
     * @type {Integer (Int32)}
     */
    static CF_OPEN_FILE_FLAG_NONE => 0

    /**
     * When specified, <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfopenfilewithoplock">CfOpenFileWithOplock</a> returns a share-none handle and requests an RH (OPLOCK_LEVEL_CACHE_READ\|OPLOCK_LEVEL_CACHE_HANDLE) oplock on the file.
     * @type {Integer (Int32)}
     */
    static CF_OPEN_FILE_FLAG_EXCLUSIVE => 1

    /**
     * When specified, <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfopenfilewithoplock">CfOpenFileWithOplock</a> attempts to open the file or directory with FILE_READ_DATA/FILE_LIST_DIRECTORY and FILE_WRITE_DATA/FILE_ADD_FILE access; otherwise it attempts to open the file or directory with FILE_READ_DATA/ FILE_LIST_DIRECTORY.
     * @type {Integer (Int32)}
     */
    static CF_OPEN_FILE_FLAG_WRITE_ACCESS => 2

    /**
     * When specified, <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfopenfilewithoplock">CfOpenFileWithOplock</a> attempts to open the file or directory with DELETE access; otherwise it opens the file normally.
     * @type {Integer (Int32)}
     */
    static CF_OPEN_FILE_FLAG_DELETE_ACCESS => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CF_OPEN_FILE_FLAG_FOREGROUND => 8
}
