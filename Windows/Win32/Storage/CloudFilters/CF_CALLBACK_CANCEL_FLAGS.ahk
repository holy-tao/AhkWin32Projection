#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Callback flags for canceling data fetching for a placeholder file or folder.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_callback_cancel_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_CALLBACK_CANCEL_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No cancel flag.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_CANCEL_FLAG_NONE => 0

    /**
     * Flag to be set if the user request is cancelled as a result of the expiration of the 60 second timer.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_CANCEL_FLAG_IO_TIMEOUT => 1

    /**
     * Flag to be set if the user request is cancelled as a result of the user explicitly terminating the hydration from app-initiated download toast.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_CANCEL_FLAG_IO_ABORTED => 2
}
