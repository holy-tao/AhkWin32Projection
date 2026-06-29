#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Information classes for placeholder info.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_placeholder_info_class
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_PLACEHOLDER_INFO_CLASS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Basic placeholder information. See [CF_PLACEHOLDER_BASIC_INFO](ns-cfapi-cf_placeholder_basic_info.md).
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_INFO_BASIC => 0

    /**
     * Standard placeholder information. See [CF_PLACEHOLDER_STANDARD_INFO](ns-cfapi-cf_placeholder_standard_info.md).
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_INFO_STANDARD => 1
}
