#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIB_INVERTEDIFSTACK_ROW.ahk" { MIB_INVERTEDIFSTACK_ROW }

/**
 * Contains a table of inverted network interface stack row entries. This specifies the relationship of the network interfaces on an interface stack in reverse order.
 * @remarks
 * The <b>MIB_INVERTEDIFSTACK_TABLE</b> structure is defined on Windows Vista and later. 
 * 
 * The relationship between the interfaces in the interface stack is that the interface with index in the <b>HigherLayerInterfaceIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_invertedifstack_row">MIB_INVERTEDIFSTACK_ROW</a> structure is immediately above the interface with index in the <b>LowerLayerInterfaceIndex</b> member of the <b>MIB_INVERTEDIFSTACK_ROW</b> structure.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getinvertedifstacktable">GetInvertedIfStackTable</a> function enumerates the inverted network interface stack row entries on a local system and returns this information in a <b>MIB_INVERTEDIFSTACK_TABLE</b> structure. 
 * 
 * 
 * 
 * The <b>MIB_INVERTEDIFSTACK_TABLE</b> structure may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_invertedifstack_row">MIB_INVERTEDIFSTACK_ROW</a> array entry in the <b>Table</b> member. Padding for alignment may also be present between the <b>MIB_INVERTEDIFSTACK_ROW</b> array entries in the <b>Table</b> member. Any access to a <b>MIB_INVERTEDIFSTACK_ROW</b> array entry should assume  padding may exist. 
 * 
 * 
 * 
 * Note that the <i>Netioapi.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Netioapi.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-mib_invertedifstack_table
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_INVERTEDIFSTACK_TABLE {
    #StructPack 4

    /**
     * The number of inverted interface stack row entries in the array.
     */
    NumEntries : UInt32

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_invertedifstack_row">MIB_INVERTEDIFSTACK_ROW</a> structures containing inverted interface stack row entries.
     */
    Table : MIB_INVERTEDIFSTACK_ROW[1]

}
