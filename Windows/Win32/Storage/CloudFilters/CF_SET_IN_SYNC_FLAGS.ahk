#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The in-sync state flags for placeholder files and folders.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_set_in_sync_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_SET_IN_SYNC_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No in-sync flag.
     * @type {Integer (Int32)}
     */
    static CF_SET_IN_SYNC_FLAG_NONE => 0
}
