#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MIB_TCPROW_LH.ahk

/**
 * Contains a table of TCP connections for IPv4 on the local computer.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcptable">GetTcpTable</a>function retrieves the IPv4 TCP connection table on the local computer and returns this information in a <b>MIB_TCPTABLE</b> structure. An array of <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcprow_lh">MIB_TCPROW</a> structures are contained in the <b>MIB_TCPTABLE</b> structure. 
 * 
 * 
 * 
 * The <b>MIB_TCPTABLE</b> structure may contain padding for alignment between the <b>dwNumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcprow_lh">MIB_TCPROW</a> array entry in the <b>table</b> member. Padding for alignment may also be present between the <b>MIB_TCPROW</b> array entries in the <b>table</b> member. Any access to a <b>MIB_TCPROW</b> array entry should assume  padding may exist. 
 * 
 * 
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vistaand later, the organization of header files has changed. This  structure is defined in the <i>Tcpmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Tcpmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Tcpmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tcpmib/ns-tcpmib-mib_tcptable
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_TCPTABLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of entries in the table.
     * @type {Integer}
     */
    dwNumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a table of TCP connections implemented as an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcprow_lh">MIB_TCPROW</a> structures.
     * @type {Array<MIB_TCPROW_LH>}
     */
    table{
        get {
            if(!this.HasProp("__tableProxyArray"))
                this.__tableProxyArray := Win32FixedArray(this.ptr + 8, 1, MIB_TCPROW_LH, "")
            return this.__tableProxyArray
        }
    }
}
