#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NET_PHYSICAL_LOCATION structure provides NDIS with information about the physical location of a registered network interface.
 * @remarks
 * A network interface provider initializes a 
 *     <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ndis/ns-ndis-_net_if_information">NET_IF_INFORMATION</a> structure to provide
 *     NDIS with information about each registered interface. The NET_PHYSICAL_LOCATION structure is included in
 *     the 
 *     <b>PhysicalLocation</b> member of the NET_IF_INFORMATION structure.
 * 
 * NET_PHYSICAL_LOCATION contains information that remains constant during the lifetime of the interface.
 *     To register an interface, a provider passes a pointer to a provider-initialized NET_IF_INFORMATION
 *     structure to the 
 *     <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ndis/nf-ndis-ndisifregisterinterface">NdisIfRegisterInterface</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ifdef/ns-ifdef-net_physical_location_lh
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NET_PHYSICAL_LOCATION_LH extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The bus number of the physical location for hardware. If the physical location is unknown, set
     *      this member to NIIF_BUS_NUMBER_UNKNOWN. Other values are reserved for NDIS.
     * @type {Integer}
     */
    BusNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The slot number of the physical location for hardware. If the physical location is unknown, set
     *      this member to NIIF_SLOT_NUMBER_UNKNOWN. Other values are reserved for NDIS.
     * @type {Integer}
     */
    SlotNumber {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The function number of the physical location for hardware. If the physical location is unknown,
     *      set this member to NIIF_FUNCTION_NUMBER_UNKNOWN. Other values are reserved for NDIS.
     * @type {Integer}
     */
    FunctionNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
