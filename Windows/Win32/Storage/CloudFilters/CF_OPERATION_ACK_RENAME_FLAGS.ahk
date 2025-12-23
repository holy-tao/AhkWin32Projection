#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags for acknowledging placeholder file or directory renaming.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_operation_ack_rename_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_OPERATION_ACK_RENAME_FLAGS extends Win32BitflagEnum{

    /**
     * No acknowledgment of placeholder renaming.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_ACK_RENAME_FLAG_NONE => 0
}
