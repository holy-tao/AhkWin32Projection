#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The placeholder pin flags.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_set_pin_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_SET_PIN_FLAGS extends Win32BitflagEnum{

    /**
     * No pin flag.
     * @type {Integer (Int32)}
     */
    static CF_SET_PIN_FLAG_NONE => 0

    /**
     * The platform applies the pin state to the placeholder *FileHandle* and every file recursively beneath it (relevant only if *FileHandle* is a handle to a directory).
     * @type {Integer (Int32)}
     */
    static CF_SET_PIN_FLAG_RECURSE => 1

    /**
     * The platform applies the pin state to every file recursively beneath the placeholder *FileHandle*, but not to *FileHandle* itself.
     * @type {Integer (Int32)}
     */
    static CF_SET_PIN_FLAG_RECURSE_ONLY => 2

    /**
     * The platform will stop the recursion when encountering the first error; otherwise the platform skips the error and continues the recursion.
     * @type {Integer (Int32)}
     */
    static CF_SET_PIN_FLAG_RECURSE_STOP_ON_ERROR => 4
}
