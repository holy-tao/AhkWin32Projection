#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_INTEGRITY_TYPE.ahk" { IKEEXT_INTEGRITY_TYPE }

/**
 * Stores the IKE/AuthIP hash algorithm.
 * @remarks
 * <b>IKEEXT_INTEGRITY_ALGORITHM0</b> is a specific implementation of IKEEXT_INTEGRITY_ALGORITHM. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_integrity_algorithm0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_INTEGRITY_ALGORITHM0 {
    #StructPack 4

    /**
     * The type of hash algorithm.
     * 
     * See [IKEEXT_INTEGRITY_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_integrity_type) for more information.
     */
    algoIdentifier : IKEEXT_INTEGRITY_TYPE

}
