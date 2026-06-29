#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIB_IPNET_TYPE.ahk" { MIB_IPNET_TYPE }

/**
 * MIB_IPNETROW_LH (ipmib.h) contains information for an Address Resolution Protocol (ARP) table entry for an IPv4 address.
 * @remarks
 * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and the <b>MIB_IPNETROW</b> structure is defined in the <i>Ipmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_ipnetrow_lh
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IPNETROW_LH {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The index of the adapter.
     */
    dwIndex : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The length, in bytes, of the physical address.
     */
    dwPhysAddrLen : UInt32

    /**
     * Type: <b>BYTE[MAXLEN_PHYSADDR]</b>
     * 
     * The physical address.
     */
    bPhysAddr : Int8[8]

    /**
     * Type: <b>DWORD</b>
     * 
     * The IPv4 address.
     */
    dwAddr : UInt32

    dwType : UInt32

    static __New() {
        DefineProp(this.Prototype, 'Type', { type: MIB_IPNET_TYPE, offset: 20 })
        this.DeleteProp("__New")
    }
}
