#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents IP information for a NetName resource.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clus_netname_ip_info_entry
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_NETNAME_IP_INFO_ENTRY extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The ID of the node that hosts the NetName resource.
     * @type {Integer}
     */
    NodeId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the <i>BYTE</i> parameter, in bytes.
     * @type {Integer}
     */
    AddressSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A byte array that contains the address of the NetName.
     * @type {Array<Byte>}
     */
    Address{
        get {
            if(!this.HasProp("__AddressProxyArray"))
                this.__AddressProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__AddressProxyArray
        }
    }
}
