#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the relationship between two network interfaces. (MIB_INVERTEDIFSTACK_ROW)
 * @remarks
 * The <b>MIB_INVERTEDIFSTACK_ROW</b> structure is defined in Windows Vista and later. 
 * 
 * The relationship between the interfaces in the interface stack is that the interface with index in the <b>HigherLayerInterfaceIndex</b> member is immediately above the interface with index in the <b>LowerLayerInterfaceIndex</b> member.
 * 
 * Note that the <i>Netioapi.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Netioapi.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-mib_invertedifstack_row
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_INVERTEDIFSTACK_ROW {
    #StructPack 4

    /**
     * The network interface index for the interface that is lower in the interface stack table.
     */
    LowerLayerInterfaceIndex : UInt32

    /**
     * The network interface index for the interface that is higher in the interface stack table.
     */
    HigherLayerInterfaceIndex : UInt32

}
