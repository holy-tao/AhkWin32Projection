#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MIB_IFSTACK_ROW.ahk

/**
 * Contains a table of network interface stack row entries. This specifies the relationship of the network interfaces on an interface stack.
 * @remarks
 * 
  * The <b>MIB_IFSTACK_TABLE</b> structure is defined in Windows Vista and later. 
  * 
  * The relationship between the interfaces in the interface stack is that the interface with index in the <b>HigherLayerInterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ifstack_row">MIB_IFSTACK_ROW</a> structure is immediately above the interface with index in the <b>LowerLayerInterfaceIndex</b> member of the <b>MIB_IFSTACK_ROW</b> structure.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getifstacktable">GetIfStackTable</a> function enumerates the network interface stack row entries on a local system and returns this information in a <b>MIB_IFSTACK_TABLE</b> structure. 
  * 
  * 
  * 
  * The <b>MIB_IFSTACK_TABLE</b> structure may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ifstack_row">MIB_IFSTACK_ROW</a> array entry in the <b>Table</b> member. Padding for alignment may also be present between the <b>MIB_IFSTACK_ROW</b> array entries in the <b>Table</b> member. Any access to a <b>MIB_IFSTACK_ROW</b> array entry should assume  padding may exist. 
  * 
  * 
  * 
  * Note that the <i>Netioapi.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Netioapi.h</i> header file should never be used directly.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//netioapi/ns-netioapi-mib_ifstack_table
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IFSTACK_TABLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of interface stack row entries in the array.
     * @type {Integer}
     */
    NumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ifstack_row">MIB_IFSTACK_ROW</a> structures containing interface stack row entries.
     * @type {Array<MIB_IFSTACK_ROW>}
     */
    Table{
        get {
            if(!this.HasProp("__TableProxyArray"))
                this.__TableProxyArray := Win32FixedArray(this.ptr + 8, 1, MIB_IFSTACK_ROW, "")
            return this.__TableProxyArray
        }
    }
}
