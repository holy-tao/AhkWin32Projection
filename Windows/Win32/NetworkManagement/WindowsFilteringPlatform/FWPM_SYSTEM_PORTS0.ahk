#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_SYSTEM_PORTS_BY_TYPE0.ahk" { FWPM_SYSTEM_PORTS_BY_TYPE0 }

/**
 * The FWPM_SYSTEM_PORTS0 structure.
 * @remarks
 * <b>FWPM_SYSTEM_PORTS0</b> is a specific implementation of FWPM_SYSTEM_PORTS. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_system_ports0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_SYSTEM_PORTS0 {
    #StructPack 8

    /**
     * The number of types in the array.
     */
    numTypes : UInt32

    /**
     * A [FWPM_SYSTEM_PORTS_BY_TYPE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_system_ports_by_type0) structure that specifies the array of system port types.
     */
    types : FWPM_SYSTEM_PORTS_BY_TYPE0.Ptr

}
