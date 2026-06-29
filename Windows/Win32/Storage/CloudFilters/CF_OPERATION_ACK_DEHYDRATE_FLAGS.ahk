#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Flags to acknowledge the dehydration of a placeholder file or directory.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_operation_ack_dehydrate_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_OPERATION_ACK_DEHYDRATE_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No acknowledge dehydration flag.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_ACK_DEHYDRATE_FLAG_NONE => 0
}
