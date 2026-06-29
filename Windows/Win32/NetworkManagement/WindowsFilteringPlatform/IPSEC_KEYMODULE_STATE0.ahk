#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Stores Internet Protocol Security (IPsec) keying module specific information.
 * @remarks
 * <b>IPSEC_KEYMODULE_STATE0</b> is a specific implementation of IPSEC_KEYMODULE_STATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_keymodule_state0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_KEYMODULE_STATE0 {
    #StructPack 8

    /**
     * The identifier of the keying module.
     */
    keyModuleKey : Guid

    /**
     * A byte blob containing opaque keying module specific information.
     */
    stateBlob : FWP_BYTE_BLOB

}
