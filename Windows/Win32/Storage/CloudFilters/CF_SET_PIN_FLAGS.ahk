#Requires AutoHotkey v2.0.0 64-bit

/**
 * The placeholder pin flags.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_set_pin_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_SET_PIN_FLAGS{

    /**
     * No pin flag.
     * @type {Integer (Int32)}
     */
    static CF_SET_PIN_FLAG_NONE => 0

    /**
     * The platform applies the pin state to the placeholder <i>FileHandle</i> and every file recursively beneath it (relevant only if <i>FileHandle</i> is a handle to a directory).
     * @type {Integer (Int32)}
     */
    static CF_SET_PIN_FLAG_RECURSE => 1

    /**
     * The platform applies the pin state to every file recursively beneath the placeholder <i>FileHandle</i>, but not to <i>FileHandle</i> itself.
     * @type {Integer (Int32)}
     */
    static CF_SET_PIN_FLAG_RECURSE_ONLY => 2

    /**
     * The platform will stop the recursion when encountering the first error; otherwise the platform skips the error and continues the recursion.
     * @type {Integer (Int32)}
     */
    static CF_SET_PIN_FLAG_RECURSE_STOP_ON_ERROR => 4
}
