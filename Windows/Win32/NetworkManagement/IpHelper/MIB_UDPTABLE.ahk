#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MIB_UDPROW.ahk

/**
 * Contains the User Datagram Protocol (UDP) listener table for IPv4 on the local computer.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getudptable">GetUdpTable</a> function enumerates the table of UDP  endpoints for IPv4 that have been bound to an address on the local computer and returns this information in a <b>MIB_UDPTABLE</b> structure. 
 * 
 * This table includes the local IPv4 address and port information for sending and receiving UDP datagrams on the local computer. An array of <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udprow">MIB_UDPROW</a> structures are contained in the <b>MIB_UDPTABLE</b> structure.
 * 
 * The <b>MIB_UDPTABLE</b> structure may contain padding for alignment between the <b>dwNumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udprow">MIB_UDPROW</a> array entry in the <b>table</b> member. Padding for alignment may also be present between the <b>MIB_UDPROW</b> array entries in the <b>table</b> member. Any access to a <b>MIB_UDPROW</b> array entry should assume  padding may exist. 
 * 
 * 
 * 
 * The <b>MIB_UDPTABLE</b> structure contains the UDP listener table for IPv4 on the local computer. The name is based on the definition of this table in RFC 1213 published by the IETF. For more information, see 
 * <a href="http://tools.ietf.org/html/rfc1213">http://www.ietf.org/rfc/rfc1213.txt</a>. This table contains UDP  endpoints for IPv4 that have been bound to an address. It should be noted that an application can create a UDP socket and bind it to an address for the sole purpose of sending a UDP datagram, with no intention of receiving packets using this socket (functioning as a listener). 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udptable_owner_module">MIB_UDPTABLE_OWNER_MODULE</a> structure is an enhanced version of the  <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udptable_owner_pid">MIB_UDPTABLE_OWNER_PID</a> structure that includes any available ownership data for each UDP endpoint in the table.  The <b>MIB_UDPTABLE_OWNER_PID</b> is an enhanced version of the <b>MIB_UDPTABLE</b> that includes the process ID (PID) that issued the call to the <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-bind">bind</a> function for each UDP endpoint in the table.
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vistaand later, the organization of header files has changed. This  structure is defined in the <i>Udpmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Udpmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Udpmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//udpmib/ns-udpmib-mib_udptable
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_UDPTABLE extends Win32Struct
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
     * A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udprow">MIB_UDPROW</a> structures.
     * @type {Array<MIB_UDPROW>}
     */
    table{
        get {
            if(!this.HasProp("__tableProxyArray"))
                this.__tableProxyArray := Win32FixedArray(this.ptr + 8, 1, MIB_UDPROW, "")
            return this.__tableProxyArray
        }
    }
}
