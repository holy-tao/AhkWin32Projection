#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how the filter enum conditions should be interpreted.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ne-fwptypes-fwp_filter_enum_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWP_FILTER_ENUM_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Return only filters that fully contain the enum conditions.
     * @type {Integer (Int32)}
     */
    static FWP_FILTER_ENUM_FULLY_CONTAINED => 0

    /**
     * Return filters that overlap with the enum conditions, including filters that fully contain the enum conditions.
     * @type {Integer (Int32)}
     */
    static FWP_FILTER_ENUM_OVERLAPPING => 1

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static FWP_FILTER_ENUM_TYPE_MAX => 2
}
