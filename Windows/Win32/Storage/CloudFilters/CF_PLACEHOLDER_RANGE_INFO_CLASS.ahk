#Requires AutoHotkey v2.0.0 64-bit

/**
 * Types of the range of placeholder file data.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_placeholder_range_info_class
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_PLACEHOLDER_RANGE_INFO_CLASS{

    /**
     * On-disk data is data that is physical present in the file, which is a super set of other types of ranges.
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_RANGE_INFO_ONDISK => 1

    /**
     * Validated data is a subset of the on-disk data that is currently in sync with the cloud.
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_RANGE_INFO_VALIDATED => 2

    /**
     * Modified data is a subset of the on-disk data that is currently not in sync with the cloud, i.e., either modified or appended.
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_RANGE_INFO_MODIFIED => 3
}
