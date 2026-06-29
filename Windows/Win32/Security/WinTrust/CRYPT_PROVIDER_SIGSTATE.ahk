#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SEALING_SIGNATURE_ATTRIBUTE.ahk" { SEALING_SIGNATURE_ATTRIBUTE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Is used to communicate between policy providers and Wintrust.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-crypt_provider_sigstate
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct CRYPT_PROVIDER_SIGSTATE {
    #StructPack 8

    /**
     * Size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * Pointer to an array of secondary signature handles.
     */
    rhSecondarySigs : IntPtr

    /**
     * Handle of the primary signature.
     */
    hPrimarySig : IntPtr

    /**
     * Specifies whether the first attempt to verify a signature has been made.
     */
    fFirstAttemptMade : BOOL

    /**
     * Specifies whether there exist further signatures that await verification.
     */
    fNoMoreSigs : BOOL

    /**
     * Number of secondary signatures.
     */
    cSecondarySigs : UInt32

    /**
     * Index of the signature currently being verified.
     */
    dwCurrentIndex : UInt32

    /**
     * Specifies whether the policy provider supports multiple signatures.
     */
    fSupportMultiSig : BOOL

    dwCryptoPolicySupport : UInt32

    iAttemptCount : UInt32

    fCheckedSealing : BOOL

    pSealingSignature : SEALING_SIGNATURE_ATTRIBUTE.Ptr

}
