#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Placeholder data hydration flags.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_hydrate_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_HYDRATE_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No hydration flags.
     * @type {Integer (Int32)}
     */
    static CF_HYDRATE_FLAG_NONE => 0
}
