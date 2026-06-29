#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_CIPHER_TYPE.ahk" { IKEEXT_CIPHER_TYPE }

/**
 * Stores information about the IKE/AuthIP encryption algorithm.
 * @remarks
 * <b>IKEEXT_CIPHER_ALGORITHM0</b> is a specific implementation of IKEEXT_CIPHER_ALGORITHM. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_cipher_algorithm0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_CIPHER_ALGORITHM0 {
    #StructPack 4

    /**
     * The type of encryption algorithm.
     * 
     * See [IKEEXT_CIPHER_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_cipher_type) for more information.
     */
    algoIdentifier : IKEEXT_CIPHER_TYPE

    /**
     * Unused parameter, always set it to 0.
     */
    keyLen : UInt32

    /**
     * Unused parameter, always set it to 0.
     */
    rounds : UInt32

}
