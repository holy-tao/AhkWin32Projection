#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcSignaturePartReferenceSet.ahk
#Include .\IOpcSignatureRelationshipReferenceSet.ahk
#Include .\IOpcSignatureCustomObjectSet.ahk
#Include .\IOpcSignatureReferenceSet.ahk
#Include .\IOpcCertificateSet.ahk
#Include .\IOpcPartUri.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSignatureId", "SetSignatureId", "GetSignatureMethod", "SetSignatureMethod", "GetDefaultDigestMethod", "SetDefaultDigestMethod", "GetCertificateEmbeddingOption", "SetCertificateEmbeddingOption", "GetTimeFormat", "SetTimeFormat", "GetSignaturePartReferenceSet", "GetSignatureRelationshipReferenceSet", "GetCustomObjectSet", "GetCustomReferenceSet", "GetCertificateSet", "GetSignaturePartName", "SetSignaturePartName"]

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-getsignatureid
     */
    GetSignatureId() {
        result := ComCall(3, this, "ptr*", &signatureId := 0, "HRESULT")
        return signatureId
    }

    /**
     * 
     * @param {PWSTR} signatureId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-setsignatureid
     */
    SetSignatureId(signatureId) {
        signatureId := signatureId is String ? StrPtr(signatureId) : signatureId

        result := ComCall(4, this, "ptr", signatureId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-getsignaturemethod
     */
    GetSignatureMethod() {
        result := ComCall(5, this, "ptr*", &signatureMethod := 0, "HRESULT")
        return signatureMethod
    }

    /**
     * 
     * @param {PWSTR} signatureMethod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-setsignaturemethod
     */
    SetSignatureMethod(signatureMethod) {
        signatureMethod := signatureMethod is String ? StrPtr(signatureMethod) : signatureMethod

        result := ComCall(6, this, "ptr", signatureMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-getdefaultdigestmethod
     */
    GetDefaultDigestMethod() {
        result := ComCall(7, this, "ptr*", &digestMethod := 0, "HRESULT")
        return digestMethod
    }

    /**
     * 
     * @param {PWSTR} digestMethod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-setdefaultdigestmethod
     */
    SetDefaultDigestMethod(digestMethod) {
        digestMethod := digestMethod is String ? StrPtr(digestMethod) : digestMethod

        result := ComCall(8, this, "ptr", digestMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-getcertificateembeddingoption
     */
    GetCertificateEmbeddingOption() {
        result := ComCall(9, this, "int*", &embeddingOption := 0, "HRESULT")
        return embeddingOption
    }

    /**
     * 
     * @param {Integer} embeddingOption 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-setcertificateembeddingoption
     */
    SetCertificateEmbeddingOption(embeddingOption) {
        result := ComCall(10, this, "int", embeddingOption, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-gettimeformat
     */
    GetTimeFormat() {
        result := ComCall(11, this, "int*", &timeFormat := 0, "HRESULT")
        return timeFormat
    }

    /**
     * 
     * @param {Integer} timeFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-settimeformat
     */
    SetTimeFormat(timeFormat) {
        result := ComCall(12, this, "int", timeFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IOpcSignaturePartReferenceSet} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-getsignaturepartreferenceset
     */
    GetSignaturePartReferenceSet() {
        result := ComCall(13, this, "ptr*", &partReferenceSet := 0, "HRESULT")
        return IOpcSignaturePartReferenceSet(partReferenceSet)
    }

    /**
     * 
     * @returns {IOpcSignatureRelationshipReferenceSet} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-getsignaturerelationshipreferenceset
     */
    GetSignatureRelationshipReferenceSet() {
        result := ComCall(14, this, "ptr*", &relationshipReferenceSet := 0, "HRESULT")
        return IOpcSignatureRelationshipReferenceSet(relationshipReferenceSet)
    }

    /**
     * 
     * @returns {IOpcSignatureCustomObjectSet} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-getcustomobjectset
     */
    GetCustomObjectSet() {
        result := ComCall(15, this, "ptr*", &customObjectSet := 0, "HRESULT")
        return IOpcSignatureCustomObjectSet(customObjectSet)
    }

    /**
     * 
     * @returns {IOpcSignatureReferenceSet} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-getcustomreferenceset
     */
    GetCustomReferenceSet() {
        result := ComCall(16, this, "ptr*", &customReferenceSet := 0, "HRESULT")
        return IOpcSignatureReferenceSet(customReferenceSet)
    }

    /**
     * 
     * @returns {IOpcCertificateSet} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-getcertificateset
     */
    GetCertificateSet() {
        result := ComCall(17, this, "ptr*", &certificateSet := 0, "HRESULT")
        return IOpcCertificateSet(certificateSet)
    }

    /**
     * 
     * @returns {IOpcPartUri} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-getsignaturepartname
     */
    GetSignaturePartName() {
        result := ComCall(18, this, "ptr*", &signaturePartName := 0, "HRESULT")
        return IOpcPartUri(signaturePartName)
    }

    /**
     * 
     * @param {IOpcPartUri} signaturePartName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-setsignaturepartname
     */
    SetSignaturePartName(signaturePartName) {
        result := ComCall(19, this, "ptr", signaturePartName, "HRESULT")
        return result
    }
}
