#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the functions used by a cryptographic service provider (CSP) for WinTrust operations.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-crypt_provider_functions
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class CRYPT_PROVIDER_FUNCTIONS extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to the memory allocation function.
     * @type {Pointer<Ptr>}
     */
    pfnAlloc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the memory deallocation function.
     * @type {Pointer<Ptr>}
     */
    pfnFree {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to the function that adds a store to the chain.
     * @type {Pointer<Ptr>}
     */
    pfnAddStore2Chain {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to the function that adds a signer structure to a message structure in a chain.
     * @type {Pointer<Ptr>}
     */
    pfnAddSgnr2Chain {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to the function that adds a certificate structure to a signer structure in a chain.
     * @type {Pointer<Ptr>}
     */
    pfnAddCert2Chain {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to the function that adds private data to a structure.
     * @type {Pointer<Ptr>}
     */
    pfnAddPrivData2Chain {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A pointer to the function that initializes policy data.
     * @type {Pointer<Ptr>}
     */
    pfnInitialize {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A pointer to the function that builds information for the signer data.
     * @type {Pointer<Ptr>}
     */
    pfnObjectTrust {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A pointer to the function that builds information for the signing certificate.
     * @type {Pointer<Ptr>}
     */
    pfnSignatureTrust {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * A pointer to the function that builds the chain.
     * @type {Pointer<Ptr>}
     */
    pfnCertificateTrust {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * A pointer to the function that makes the final call to the policy.
     * @type {Pointer<Ptr>}
     */
    pfnFinalPolicy {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * A pointer to the function that checks each certificate while building a chain.
     * @type {Pointer<Ptr>}
     */
    pfnCertCheckPolicy {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * A pointer to the function that allows structures to be dumped to a file.
     * @type {Pointer<Ptr>}
     */
    pfnTestFinalPolicy {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provui_funcs">CRYPT_PROVUI_FUNCS</a> structure.
     * @type {Pointer<CRYPT_PROVUI_FUNCS>}
     */
    psUIpfns {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * A pointer to the function that cleans up private data.
     * @type {Pointer<Ptr>}
     */
    pfnCleanupPolicy {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }
}
