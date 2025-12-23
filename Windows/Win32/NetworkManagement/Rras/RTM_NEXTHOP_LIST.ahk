#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RTM_NEXTHOP_LIST structure contains a list of next hops used to determine equal-cost paths in a route.
 * @see https://learn.microsoft.com/windows/win32/api/rtmv2/ns-rtmv2-rtm_nexthop_list
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RTM_NEXTHOP_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of equal cost next hops in <b>NextHops</b>.
     * @type {Integer}
     */
    NumNextHops {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Array of next-hop handles.
     * @type {Array<IntPtr>}
     */
    NextHops{
        get {
            if(!this.HasProp("__NextHopsProxyArray"))
                this.__NextHopsProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__NextHopsProxyArray
        }
    }
}
