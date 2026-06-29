#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_PROVUI_FUNCS.ahk" { CRYPT_PROVUI_FUNCS }

/**
 * Defines the functions used by a cryptographic service provider (CSP) for WinTrust operations.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-crypt_provider_functions
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct CRYPT_PROVIDER_FUNCTIONS {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * A pointer to the memory allocation function.
     */
    pfnAlloc : IntPtr

    /**
     * A pointer to the memory deallocation function.
     */
    pfnFree : IntPtr

    /**
     * A pointer to the function that adds a store to the chain.
     */
    pfnAddStore2Chain : IntPtr

    /**
     * A pointer to the function that adds a signer structure to a message structure in a chain.
     */
    pfnAddSgnr2Chain : IntPtr

    /**
     * A pointer to the function that adds a certificate structure to a signer structure in a chain.
     */
    pfnAddCert2Chain : IntPtr

    /**
     * A pointer to the function that adds private data to a structure.
     */
    pfnAddPrivData2Chain : IntPtr

    /**
     * A pointer to the function that initializes policy data.
     */
    pfnInitialize : IntPtr

    /**
     * A pointer to the function that builds information for the signer data.
     */
    pfnObjectTrust : IntPtr

    /**
     * A pointer to the function that builds information for the signing certificate.
     */
    pfnSignatureTrust : IntPtr

    /**
     * A pointer to the function that builds the chain.
     */
    pfnCertificateTrust : IntPtr

    /**
     * A pointer to the function that makes the final call to the policy.
     */
    pfnFinalPolicy : IntPtr

    /**
     * A pointer to the function that checks each certificate while building a chain.
     */
    pfnCertCheckPolicy : IntPtr

    /**
     * A pointer to the function that allows structures to be dumped to a file.
     */
    pfnTestFinalPolicy : IntPtr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provui_funcs">CRYPT_PROVUI_FUNCS</a> structure.
     */
    psUIpfns : CRYPT_PROVUI_FUNCS.Ptr

    /**
     * A pointer to the function that cleans up private data.
     */
    pfnCleanupPolicy : IntPtr

}
