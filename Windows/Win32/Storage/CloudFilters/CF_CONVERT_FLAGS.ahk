#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Normal file/directory to placeholder file/directory conversion flags.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_convert_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_CONVERT_FLAGS extends Win32BitflagEnum{

    /**
     * No conversion flags.
     * @type {Integer (Int32)}
     */
    static CF_CONVERT_FLAG_NONE => 0

    /**
     * The platform marks the converted placeholder as in sync with cloud upon a successful conversion of the file.
     * @type {Integer (Int32)}
     */
    static CF_CONVERT_FLAG_MARK_IN_SYNC => 1

    /**
     * Applicable to files only. When specified, the platform dehydrates the file after converting it to a placeholder successfully. The caller must acquire an exclusive handle when specifying this flag or data corruptions can occur. Note that the platform does not validate the exclusiveness of the handle.
     * @type {Integer (Int32)}
     */
    static CF_CONVERT_FLAG_DEHYDRATE => 2

    /**
     * Applicable for directories only. When specified, it marks the converted placeholder directory as partially populated such that any future access to it will result in a FETCH_PLACEHOLDERS callback sent to the sync provider.
     * @type {Integer (Int32)}
     */
    static CF_CONVERT_FLAG_ENABLE_ON_DEMAND_POPULATION => 4

    /**
     * @type {Integer (Int32)}
     */
    static CF_CONVERT_FLAG_ALWAYS_FULL => 8

    /**
     * @type {Integer (Int32)}
     */
    static CF_CONVERT_FLAG_FORCE_CONVERT_TO_CLOUD_FILE => 16
}
