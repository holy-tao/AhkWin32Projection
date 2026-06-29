#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_CREDENTIAL_PAIR1.ahk" { IKEEXT_CREDENTIAL_PAIR1 }

/**
 * Is used to store multiple credential pairs. (IKEEXT_CREDENTIALS1)
 * @remarks
 * IKE and IKEv2 have only 1 pair.
 * 
 * AuthIP
 * has 1 pair, or 2 pairs if EM was enabled.
 * 
 * MM authentication is always index 0.
 * 
 * EM authentication, if it occurs,
 * is index 1.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_credentials1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_CREDENTIALS1 {
    #StructPack 8

    /**
     * Number of [IKEEXT_CREDENTIAL_PAIR1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credential_pair1) structures in the array.
     */
    numCredentials : UInt32

    /**
     * [size_is(numCredentials)]
     * 
     * Pointer to an array of [IKEEXT_CREDENTIAL_PAIR1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credential_pair1) structures.
     */
    credentials : IKEEXT_CREDENTIAL_PAIR1.Ptr

}
