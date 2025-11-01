#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents a public key in a public/private key pair.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509publickey
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509PublicKey extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509PublicKey
     * @type {Guid}
     */
    static IID => Guid("{728ab30b-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "InitializeFromEncodedPublicKeyInfo", "get_Algorithm", "get_Length", "get_EncodedKey", "get_EncodedParameters", "ComputeKeyIdentifier"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IObjectId} pObjectId 
     * @param {BSTR} strEncodedKey 
     * @param {BSTR} strEncodedParameters 
     * @param {Integer} Encoding 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pObjectId, strEncodedKey, strEncodedParameters, Encoding) {
        strEncodedKey := strEncodedKey is String ? BSTR.Alloc(strEncodedKey).Value : strEncodedKey
        strEncodedParameters := strEncodedParameters is String ? BSTR.Alloc(strEncodedParameters).Value : strEncodedParameters

        result := ComCall(7, this, "ptr", pObjectId, "ptr", strEncodedKey, "ptr", strEncodedParameters, "int", Encoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strEncodedPublicKeyInfo 
     * @param {Integer} Encoding 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509publickey-initializefromencodedpublickeyinfo
     */
    InitializeFromEncodedPublicKeyInfo(strEncodedPublicKeyInfo, Encoding) {
        strEncodedPublicKeyInfo := strEncodedPublicKeyInfo is String ? BSTR.Alloc(strEncodedPublicKeyInfo).Value : strEncodedPublicKeyInfo

        result := ComCall(8, this, "ptr", strEncodedPublicKeyInfo, "int", Encoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IObjectId>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509publickey-get_algorithm
     */
    get_Algorithm(ppValue) {
        result := ComCall(9, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509publickey-get_length
     */
    get_Length(pValue) {
        result := ComCall(10, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509publickey-get_encodedkey
     */
    get_EncodedKey(Encoding, pValue) {
        result := ComCall(11, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509publickey-get_encodedparameters
     */
    get_EncodedParameters(Encoding, pValue) {
        result := ComCall(12, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Algorithm 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509publickey-computekeyidentifier
     */
    ComputeKeyIdentifier(Algorithm, Encoding, pValue) {
        result := ComCall(13, this, "int", Algorithm, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }
}
