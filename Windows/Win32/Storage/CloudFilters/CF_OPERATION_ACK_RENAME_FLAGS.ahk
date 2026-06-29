#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Flags for acknowledging placeholder file or directory renaming.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_operation_ack_rename_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_OPERATION_ACK_RENAME_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No acknowledgment of placeholder renaming.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_ACK_RENAME_FLAG_NONE => 0
}
