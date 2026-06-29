#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_CLASSIFY_OPTION0.ahk" { FWPM_CLASSIFY_OPTION0 }

/**
 * The FWPM_CLASSIFY_OPTIONS0 structure is used to store FWPM_CLASSIFY_OPTION0 structures.
 * @remarks
 * <b>FWPM_CLASSIFY_OPTIONS0</b> is a specific implementation of FWPM_CLASSIFY_OPTIONS. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_classify_options0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_CLASSIFY_OPTIONS0 {
    #StructPack 8

    /**
     * Number of <b>FWPM_CLASSIFY_OPTION0</b> structures in the <b>options</b> member.
     */
    numOptions : UInt32

    /**
     * [size_is(numCredentials)]
     * 
     * Pointer to an array of [FWPM_CLASSIFY_OPTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_classify_option0) structures.
     */
    options : FWPM_CLASSIFY_OPTION0.Ptr

}
