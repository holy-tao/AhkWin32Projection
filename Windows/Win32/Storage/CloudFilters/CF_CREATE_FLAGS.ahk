#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags for creating a placeholder file or directory.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_create_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_CREATE_FLAGS extends Win32BitflagEnum{

    /**
     * Default mode. All entries are processed.
     * @type {Integer (Int32)}
     */
    static CF_CREATE_FLAG_NONE => 0

    /**
     * Causes the API to return immediately if placeholder creation fails. If creation fails, the error code will be returned by the API.
     * @type {Integer (Int32)}
     */
    static CF_CREATE_FLAG_STOP_ON_ERROR => 1
}
