#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Placeholder dehydration flags.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_dehydrate_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_DEHYDRATE_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No dehydration flags.
     * @type {Integer (Int32)}
     */
    static CF_DEHYDRATE_FLAG_NONE => 0

    /**
     * If specified, the caller is a system process running in the background. Otherwise, the caller is performing this operation on behalf of a logged-in user.
     * @type {Integer (Int32)}
     */
    static CF_DEHYDRATE_FLAG_BACKGROUND => 1
}
