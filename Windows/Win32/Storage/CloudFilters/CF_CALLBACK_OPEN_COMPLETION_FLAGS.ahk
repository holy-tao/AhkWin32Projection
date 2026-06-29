#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Callback flags for notifying a sync provider that a placeholder was successfully opened for read/write/delete access.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_callback_open_completion_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_CALLBACK_OPEN_COMPLETION_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No open completion flag.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_OPEN_COMPLETION_FLAG_NONE => 0

    /**
     * A flag set if the placeholder metadata is corrupted.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_OPEN_COMPLETION_FLAG_PLACEHOLDER_UNKNOWN => 1

    /**
     * A flag set if the placeholder metadata is of an older and unsupported version.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_OPEN_COMPLETION_FLAG_PLACEHOLDER_UNSUPPORTED => 2
}
