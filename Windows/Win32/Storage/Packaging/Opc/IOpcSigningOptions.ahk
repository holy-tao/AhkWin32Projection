#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to set and access information required to generate a signature.
 * @remarks
 * 
  * To generate a signature, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign">IOpcDigitalSignatureManager::Sign</a> method with the <i>signingOptions</i> parameter value set to an <b>IOpcSigningOptions</b> interface pointer.
  * 
  * To create an <b>IOpcSigningOptions</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-createsigningoptions">IOpcDigitalSignatureManager::CreateSigningOptions</a> method.
  * 
  * The caller must set a default for the digest method and signature method before generating a signature. To set a default digest method, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setdefaultdigestmethod">SetDefaultDigestMethod</a> method. To set a signature method, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setsignaturemethod">SetSignatureMethod</a> method.
  * 
  * To get an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobjectset">IOpcSignatureCustomObjectSet</a> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-getcustomobjectset">GetCustomObjectSet</a> method. The interface pointers in the set represent application-specific <b>Object</b> elements.
  * 
  *  To get an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereferenceset">IOpcSignatureReferenceSet</a> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-getcustomreferenceset">GetCustomReferenceSet</a> method. The interface pointers in the set represent references to application-specific <b>Object</b> elements or their children that will be signed when the signature is generated.
  * 
  * The default location of the certificate is <b>OPC_CERTIFICATE_IN_CERTIFICATE_PART</b>. To change this value, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setcertificateembeddingoption">SetCertificateEmbeddingOption</a> method.
  * 
  * The default format of the signing time string is <b>OPC_SIGNATURE_TIME_FORMAT_MILLISECONDS</b>. To change the format of the signing time string, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-settimeformat">SetTimeFormat</a> method.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcsigningoptions
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcSigningOptions extends IUnknown{
    /**
     * The interface identifier for IOpcSigningOptions
     * @type {Guid}
     */
    static IID => Guid("{50d2d6a5-7aeb-46c0-b241-43ab0e9b407e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} signatureId 
     * @returns {HRESULT} 
     */
    GetSignatureId(signatureId) {
        result := ComCall(3, this, "ptr", signatureId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} signatureId 
     * @returns {HRESULT} 
     */
    SetSignatureId(signatureId) {
        signatureId := signatureId is String ? StrPtr(signatureId) : signatureId

        result := ComCall(4, this, "ptr", signatureId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} signatureMethod 
     * @returns {HRESULT} 
     */
    GetSignatureMethod(signatureMethod) {
        result := ComCall(5, this, "ptr", signatureMethod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} signatureMethod 
     * @returns {HRESULT} 
     */
    SetSignatureMethod(signatureMethod) {
        signatureMethod := signatureMethod is String ? StrPtr(signatureMethod) : signatureMethod

        result := ComCall(6, this, "ptr", signatureMethod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} digestMethod 
     * @returns {HRESULT} 
     */
    GetDefaultDigestMethod(digestMethod) {
        result := ComCall(7, this, "ptr", digestMethod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} digestMethod 
     * @returns {HRESULT} 
     */
    SetDefaultDigestMethod(digestMethod) {
        digestMethod := digestMethod is String ? StrPtr(digestMethod) : digestMethod

        result := ComCall(8, this, "ptr", digestMethod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} embeddingOption 
     * @returns {HRESULT} 
     */
    GetCertificateEmbeddingOption(embeddingOption) {
        result := ComCall(9, this, "int*", embeddingOption, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} embeddingOption 
     * @returns {HRESULT} 
     */
    SetCertificateEmbeddingOption(embeddingOption) {
        result := ComCall(10, this, "int", embeddingOption, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} timeFormat 
     * @returns {HRESULT} 
     */
    GetTimeFormat(timeFormat) {
        result := ComCall(11, this, "int*", timeFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} timeFormat 
     * @returns {HRESULT} 
     */
    SetTimeFormat(timeFormat) {
        result := ComCall(12, this, "int", timeFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignaturePartReferenceSet>} partReferenceSet 
     * @returns {HRESULT} 
     */
    GetSignaturePartReferenceSet(partReferenceSet) {
        result := ComCall(13, this, "ptr", partReferenceSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignatureRelationshipReferenceSet>} relationshipReferenceSet 
     * @returns {HRESULT} 
     */
    GetSignatureRelationshipReferenceSet(relationshipReferenceSet) {
        result := ComCall(14, this, "ptr", relationshipReferenceSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignatureCustomObjectSet>} customObjectSet 
     * @returns {HRESULT} 
     */
    GetCustomObjectSet(customObjectSet) {
        result := ComCall(15, this, "ptr", customObjectSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignatureReferenceSet>} customReferenceSet 
     * @returns {HRESULT} 
     */
    GetCustomReferenceSet(customReferenceSet) {
        result := ComCall(16, this, "ptr", customReferenceSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcCertificateSet>} certificateSet 
     * @returns {HRESULT} 
     */
    GetCertificateSet(certificateSet) {
        result := ComCall(17, this, "ptr", certificateSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcPartUri>} signaturePartName 
     * @returns {HRESULT} 
     */
    GetSignaturePartName(signaturePartName) {
        result := ComCall(18, this, "ptr", signaturePartName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcPartUri>} signaturePartName 
     * @returns {HRESULT} 
     */
    SetSignaturePartName(signaturePartName) {
        result := ComCall(19, this, "ptr", signaturePartName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
