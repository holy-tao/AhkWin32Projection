#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FWPM_SYSTEM_PORTS0 structure.
 * @remarks
 * 
 * <b>FWPM_SYSTEM_PORTS0</b> is a specific implementation of FWPM_SYSTEM_PORTS. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_system_ports0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_SYSTEM_PORTS0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of types in the array.
     * @type {Integer}
     */
    numTypes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A [FWPM_SYSTEM_PORTS_BY_TYPE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_system_ports_by_type0) structure that specifies the array of system port types.
     * @type {Pointer<FWPM_SYSTEM_PORTS_BY_TYPE0>}
     */
    types {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
