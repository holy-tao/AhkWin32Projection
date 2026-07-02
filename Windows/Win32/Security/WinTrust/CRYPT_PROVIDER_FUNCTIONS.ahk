#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFN_PROVIDER_CLEANUP_CALL.ahk" { PFN_PROVIDER_CLEANUP_CALL }
#Import ".\PFN_CPD_MEM_FREE.ahk" { PFN_CPD_MEM_FREE }
#Import ".\PFN_PROVIDER_FINALPOLICY_CALL.ahk" { PFN_PROVIDER_FINALPOLICY_CALL }
#Import ".\PFN_CPD_ADD_SGNR.ahk" { PFN_CPD_ADD_SGNR }
#Import ".\PFN_PROVIDER_INIT_CALL.ahk" { PFN_PROVIDER_INIT_CALL }
#Import ".\PFN_CPD_ADD_STORE.ahk" { PFN_CPD_ADD_STORE }
#Import ".\CRYPT_PROVUI_FUNCS.ahk" { CRYPT_PROVUI_FUNCS }
#Import ".\PFN_PROVIDER_TESTFINALPOLICY_CALL.ahk" { PFN_PROVIDER_TESTFINALPOLICY_CALL }
#Import ".\PFN_CPD_ADD_CERT.ahk" { PFN_CPD_ADD_CERT }
#Import ".\PFN_PROVIDER_OBJTRUST_CALL.ahk" { PFN_PROVIDER_OBJTRUST_CALL }
#Import ".\PFN_CPD_MEM_ALLOC.ahk" { PFN_CPD_MEM_ALLOC }
#Import ".\PFN_PROVIDER_CERTTRUST_CALL.ahk" { PFN_PROVIDER_CERTTRUST_CALL }
#Import ".\PFN_CPD_ADD_PRIVDATA.ahk" { PFN_CPD_ADD_PRIVDATA }
#Import ".\PFN_PROVIDER_SIGTRUST_CALL.ahk" { PFN_PROVIDER_SIGTRUST_CALL }
#Import ".\PFN_PROVIDER_CERTCHKPOLICY_CALL.ahk" { PFN_PROVIDER_CERTCHKPOLICY_CALL }

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
    pfnAlloc : PFN_CPD_MEM_ALLOC

    /**
     * A pointer to the memory deallocation function.
     */
    pfnFree : PFN_CPD_MEM_FREE

    /**
     * A pointer to the function that adds a store to the chain.
     */
    pfnAddStore2Chain : PFN_CPD_ADD_STORE

    /**
     * A pointer to the function that adds a signer structure to a message structure in a chain.
     */
    pfnAddSgnr2Chain : PFN_CPD_ADD_SGNR

    /**
     * A pointer to the function that adds a certificate structure to a signer structure in a chain.
     */
    pfnAddCert2Chain : PFN_CPD_ADD_CERT

    /**
     * A pointer to the function that adds private data to a structure.
     */
    pfnAddPrivData2Chain : PFN_CPD_ADD_PRIVDATA

    /**
     * A pointer to the function that initializes policy data.
     */
    pfnInitialize : PFN_PROVIDER_INIT_CALL

    /**
     * A pointer to the function that builds information for the signer data.
     */
    pfnObjectTrust : PFN_PROVIDER_OBJTRUST_CALL

    /**
     * A pointer to the function that builds information for the signing certificate.
     */
    pfnSignatureTrust : PFN_PROVIDER_SIGTRUST_CALL

    /**
     * A pointer to the function that builds the chain.
     */
    pfnCertificateTrust : PFN_PROVIDER_CERTTRUST_CALL

    /**
     * A pointer to the function that makes the final call to the policy.
     */
    pfnFinalPolicy : PFN_PROVIDER_FINALPOLICY_CALL

    /**
     * A pointer to the function that checks each certificate while building a chain.
     */
    pfnCertCheckPolicy : PFN_PROVIDER_CERTCHKPOLICY_CALL

    /**
     * A pointer to the function that allows structures to be dumped to a file.
     */
    pfnTestFinalPolicy : PFN_PROVIDER_TESTFINALPOLICY_CALL

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provui_funcs">CRYPT_PROVUI_FUNCS</a> structure.
     */
    psUIpfns : CRYPT_PROVUI_FUNCS.Ptr

    /**
     * A pointer to the function that cleans up private data.
     */
    pfnCleanupPolicy : PFN_PROVIDER_CLEANUP_CALL

}
