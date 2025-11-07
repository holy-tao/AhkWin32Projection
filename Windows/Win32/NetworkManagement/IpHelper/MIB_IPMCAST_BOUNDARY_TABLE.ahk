#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MIB_IPMCAST_BOUNDARY.ahk

/**
 * Contains a list of a router's scoped IPv4 multicast address boundaries.
 * @remarks
 * 
 * This structure does not have a fixed size. Use the <b>SIZEOF_BOUNDARY_TABLE(X)</b> macro to determine the size of this structure. This macro is defined in the <i>Iprtrmib.h</i> header file.
 * 
 * Note that the <i>Iprtrmib.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Iprtrmib.h</i> header file should never be used directly.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iprtrmib/ns-iprtrmib-mib_ipmcast_boundary_table
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPMCAST_BOUNDARY_TABLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-mib_ipmcast_boundary">MIB_IPMCAST_BOUNDARY</a> structures listed in <b>table[]</b>.
     * @type {Integer}
     */
    dwNumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-mib_ipmcast_boundary">MIB_IPMCAST_BOUNDARY</a> structures which collectively define the set of scoped IPv4 multicast address boundaries on a router.
     * @type {Array<MIB_IPMCAST_BOUNDARY>}
     */
    table{
        get {
            if(!this.HasProp("__tableProxyArray"))
                this.__tableProxyArray := Win32FixedArray(this.ptr + 8, 1, MIB_IPMCAST_BOUNDARY, "")
            return this.__tableProxyArray
        }
    }
}
