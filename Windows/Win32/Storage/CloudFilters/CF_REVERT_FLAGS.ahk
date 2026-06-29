#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Flags for reverting a placeholder file to a regular file.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_revert_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_REVERT_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No placeholder revert flags.
     * @type {Integer (Int32)}
     */
    static CF_REVERT_FLAG_NONE => 0
}
