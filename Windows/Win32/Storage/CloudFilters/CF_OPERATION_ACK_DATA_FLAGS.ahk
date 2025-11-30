#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags to verify and acknowledge data for a placeholder file or folder.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_operation_ack_data_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_OPERATION_ACK_DATA_FLAGS extends Win32BitflagEnum{

    /**
     * No acknowledge data flag.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_ACK_DATA_FLAG_NONE => 0
}
