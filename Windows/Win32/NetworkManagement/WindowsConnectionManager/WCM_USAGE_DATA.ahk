#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains information related to connection usage.
 * @see https://docs.microsoft.com/windows/win32/api//wcmapi/ns-wcmapi-wcm_usage_data
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 * @version v4.0.30319
 */
class WCM_USAGE_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The connection usage, in megabytes.
     * @type {Integer}
     */
    UsageInMegabytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>FILETIME</b>
     * 
     * Specifies the last time that usage information was reconciled with the carrier's billing system.
     * @type {FILETIME}
     */
    LastSyncTime{
        get {
            if(!this.HasProp("__LastSyncTime"))
                this.__LastSyncTime := FILETIME(this.ptr + 8)
            return this.__LastSyncTime
        }
    }
}
