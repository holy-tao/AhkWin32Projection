#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NET_LUID_LH.ahk
#Include .\MIB_IF_ROW2.ahk

/**
 * Contains a table of logical and physical interface entries.
 * @remarks
 * The <b>MIB_IF_TABLE2</b> structure is defined in Windows Vista and later. 
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getiftable2">GetIfTable2</a> and <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getiftable2ex">GetIfTable2Ex</a> functions enumerates the logical and physical interfaces on a local system and returns this information in a <b>MIB_IF_TABLE2</b> structure. 
  * 
  * 
  * 
  * The <b>MIB_IF_TABLE2</b> structure may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> array entry in the <b>Table</b> member. Padding for alignment may also be present between the <b>MIB_IF_ROW2</b> array entries in the <b>Table</b> member. Any access to a <b>MIB_IF_ROW2</b> array entry should assume  padding may exist. 
  * 
  * 
  * 
  * Note that the <i>Netioapi.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Netioapi.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-mib_if_table2
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IF_TABLE2 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of interface entries in the array.
     * @type {Integer}
     */
    NumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> structures containing interface entries.
     * @type {Array<MIB_IF_ROW2>}
     */
    Table{
        get {
            if(!this.HasProp("__TableProxyArray"))
                this.__TableProxyArray := Win32FixedArray(this.ptr + 8, 8, MIB_IF_ROW2, "")
            return this.__TableProxyArray
        }
    }
}
