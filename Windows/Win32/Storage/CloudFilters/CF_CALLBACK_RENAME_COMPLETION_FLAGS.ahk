#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A callback flag to inform the sync provider that a placeholder under one of its sync roots has been successfully renamed.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_callback_rename_completion_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_CALLBACK_RENAME_COMPLETION_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No rename completion flag.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_RENAME_COMPLETION_FLAG_NONE => 0
}
