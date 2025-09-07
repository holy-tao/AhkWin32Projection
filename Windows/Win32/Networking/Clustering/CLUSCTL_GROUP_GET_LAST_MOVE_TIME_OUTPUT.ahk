#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * Specifies information about the last time a group was moved to another node.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusctl_group_get_last_move_time_output
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSCTL_GROUP_GET_LAST_MOVE_TIME_OUTPUT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The number of milliseconds that have elapsed in the owning node, when the group was moved.
     * @type {Integer}
     */
    GetTickCount64 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The system date and time in the owning node, when the group was moved.
     * @type {SYSTEMTIME}
     */
    GetSystemTime{
        get {
            if(!this.HasProp("__GetSystemTime"))
                this.__GetSystemTime := SYSTEMTIME(this.ptr + 8)
            return this.__GetSystemTime
        }
    }

    /**
     * The unique ID of the node that owns the group.
     * @type {Integer}
     */
    NodeId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
