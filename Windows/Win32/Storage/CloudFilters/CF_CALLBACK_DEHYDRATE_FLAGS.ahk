#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Callback flags for notifying a sync provider that a placeholder under one of its sync root is going to be dehydrated.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_callback_dehydrate_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_CALLBACK_DEHYDRATE_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No dehydrate flag.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_DEHYDRATE_FLAG_NONE => 0

    /**
     * A flag set if the dehydration request is initiated by a system background service.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_DEHYDRATE_FLAG_BACKGROUND => 1
}
