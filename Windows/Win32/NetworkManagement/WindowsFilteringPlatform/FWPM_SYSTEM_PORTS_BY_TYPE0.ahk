#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FWPM_SYSTEM_PORTS_BY_TYPE0 structure.
 * @remarks
 * 
  * <b>FWPM_SYSTEM_PORTS_BY_TYPE0</b> is a specific implementation of FWPM_SYSTEM_PORTS_BY_TYPE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_system_ports_by_type0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_SYSTEM_PORTS_BY_TYPE0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An [FWPM_SYSTEM_PORT_TYPE](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_system_port_type) enumeration that specifies the type of port.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The number of ports of the specified type.
     * @type {Integer}
     */
    numPorts {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Array of IP port numbers for the specified type.
     * @type {Pointer<Integer>}
     */
    ports {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
