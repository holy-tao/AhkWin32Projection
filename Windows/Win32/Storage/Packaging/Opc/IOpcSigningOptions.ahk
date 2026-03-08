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
 * @see https://learn.microsoft.com/windows/win32/api/msopc/nn-msopc-iopcsigningoptions
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
     * Gets the value of the Id attribute from the Signature element.
     * @remarks
     * This method allocates memory used by the string returned in <i>signatureId</i>.  If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
     * 
     * The <b>Id</b> attribute of the <b>Signature</b> element is optional.
     * 
     * To set the signature Id, call  the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setsignatureid">IOpcSigningOptions::SetSignatureId</a> method.
     * 
     * To access the Id before the signature is generated, call the <b>IOpcSigningOptions::GetSignatureId</b>.  To access the signature Id after the signature is generated, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-getsignatureid">IOpcDigitalSignature::GetSignatureId</a> method.
     * @returns {PWSTR} A pointer to the value of the <b>Id</b> attribute, or the empty string "" if there is no <b>Id</b>.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-getsignatureid
     */
    GetSignatureId() {
        result := ComCall(3, this, "ptr*", &signatureId := 0, "HRESULT")
        return signatureId
    }

    /**
     * Sets the value of the Id attribute of the Signature element. (IOpcSigningOptions.SetSignatureId)
     * @remarks
     * The <b>Id</b> attribute of the <b>Signature</b> element is optional. If this method is not called, the <b>Signature</b> element will not have the <b>Id</b> attribute.
     * 
     * To access the Id before the signature is generated, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-getsignatureid">IOpcSigningOptions::GetSignatureId</a>.  To access the signature Id after the signature is generated, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-getsignatureid">IOpcDigitalSignature::GetSignatureId</a> method.
     * @param {PWSTR} signatureId The value of the <b>Id</b> attribute.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>signatureId</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-setsignatureid
     */
    SetSignatureId(signatureId) {
        signatureId := signatureId is String ? StrPtr(signatureId) : signatureId

        result := ComCall(4, this, "ptr", signatureId, "HRESULT")
        return result
    }

    /**
     * Gets the signature method to use to calculate and encrypt the hash value of the SignedInfo element, which will be serialized as the SignatureValue element of the signature.
     * @remarks
     * This method allocates memory used by the string returned in <i>signatureMethod</i>.  If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
     * 
     * To set the signature method, call  the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setsignaturemethod">IOpcSigningOptions::SetSignatureMethod</a> method.
     * 
     * To access the signature method before the signature is generated, call the <b>IOpcSigningOptions::GetSignatureMethod</b>.  To access the signature method after the signature is generated, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturemethod">IOpcDigitalSignature::GetSignatureMethod</a> method.
     * 
     * <div class="alert"><b>Important</b>  A valid signature method must be set before the signature is generated by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign">IOpcDigitalSignatureManager::Sign</a> method.</div>
     * <div> </div>
     * When a signature is generated it is serialized as signature markup. The signature method is used to calculate the value in the <b>SignatureValue</b> element in the signature markup.
     * 
     * When a signature is validated, the signature method is used to recalculate that value, and the recalculated value is compared to the value in the <b>SignatureValue</b> element in the signature markup.
     * @returns {PWSTR} A pointer to the signature method to use, or the empty string "" if no method has been set using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setsignaturemethod">SetSignatureMethod</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-getsignaturemethod
     */
    GetSignatureMethod() {
        result := ComCall(5, this, "ptr*", &signatureMethod := 0, "HRESULT")
        return signatureMethod
    }

    /**
     * Sets the signature method to use to calculate and encrypt the hash value of the SignedInfo element, which will be contained in the SignatureValue element of the signature.
     * @remarks
     * To access the signature method before the signature is generated, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-getsignaturemethod">IOpcSigningOptions::GetSignatureMethod</a>.  To access the signature method after the signature is generated, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturemethod">IOpcDigitalSignature::GetSignatureMethod</a> method.
     * 
     * <div class="alert"><b>Important</b>  A valid signature method must be set before the signature is generated by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign">IOpcDigitalSignatureManager::Sign</a> method.</div>
     * <div> </div>
     * When a signature is generated it is serialized as signature markup. The signature method is used to calculate the value in the <b>SignatureValue</b> element in the signature markup.
     * 
     * When a signature is validated, the signature method is used to recalculate that value, and the recalculated value is compared to the value in the <b>SignatureValue</b> element in the signature markup.
     * @param {PWSTR} signatureMethod The signature method to use.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>signatureMethod</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-setsignaturemethod
     */
    SetSignatureMethod(signatureMethod) {
        signatureMethod := signatureMethod is String ? StrPtr(signatureMethod) : signatureMethod

        result := ComCall(6, this, "ptr", signatureMethod, "HRESULT")
        return result
    }

    /**
     * Gets the default digest method that will be used to compute digest values for objects to be signed.
     * @remarks
     * This method allocates memory used by the string returned in <i>digestMethod</i>.  If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
     * 
     * To set the default digest method, call  the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setdefaultdigestmethod">IOpcSigningOptions::SetDefaultDigestMethod</a> method.
     * 
     * <div class="alert"><b>Important</b>  The default digest method must be set before the signature is generated by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign">IOpcDigitalSignatureManager::Sign</a> method.</div>
     * <div> </div>
     * @returns {PWSTR} A pointer to the default digest method, or the empty string "" if a default has not been set using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setdefaultdigestmethod">SetDefaultDigestMethod</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-getdefaultdigestmethod
     */
    GetDefaultDigestMethod() {
        result := ComCall(7, this, "ptr*", &digestMethod := 0, "HRESULT")
        return digestMethod
    }

    /**
     * Sets the default digest method that will be used to compute digest values for objects to be signed.
     * @remarks
     * To access the default digest method before the signature is generated, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-getdefaultdigestmethod">IOpcSigningOptions::GetDefaultDigestMethod</a>.
     * 
     * <div class="alert"><b>Important</b>  The default digest method for entities to be signed must be set before the signature is generated by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign">IOpcDigitalSignatureManager::Sign</a> method.</div>
     * <div> </div>
     * @param {PWSTR} digestMethod The default digest method.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>digestMethod</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-setdefaultdigestmethod
     */
    SetDefaultDigestMethod(digestMethod) {
        digestMethod := digestMethod is String ? StrPtr(digestMethod) : digestMethod

        result := ComCall(8, this, "ptr", digestMethod, "HRESULT")
        return result
    }

    /**
     * Gets a value that specifies the storage location in the package of the certificate to be used for the signature.
     * @remarks
     * The default location of the certificate is <b>OPC_CERTIFICATE_IN_CERTIFICATE_PART</b>. To change this value, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setcertificateembeddingoption">IOpcSigningOptions::SetCertificateEmbeddingOption</a> method.
     * @returns {Integer} A value that specifies the location of the certificate.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-getcertificateembeddingoption
     */
    GetCertificateEmbeddingOption() {
        result := ComCall(9, this, "int*", &embeddingOption := 0, "HRESULT")
        return embeddingOption
    }

    /**
     * Set the storage location of the certificate to be used for the signature.
     * @remarks
     * This method changes the location of the certificate from the default location, <b>OPC_CERTIFICATE_IN_CERTIFICATE_PART</b>, to a location that is specified by the caller.
     * 
     * To access the value that describes the certificate location, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-getcertificateembeddingoption">IOpcSigningOptions::GetCertificateEmbeddingOption</a> method.
     * @param {Integer} embeddingOption The <a href="https://docs.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_certificate_embedding_option">OPC_CERTIFICATE_EMBEDDING_OPTION</a> value that describes the location of the certificate.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>embeddingOption</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-setcertificateembeddingoption
     */
    SetCertificateEmbeddingOption(embeddingOption) {
        result := ComCall(10, this, "int", embeddingOption, "HRESULT")
        return result
    }

    /**
     * Gets the format of the string retrieved by the IOpcDigitalSignature::GetSigningTime method.
     * @remarks
     * The default format of the signing time string is <b>OPC_SIGNATURE_TIME_FORMAT_MILLISECONDS</b>. To change the format of the signing time string, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-settimeformat">IOpcSigningOptions::SetTimeFormat</a> method.
     * 
     * To access the format of the signing time string after the signature has been generated, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-gettimeformat">IOpcDigitalSignature::GetTimeFormat</a> method.
     * @returns {Integer} The value that describes the format of the <i>signingTime</i> parameter of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-getsigningtime">GetSigningTime</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-gettimeformat
     */
    GetTimeFormat() {
        result := ComCall(11, this, "int*", &timeFormat := 0, "HRESULT")
        return timeFormat
    }

    /**
     * Sets the format of the string retrieved by the IOpcDigitalSignature::GetSigningTime method.
     * @remarks
     * This method changes the format of the signing time string from the default format, <b>OPC_SIGNATURE_TIME_FORMAT_MILLISECONDS</b>, to a format that is specified by the caller.
     * 
     * To access the format of the signing time string before the signature is generated, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-gettimeformat">IOpcSigningOptions::GetTimeFormat</a> method. To access the format after the signature has been generated, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-gettimeformat">IOpcDigitalSignature::GetTimeFormat</a> method.
     * @param {Integer} timeFormat The value that describes the format of the string retrieved by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-getsigningtime">IOpcDigitalSignature::GetSigningTime</a> method.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value passed in the <i>timeFormat</i> parameter is not a valid <a href="https://docs.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_signature_time_format">OPC_SIGNATURE_TIME_FORMAT</a> enumeration value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-settimeformat
     */
    SetTimeFormat(timeFormat) {
        result := ComCall(12, this, "int", timeFormat, "HRESULT")
        return result
    }

    /**
     * Gets an IOpcSignaturePartReferenceSet interface.
     * @remarks
     * This method gets an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturepartreferenceset">IOpcSignaturePartReferenceSet</a> interface pointer that provides methods enabling the creation and deletion of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturepartreference">IOpcSignaturePartReference</a> interface pointers in the set. The <b>IOpcSignaturePartReference</b> interface pointers represent references to parts to be signed.
     * @returns {IOpcSignaturePartReferenceSet} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturepartreferenceset">IOpcSignaturePartReferenceSet</a> interface pointers.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-getsignaturepartreferenceset
     */
    GetSignaturePartReferenceSet() {
        result := ComCall(13, this, "ptr*", &partReferenceSet := 0, "HRESULT")
        return IOpcSignaturePartReferenceSet(partReferenceSet)
    }

    /**
     * Gets an IOpcSignatureRelationshipReferenceSet interface pointer.
     * @remarks
     * This method gets an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturerelationshipreferenceset">IOpcSignatureRelationshipReferenceSet</a> interface pointer that provides methods enabling the creation and deletion of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturepartreference">IOpcSignaturePartReference</a> interface pointers in the set. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturerelationshipreference">IOpcSignatureRelationshipReference</a> interface pointers represent references to Relationships parts that contain relationships to be signed.
     * @returns {IOpcSignatureRelationshipReferenceSet} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturerelationshipreferenceset">IOpcSignatureRelationshipReferenceSet</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-getsignaturerelationshipreferenceset
     */
    GetSignatureRelationshipReferenceSet() {
        result := ComCall(14, this, "ptr*", &relationshipReferenceSet := 0, "HRESULT")
        return IOpcSignatureRelationshipReferenceSet(relationshipReferenceSet)
    }

    /**
     * Gets an IOpcSignatureCustomObjectSet interface.
     * @remarks
     * This method gets an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobjectset">IOpcSignatureCustomObjectSet</a> interface pointer that provides methods enabling the creation and deletion of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobject">IOpcSignatureCustomObject</a> interface pointers in the set. The <b>IOpcSignatureCustomObject</b> interface pointers represent application-specific <b>Object</b> elements which are serialized in the signature markup when the signature is generated.
     * @returns {IOpcSignatureCustomObjectSet} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobjectset">IOpcSignatureCustomObjectSet</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-getcustomobjectset
     */
    GetCustomObjectSet() {
        result := ComCall(15, this, "ptr*", &customObjectSet := 0, "HRESULT")
        return IOpcSignatureCustomObjectSet(customObjectSet)
    }

    /**
     * Gets an IOpcSignatureReferenceSet interface pointer.
     * @remarks
     * This method gets an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereferenceset">IOpcSignatureReferenceSet</a> interface pointer that provides methods enabling the creation and deletion of the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereference">IOpcSignatureReference</a> interface pointers in the set. The <b>IOpcSignatureReference</b> interface pointers represent references to XML elements to be signed.
     * @returns {IOpcSignatureReferenceSet} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereferenceset">IOpcSignatureReferenceSet</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-getcustomreferenceset
     */
    GetCustomReferenceSet() {
        result := ComCall(16, this, "ptr*", &customReferenceSet := 0, "HRESULT")
        return IOpcSignatureReferenceSet(customReferenceSet)
    }

    /**
     * Gets an IOpcCertificateSet interface pointer.
     * @remarks
     * This method gets a set that provides methods enabling the addition and removal of certificates from a certificate chain that will be associated with the signature when it is generated.
     * 
     * Do not include the certificate use to generate the signature in this set. This certificate, the signer certificate, is required for signature generation. To generate the signature, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign">IOpcDigitalSignatureManager::Sign</a> method with the <i>certificate</i> parameter value set to a pointer to the signer certificate.
     * @returns {IOpcCertificateSet} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopccertificateset">IOpcCertificateSet</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-getcertificateset
     */
    GetCertificateSet() {
        result := ComCall(17, this, "ptr*", &certificateSet := 0, "HRESULT")
        return IOpcCertificateSet(certificateSet)
    }

    /**
     * Gets the part name of the signature part where the signature markup will be stored.
     * @remarks
     * To set the part name of the signature part that stores the signature markup, call  the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setsignaturepartname">IOpcSigningOptions::SetSignaturePartName</a> method.
     * 
     * To access the signature part name after the signature is generated, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturepartname">IOpcDigitalSignature::GetSignaturePartName</a> method.
     * 
     * The signature part that stores signature markup is specific to the signature.
     * @returns {IOpcPartUri} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface pointer that represents the part name of the part where the signature markup is stored,  or <b>NULL</b> if the part name  has not been set by a call to  the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setsignaturepartname">SetSignaturePartName</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-getsignaturepartname
     */
    GetSignaturePartName() {
        result := ComCall(18, this, "ptr*", &signaturePartName := 0, "HRESULT")
        return IOpcPartUri(signaturePartName)
    }

    /**
     * Sets the part name of the signature part where the signature markup will be stored.
     * @remarks
     * Until the signature is generated, the part name of the signature part that stores the signature markup can be changed. To set a new part name, call this method with the <i>signaturePartName</i> parameter value set to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface pointer that represents the new name. To clear an existing part name, set the <i>signaturePartName</i> parameter value to <b>NULL</b>. 
     * 
     * To access the signature part name before the signature is generated, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-getsignaturepartname">IOpcSigningOptions::GetSignaturePartName</a>.  To access the signature part name after the signature is generated, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturepartname">IOpcDigitalSignature::GetSignaturePartName</a> method.
     * 
     * The signature part that stores signature markup is specific to the signature.
     * @param {IOpcPartUri} signaturePartName An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface pointer that represents the part name of the part where the signature markup is stored,  or <b>NULL</b> to generate a part name when the signature is created.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsigningoptions-setsignaturepartname
     */
    SetSignaturePartName(signaturePartName) {
        result := ComCall(19, this, "ptr", signaturePartName, "HRESULT")
        return result
    }
}
