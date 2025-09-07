#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * MIB_IPNETROW_LH (ipmib.h) contains information for an Address Resolution Protocol (ARP) table entry for an IPv4 address.
 * @remarks
 * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and the <b>MIB_IPNETROW</b> structure is defined in the <i>Ipmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_ipnetrow_lh
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPNETROW_LH extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The index of the adapter.
     * @type {Integer}
     */
    dwIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The length, in bytes, of the physical address.
     * @type {Integer}
     */
    dwPhysAddrLen {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>BYTE[MAXLEN_PHYSADDR]</b>
     * 
     * The physical address.
     * @type {Array<Byte>}
     */
    bPhysAddr{
        get {
            if(!this.HasProp("__bPhysAddrProxyArray"))
                this.__bPhysAddrProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__bPhysAddrProxyArray
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The IPv4 address.
     * @type {Integer}
     */
    dwAddr {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
