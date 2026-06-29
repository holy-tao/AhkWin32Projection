#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Flags to verify and acknowledge data for a placeholder file or folder.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_operation_ack_data_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_OPERATION_ACK_DATA_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No acknowledge data flag.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_ACK_DATA_FLAG_NONE => 0
}
