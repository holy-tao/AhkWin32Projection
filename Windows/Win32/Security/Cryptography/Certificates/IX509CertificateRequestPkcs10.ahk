#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509CertificateRequest.ahk

/**
 * The IX509CertificateRequestPkcs10 interface represents a PKCS
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509certificaterequestpkcs10
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateRequestPkcs10 extends IX509CertificateRequest{
    /**
     * The interface identifier for IX509CertificateRequestPkcs10
     * @type {Guid}
     */
    static IID => Guid("{728ab342-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * 
     * @param {Integer} Context 
     * @param {BSTR} strTemplateName 
     * @returns {HRESULT} 
     */
    InitializeFromTemplateName(Context, strTemplateName) {
        strTemplateName := strTemplateName is String ? BSTR.Alloc(strTemplateName).Value : strTemplateName

        result := ComCall(32, this, "int", Context, "ptr", strTemplateName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Context 
     * @param {Pointer<IX509PrivateKey>} pPrivateKey 
     * @param {BSTR} strTemplateName 
     * @returns {HRESULT} 
     */
    InitializeFromPrivateKey(Context, pPrivateKey, strTemplateName) {
        strTemplateName := strTemplateName is String ? BSTR.Alloc(strTemplateName).Value : strTemplateName

        result := ComCall(33, this, "int", Context, "ptr", pPrivateKey, "ptr", strTemplateName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Context 
     * @param {Pointer<IX509PublicKey>} pPublicKey 
     * @param {BSTR} strTemplateName 
     * @returns {HRESULT} 
     */
    InitializeFromPublicKey(Context, pPublicKey, strTemplateName) {
        strTemplateName := strTemplateName is String ? BSTR.Alloc(strTemplateName).Value : strTemplateName

        result := ComCall(34, this, "int", Context, "ptr", pPublicKey, "ptr", strTemplateName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Context 
     * @param {BSTR} strCertificate 
     * @param {Integer} Encoding 
     * @param {Integer} InheritOptions 
     * @returns {HRESULT} 
     */
    InitializeFromCertificate(Context, strCertificate, Encoding, InheritOptions) {
        strCertificate := strCertificate is String ? BSTR.Alloc(strCertificate).Value : strCertificate

        result := ComCall(35, this, "int", Context, "ptr", strCertificate, "int", Encoding, "int", InheritOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strEncodedData 
     * @param {Integer} Encoding 
     * @returns {HRESULT} 
     */
    InitializeDecode(strEncodedData, Encoding) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(36, this, "ptr", strEncodedData, "int", Encoding, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AllowedSignatureTypes 
     * @returns {HRESULT} 
     */
    CheckSignature(AllowedSignatureTypes) {
        result := ComCall(37, this, "int", AllowedSignatureTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    IsSmartCard(pValue) {
        result := ComCall(38, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IObjectId>} ppValue 
     * @returns {HRESULT} 
     */
    get_TemplateObjectId(ppValue) {
        result := ComCall(39, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX509PublicKey>} ppValue 
     * @returns {HRESULT} 
     */
    get_PublicKey(ppValue) {
        result := ComCall(40, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX509PrivateKey>} ppValue 
     * @returns {HRESULT} 
     */
    get_PrivateKey(ppValue) {
        result := ComCall(41, this, "ptr", ppValue, "int")
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
        result := ComCall(42, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    get_ReuseKey(pValue) {
        result := ComCall(43, this, "ptr", pValue, "int")
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
    get_OldCertificate(Encoding, pValue) {
        result := ComCall(44, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX500DistinguishedName>} ppValue 
     * @returns {HRESULT} 
     */
    get_Subject(ppValue) {
        result := ComCall(45, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX500DistinguishedName>} pValue 
     * @returns {HRESULT} 
     */
    put_Subject(pValue) {
        result := ComCall(46, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICspStatuses>} ppValue 
     * @returns {HRESULT} 
     */
    get_CspStatuses(ppValue) {
        result := ComCall(47, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    get_SmimeCapabilities(pValue) {
        result := ComCall(48, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_SmimeCapabilities(Value) {
        result := ComCall(49, this, "short", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX509SignatureInformation>} ppValue 
     * @returns {HRESULT} 
     */
    get_SignatureInformation(ppValue) {
        result := ComCall(50, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_KeyContainerNamePrefix(pValue) {
        result := ComCall(51, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    put_KeyContainerNamePrefix(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(52, this, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICryptAttributes>} ppValue 
     * @returns {HRESULT} 
     */
    get_CryptAttributes(ppValue) {
        result := ComCall(53, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX509Extensions>} ppValue 
     * @returns {HRESULT} 
     */
    get_X509Extensions(ppValue) {
        result := ComCall(54, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IObjectIds>} ppValue 
     * @returns {HRESULT} 
     */
    get_CriticalExtensions(ppValue) {
        result := ComCall(55, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IObjectIds>} ppValue 
     * @returns {HRESULT} 
     */
    get_SuppressOids(ppValue) {
        result := ComCall(56, this, "ptr", ppValue, "int")
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
    get_RawDataToBeSigned(Encoding, pValue) {
        result := ComCall(57, this, "int", Encoding, "ptr", pValue, "int")
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
    get_Signature(Encoding, pValue) {
        result := ComCall(58, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} KeySpec 
     * @param {Pointer<ICspStatuses>} ppCspStatuses 
     * @returns {HRESULT} 
     */
    GetCspStatuses(KeySpec, ppCspStatuses) {
        result := ComCall(59, this, "int", KeySpec, "ptr", ppCspStatuses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
