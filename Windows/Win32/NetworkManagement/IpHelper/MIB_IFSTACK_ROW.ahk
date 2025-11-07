#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the relationship between two network interfaces.
 * @remarks
 * 
 * The <b>MIB_IFSTACK_ROW</b> structure is defined in Windows Vista and later. 
 * 
 * The relationship between the interfaces in the interface stack is that the interface with index in the <b>HigherLayerInterfaceIndex</b> member is immediately above the interface with index in the <b>LowerLayerInterfaceIndex</b> member.
 * 
 * Note that the <i>Netioapi.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Netioapi.h</i> header file should never be used directly.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//netioapi/ns-netioapi-mib_ifstack_row
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IFSTACK_ROW extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The network interface index for the interface that is higher in the interface stack table.
     * @type {Integer}
     */
    HigherLayerInterfaceIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The network interface index for the interface that is lower in the interface stack table.
     * @type {Integer}
     */
    LowerLayerInterfaceIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
