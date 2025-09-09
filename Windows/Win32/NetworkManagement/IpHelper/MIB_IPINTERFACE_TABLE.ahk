#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NET_LUID_LH.ahk
#Include .\MIB_IPINTERFACE_ROW.ahk

/**
 * Contains a table of IP interface entries.
 * @remarks
 * The <b>MIB_IPINTERFACE_TABLE</b> structure is defined on Windows Vista and later. 
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipinterfacetable">GetIpInterfaceTable</a> function enumerates the IP interface entries on a local system and returns this information in a <b>MIB_IPINTERFACE_TABLE</b> structure. 
  * 
  * 
  * 
  * The <b>MIB_IPINTERFACE_TABLE</b> structure may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> array entry in the <b>Table</b> member. Padding for alignment may also be present between the <b>MIB_IPINTERFACE_ROW</b> array entries in the <b>Table</b> member. Any access to a <b>MIB_IPINTERFACE_ROW</b> array entry should assume  padding may exist. 
  * 
  * 
  * 
  * Note that the <i>Netioapi.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Netioapi.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-mib_ipinterface_table
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPINTERFACE_TABLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of IP interface entries in the array.
     * @type {Integer}
     */
    NumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structures that contain IP interface entries.
     * @type {Array<MIB_IPINTERFACE_ROW>}
     */
    Table{
        get {
            if(!this.HasProp("__TableProxyArray"))
                this.__TableProxyArray := Win32FixedArray(this.ptr + 8, 1, MIB_IPINTERFACE_ROW, "")
            return this.__TableProxyArray
        }
    }
}
