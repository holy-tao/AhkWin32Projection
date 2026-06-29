#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include .\TCP_CONNECTION_OFFLOAD_STATE.ahk
#Include .\MIB_TCP_STATE.ahk
#Include .\MIB_TCP6ROW2.ahk

/**
 * Contains a table of IPv6 TCP connections on the local computer.
 * @remarks
 * The <b>MIB_TCP6TABLE2</b> structure is defined on Windows Vista and later. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcp6table2">GetTcp6Table2</a> function retrieves the IPv6 TCP connection table on the local computer and returns this information in a <b>MIB_TCP6TABLE2</b> structure. 
 * 
 * An array of <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6row2">MIB_TCP6ROW2</a> structures are contained in the <b>MIB_TCP6TABLE2</b> structure. 
 * 
 * The <b>MIB_TCP6TABLE2</b> structure may contain padding for alignment between the <b>dwNumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6row2">MIB_TCP6ROW2</a> array entry in the <b>table</b> member. Padding for alignment may also be present between the <b>MIB_TCP6ROW2</b> array entries in the <b>table</b> member. Any access to a <b>MIB_TCP6ROW2</b> array entry should assume  padding may exist.
 * @see https://learn.microsoft.com/windows/win32/api/tcpmib/ns-tcpmib-mib_tcp6table2
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
class MIB_TCP6TABLE2 extends Win32Struct {
    static sizeof => 64

    static packingSize => 4

    /**
     * A value that specifies the number of TCP connections in the array.
     * @type {Integer}
     */
    dwNumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6row2">MIB_TCP6ROW2</a> structures containing TCP connection entries.
     * @type {MIB_TCP6ROW2}
     */
    table {
        get {
            if(!this.HasProp("__tableProxyArray"))
                this.__tableProxyArray := Win32FixedArray(this.ptr + 4, 1, MIB_TCP6ROW2, "")
            return this.__tableProxyArray
        }
    }
}
