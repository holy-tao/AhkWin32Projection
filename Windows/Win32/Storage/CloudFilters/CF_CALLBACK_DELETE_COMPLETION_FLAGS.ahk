#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Callback flags for notifying a sync provider that a placeholder was successfully deleted.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_callback_delete_completion_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_CALLBACK_DELETE_COMPLETION_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No delete completion flag.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_DELETE_COMPLETION_FLAG_NONE => 0
}
