#Requires AutoHotkey v2.0.0 64-bit

/**
 * Information classes for placeholder info.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_placeholder_info_class
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_PLACEHOLDER_INFO_CLASS{

    /**
     * Basic placeholder information.  See <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/ns-cfapi-cf_placeholder_basic_info">CF_PLACEHOLDER_BASIC_INFO</a>.
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_INFO_BASIC => 0

    /**
     * Standard placeholder information. See <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/ns-cfapi-cf_placeholder_standard_info">CF_PLACEHOLDER_STANDARD_INFO</a>.
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_INFO_STANDARD => 1
}
