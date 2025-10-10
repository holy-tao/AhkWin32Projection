#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags to acknowledge the deletion of a placeholder file or directory.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_operation_ack_delete_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_OPERATION_ACK_DELETE_FLAGS{

    /**
     * No deletion acknowledgment flags.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_ACK_DELETE_FLAG_NONE => 0
}
