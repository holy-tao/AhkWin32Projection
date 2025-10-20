#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents information used to sign a certificate request.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509signatureinformation
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509SignatureInformation extends IDispatch{
    /**
     * The interface identifier for IX509SignatureInformation
     * @type {Guid}
     */
    static IID => Guid("{728ab33c-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IObjectId>} ppValue 
     * @returns {HRESULT} 
     */
    get_HashAlgorithm(ppValue) {
        result := ComCall(7, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IObjectId>} pValue 
     * @returns {HRESULT} 
     */
    put_HashAlgorithm(pValue) {
        result := ComCall(8, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IObjectId>} ppValue 
     * @returns {HRESULT} 
     */
    get_PublicKeyAlgorithm(ppValue) {
        result := ComCall(9, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IObjectId>} pValue 
     * @returns {HRESULT} 
     */
    put_PublicKeyAlgorithm(pValue) {
        result := ComCall(10, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_Parameters(Encoding, pValue) {
        result := ComCall(11, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    put_Parameters(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(12, this, "int", Encoding, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    get_AlternateSignatureAlgorithm(pValue) {
        result := ComCall(13, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_AlternateSignatureAlgorithm(Value) {
        result := ComCall(14, this, "short", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    get_AlternateSignatureAlgorithmSet(pValue) {
        result := ComCall(15, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    get_NullSigned(pValue) {
        result := ComCall(16, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_NullSigned(Value) {
        result := ComCall(17, this, "short", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Pkcs7Signature 
     * @param {VARIANT_BOOL} SignatureKey 
     * @param {Pointer<IObjectId>} ppValue 
     * @returns {HRESULT} 
     */
    GetSignatureAlgorithm(Pkcs7Signature, SignatureKey, ppValue) {
        result := ComCall(18, this, "short", Pkcs7Signature, "short", SignatureKey, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetDefaultValues() {
        result := ComCall(19, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
