#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Flags for fetching information about the content of a placeholder file or directory.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_callback_fetch_placeholders_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_CALLBACK_FETCH_PLACEHOLDERS_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No fetch placeholder flags.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_FETCH_PLACEHOLDERS_FLAG_NONE => 0
}
