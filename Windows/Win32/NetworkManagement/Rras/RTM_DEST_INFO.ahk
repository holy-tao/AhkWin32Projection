#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RTM_NET_ADDRESS.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * The RTM_DEST_INFO structure is used to exchange destination information with clients registered with the routing table manager.
 * @see https://learn.microsoft.com/windows/win32/api/rtmv2/ns-rtmv2-rtm_dest_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RTM_DEST_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Handle to the destination.
     * @type {Pointer}
     */
    DestHandle {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies the destination network address as an address and a mask.
     * @type {RTM_NET_ADDRESS}
     */
    DestAddress{
        get {
            if(!this.HasProp("__DestAddress"))
                this.__DestAddress := RTM_NET_ADDRESS(this.ptr + 8)
            return this.__DestAddress
        }
    }

    /**
     * Specifies the last time this destination was updated.
     * @type {FILETIME}
     */
    LastChanged{
        get {
            if(!this.HasProp("__LastChanged"))
                this.__LastChanged := FILETIME(this.ptr + 32)
            return this.__LastChanged
        }
    }

    /**
     * Specifies the views to which this destination belongs.
     * @type {Integer}
     */
    BelongsToViews {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Indicates the number of ViewInfo structures present in this destination.
     * @type {Integer}
     */
    NumberOfViews {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    ViewId {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    NumRoutes {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Pointer}
     */
    Route {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer}
     */
    Owner {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    DestFlags {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Pointer}
     */
    HoldRoute {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
