#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include .\MIB_TCP6ROW.ahk

/**
 * Contains a table of TCP connections for IPv6 on the local computer.
 * @remarks
 * 
  * The <b>MIB_TCP6TABLE</b> structure is defined on Windows Vista and later. 
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcp6table">GetTcp6Table</a>function retrieves the IPv6 TCP connection table on the local computer and returns this information in a <b>MIB_TCP6TABLE</b> structure. 
  * 
  * An array of <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6row">MIB_TCP6ROW</a> structures are contained in the <b>MIB_TCP6TABLE</b> structure. 
  * 
  * The <b>MIB_TCP6TABLE</b> structure may contain padding for alignment between the <b>dwNumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6row">MIB_TCP6ROW</a> array entry in the <b>table</b> member. Padding for alignment may also be present between the <b>MIB_TCP6ROW</b> array entries in the <b>table</b> member. Any access to a <b>MIB_TCP6ROW</b> array entry should assume  padding may exist. 
  * 
  * 
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tcpmib/ns-tcpmib-mib_tcp6table
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_TCP6TABLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

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
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6row">MIB_TCP6ROW</a> structures containing TCP connection entries.
     * @type {Array<MIB_TCP6ROW>}
     */
    table{
        get {
            if(!this.HasProp("__tableProxyArray"))
                this.__tableProxyArray := Win32FixedArray(this.ptr + 8, 1, MIB_TCP6ROW, "")
            return this.__tableProxyArray
        }
    }
}
