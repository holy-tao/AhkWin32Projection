#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used to communicate between policy providers and Wintrust.
 * @see https://docs.microsoft.com/windows/win32/api//wintrust/ns-wintrust-crypt_provider_sigstate
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class CRYPT_PROVIDER_SIGSTATE extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an array of secondary signature handles.
     * @type {Pointer<Void>}
     */
    rhSecondarySigs {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Handle of the primary signature.
     * @type {Pointer<Void>}
     */
    hPrimarySig {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies whether the first attempt to verify a signature has been made.
     * @type {BOOL}
     */
    fFirstAttemptMade {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Specifies whether there exist further signatures that await verification.
     * @type {BOOL}
     */
    fNoMoreSigs {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Number of secondary signatures.
     * @type {Integer}
     */
    cSecondarySigs {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Index of the signature currently being verified.
     * @type {Integer}
     */
    dwCurrentIndex {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Specifies whether the policy provider supports multiple signatures.
     * @type {BOOL}
     */
    fSupportMultiSig {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * 
     * @type {Integer}
     */
    dwCryptoPolicySupport {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * 
     * @type {Integer}
     */
    iAttemptCount {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * 
     * @type {BOOL}
     */
    fCheckedSealing {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * 
     * @type {Pointer<SEALING_SIGNATURE_ATTRIBUTE>}
     */
    pSealingSignature {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
