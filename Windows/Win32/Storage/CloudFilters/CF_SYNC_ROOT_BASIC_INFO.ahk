#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Basic sync root information.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_sync_root_basic_info
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_SYNC_ROOT_BASIC_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The file ID of the sync root.
     * @type {Integer}
     */
    SyncRootFileId {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
