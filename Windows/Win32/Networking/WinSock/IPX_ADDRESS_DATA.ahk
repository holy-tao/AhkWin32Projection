#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IPX_ADDRESS_DATA structure provides information about a specific adapter to which IPX is bound. Used in conjunction with getsockopt function calls that specify IPX_ADDRESS in the optname parameter.
 * @remarks
 * Adapter numbers are base zero, so if there are eight adapters on a given computer, they are numbered 0-7. To determine the number of adapters present on the computer, call the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-getsockopt">getsockopt</a> function with IPX_MAX_ADAPTER_NUM.
 * @see https://learn.microsoft.com/windows/win32/api/wsnwlink/ns-wsnwlink-ipx_address_data
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IPX_ADDRESS_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * 0-based adapter number.
     * @type {Integer}
     */
    adapternum {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * IPX network number for the associated adapter.
     * @type {Array<Byte>}
     */
    netnum{
        get {
            if(!this.HasProp("__netnumProxyArray"))
                this.__netnumProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "char")
            return this.__netnumProxyArray
        }
    }

    /**
     * IPX node address for the associated adapter.
     * @type {Array<Byte>}
     */
    nodenum{
        get {
            if(!this.HasProp("__nodenumProxyArray"))
                this.__nodenumProxyArray := Win32FixedArray(this.ptr + 8, 6, Primitive, "char")
            return this.__nodenumProxyArray
        }
    }

    /**
     * Specifies whether the adapter is on a wide area network (WAN) link. When <b>TRUE</b>, the adapter is on a WAN link.
     * @type {Integer}
     */
    wan {
        get => NumGet(this, 14, "char")
        set => NumPut("char", value, this, 14)
    }

    /**
     * Specifies whether the WAN link is up. <b>FALSE</b> indicates that the WAN link is up or the adapter is not on a WAN. Compare with the <b>wan</b> member to determine the meaning.
     * @type {Integer}
     */
    status {
        get => NumGet(this, 15, "char")
        set => NumPut("char", value, this, 15)
    }

    /**
     * Maximum allowable packet size, excluding the IPX header.
     * @type {Integer}
     */
    maxpkt {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Link speed, returned in 100 byte-per-second increments. For example, a 9600 byte-per-second link would return a value of 96.
     * @type {Integer}
     */
    linkspeed {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
