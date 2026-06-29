#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INTERFACE_SOFTWARE_TIMESTAMP_CAPABILITIES.ahk" { INTERFACE_SOFTWARE_TIMESTAMP_CAPABILITIES }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\INTERFACE_HARDWARE_TIMESTAMP_CAPABILITIES.ahk" { INTERFACE_HARDWARE_TIMESTAMP_CAPABILITIES }

/**
 * Describes the exact timestamp capabilities that a network adapter supports.
 * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/ns-iphlpapi-interface_timestamp_capabilities
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct INTERFACE_TIMESTAMP_CAPABILITIES {
    #StructPack 8

    /**
     * Type: **[ULONG64](/windows/win32/winprog/windows-data-types)**
     * 
     * Contains the frequency of the network adapter's hardware clock, rounded off to the nearest integer in Hertz units. Note this is the nominal frequency, and the actual frequency might not be the same as this. This data could be used to display the nominal clock frequency to end users for informational purposes. It's possible for *HardwareClockFrequencyHz* to contain the value 0.
     */
    HardwareClockFrequencyHz : Int64

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * A value of **TRUE** indicates that the network adapter driver is capable of generating a hardware cross timestamp. A cross timestamp refers to a set of network interface card (NIC) hardware timestamp and system timestamp(s) obtained very close to one another. A value of **FALSE** indicates that this capability doesn't exist.
     */
    SupportsCrossTimestamp : BOOLEAN

    /**
     * Type: **[INTERFACE_HARDWARE_TIMESTAMP_CAPABILITIES](/windows/win32/api/iphlpapi/ns-iphlpapi-interface_hardware_timestamp_capabilities)**
     * 
     * Describes the timestamping capabilities of the network interface card's (NIC's) hardware. Having both hardware and software timestamps enabled together isn't supported.
     */
    HardwareCapabilities : INTERFACE_HARDWARE_TIMESTAMP_CAPABILITIES

    /**
     * Type: **[INTERFACE_SOFTWARE_TIMESTAMP_CAPABILITIES](/windows/win32/api/iphlpapi/ns-iphlpapi-interface_software_timestamp_capabilities)**
     * 
     * Describes the software timestamping capabilities of a network interface card's (NIC's) miniport driver. Having both hardware and software timestamps enabled together isn't supported.
     */
    SoftwareCapabilities : INTERFACE_SOFTWARE_TIMESTAMP_CAPABILITIES

}
