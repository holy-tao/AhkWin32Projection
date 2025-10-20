#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines a set of private key properties that are used for setup of certification authority (CA) or Microsoft Simple Certificate Enrollment Protocol (SCEP) roles.
 * @see https://docs.microsoft.com/windows/win32/api//casetup/nn-casetup-icertsrvsetupkeyinformation
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class ICertSrvSetupKeyInformation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertSrvSetupKeyInformation
     * @type {Guid}
     */
    static IID => Guid("{6ba73778-36da-4c39-8a85-bcfa7d000793}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProviderName", "put_ProviderName", "get_Length", "put_Length", "get_Existing", "put_Existing", "get_ContainerName", "put_ContainerName", "get_HashAlgorithm", "put_HashAlgorithm", "get_ExistingCACertificate", "put_ExistingCACertificate"]

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetupkeyinformation-get_providername
     */
    get_ProviderName(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetupkeyinformation-put_providername
     */
    put_ProviderName(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(8, this, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetupkeyinformation-get_length
     */
    get_Length(pVal) {
        result := ComCall(9, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetupkeyinformation-put_length
     */
    put_Length(lVal) {
        result := ComCall(10, this, "int", lVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetupkeyinformation-get_existing
     */
    get_Existing(pVal) {
        result := ComCall(11, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetupkeyinformation-put_existing
     */
    put_Existing(bVal) {
        result := ComCall(12, this, "short", bVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetupkeyinformation-get_containername
     */
    get_ContainerName(pVal) {
        result := ComCall(13, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetupkeyinformation-put_containername
     */
    put_ContainerName(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(14, this, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetupkeyinformation-get_hashalgorithm
     */
    get_HashAlgorithm(pVal) {
        result := ComCall(15, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetupkeyinformation-put_hashalgorithm
     */
    put_HashAlgorithm(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(16, this, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetupkeyinformation-get_existingcacertificate
     */
    get_ExistingCACertificate(pVal) {
        result := ComCall(17, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetupkeyinformation-put_existingcacertificate
     */
    put_ExistingCACertificate(varVal) {
        result := ComCall(18, this, "ptr", varVal, "HRESULT")
        return result
    }
}
