#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The MGM_IF_ENTRY structure describes a router interface.
 * @see https://docs.microsoft.com/windows/win32/api//mgm/ns-mgm-mgm_if_entry
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MGM_IF_ENTRY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Specifies the index of the interface.
     * @type {Integer}
     */
    dwIfIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the address of the next hop that corresponds to the index specified by <b>dwIfIndex</b>. The <b>dwIfIndex</b> and <b>dwIfNextHopIPAddr</b> members uniquely identify a next hop on point-to-multipoint interfaces. A point-to-multipoint interface is a connection where one interface connects to multiple networks. Examples of point-to-multipoint interfaces include non-broadcast multiple access (NBMA) interfaces and the internal interface on which all dial-up clients connect. 
     * 
     * 
     * 
     * 
     * For broadcast interfaces (such as Ethernet interfaces) or point-to-point interfaces, which are identified by only the value of <b>dwIfIndex</b>, specify zero.
     * @type {Integer}
     */
    dwIfNextHopAddr {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Indicates whether or not IGMP is enabled on this interface. If <b>bIGMP</b> is <b>TRUE</b>, then IGMP is enabled on this interface. If <b>bIGMP</b> is <b>FALSE</b>, then IGMP is not enabled on this interface.
     * @type {BOOL}
     */
    bIGMP{
        get {
            if(!this.HasProp("__bIGMP"))
                this.__bIGMP := BOOL(this.ptr + 8)
            return this.__bIGMP
        }
    }

    /**
     * Indicates whether or not multicast forwarding is enabled on this interface. If <b>bIsEnabled</b> is <b>TRUE</b>, multicast forwarding is enabled on this interface. If <b>bIsEnabled</b> is <b>FALSE</b>, multicast forwarding is disabled on this interface.
     * @type {BOOL}
     */
    bIsEnabled{
        get {
            if(!this.HasProp("__bIsEnabled"))
                this.__bIsEnabled := BOOL(this.ptr + 12)
            return this.__bIsEnabled
        }
    }
}
