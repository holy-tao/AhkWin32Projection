#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_SYSTEM_PORT_TYPE.ahk" { FWPM_SYSTEM_PORT_TYPE }

/**
 * The FWPM_SYSTEM_PORTS_BY_TYPE0 structure.
 * @remarks
 * <b>FWPM_SYSTEM_PORTS_BY_TYPE0</b> is a specific implementation of FWPM_SYSTEM_PORTS_BY_TYPE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_system_ports_by_type0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_SYSTEM_PORTS_BY_TYPE0 {
    #StructPack 8

    /**
     * An [FWPM_SYSTEM_PORT_TYPE](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_system_port_type) enumeration that specifies the type of port.
     */
    type : FWPM_SYSTEM_PORT_TYPE

    /**
     * The number of ports of the specified type.
     */
    numPorts : UInt32

    /**
     * Array of IP port numbers for the specified type.
     */
    ports : IntPtr

}
