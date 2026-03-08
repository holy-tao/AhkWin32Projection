#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcPartUri.ahk
#Include .\IOpcSignaturePartReferenceEnumerator.ahk
#Include .\IOpcSignatureRelationshipReferenceEnumerator.ahk
#Include .\IOpcSignatureReference.ahk
#Include .\IOpcCertificateEnumerator.ahk
#Include .\IOpcSignatureReferenceEnumerator.ahk
#Include .\IOpcSignatureCustomObjectEnumerator.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents a package digital signature.
 * @remarks
 * To generate a signature and create an   <b>IOpcDigitalSignature</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign">IOpcDigitalSignatureManager::Sign</a> method.
 * 
 * To access generated signature by using an   <b>IOpcDigitalSignature</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignatureenumerator-getcurrent">IOpcDigitalSignatureEnumerator::GetCurrent</a> method.
 * 
 * When a signature is generated, this information is serialized in the XML markup of the signature (signature markup).  The signature markup that results is stored in a signature part.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/nn-msopc-iopcdigitalsignature
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcDigitalSignature extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcDigitalSignature
     * @type {Guid}
     */
    static IID => Guid("{52ab21dd-1cd0-4949-bc80-0c1232d00cb4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNamespaces", "GetSignatureId", "GetSignaturePartName", "GetSignatureMethod", "GetCanonicalizationMethod", "GetSignatureValue", "GetSignaturePartReferenceEnumerator", "GetSignatureRelationshipReferenceEnumerator", "GetSigningTime", "GetTimeFormat", "GetPackageObjectReference", "GetCertificateEnumerator", "GetCustomReferenceEnumerator", "GetCustomObjectEnumerator", "GetSignatureXml"]

    /**
     * Gets the prefix and namespace mapping of the Signature element of the signature markup.
     * @remarks
     * The <i>prefixes</i> and <i>namespaces</i> buffers are mapped to each other by index.
     * 
     * This method allocates memory used by the buffers returned in <i>prefixes</i> and <i>namespaces</i> and the strings contained in each buffer.
     * @param {Pointer<Pointer<PWSTR>>} prefixes A pointer to a buffer of XML prefix strings. If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory of each string in the buffer and then to free the memory of the buffer itself.
     * @param {Pointer<Pointer<PWSTR>>} namespaces A pointer to a buffer of XML namespace strings. If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory of each string in the buffer and then to free the memory of the buffer itself.
     * @param {Pointer<Integer>} count The size of the <i>prefixes</i> and <i>namespaces</i> buffers.
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
     * The <i>prefixes</i> parameter is <b>NULL</b>.
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
     * The <i>namespaces</i> parameter is <b>NULL</b>.
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
     * The <i>count</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getnamespaces
     */
    GetNamespaces(prefixes, namespaces, count) {
        prefixesMarshal := prefixes is VarRef ? "ptr*" : "ptr"
        namespacesMarshal := namespaces is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, prefixesMarshal, prefixes, namespacesMarshal, namespaces, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * Gets the value of the Id attribute from the Signature element of the signature markup.
     * @remarks
     * This method allocates memory used by the string returned in <i>signatureId</i>.  If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
     * 
     * The <b>Id</b> attribute of the <b>Signature</b> element is optional. If this method is not called, the <b>Signature</b> element will not have the <b>Id</b> attribute.
     * 
     * To set the signature Id before the signature is generated, call  the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setsignatureid">IOpcSigningOptions::SetSignatureId</a> method.
     * 
     * To access the Id before the signature is generated, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-getsignatureid">IOpcSigningOptions::GetSignatureId</a>. method.
     * @returns {PWSTR} A pointer to the <b>Id</b> attribute value of the signature markup <b>Signature</b> element.
     * 
     * If the <b>Signature</b> element does not have an <b>Id</b> attribute value, <i>signatureId</i> will be the empty string.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsignatureid
     */
    GetSignatureId() {
        result := ComCall(4, this, "ptr*", &signatureId := 0, "HRESULT")
        return signatureId
    }

    /**
     * Gets the part name of the part that contains the signature markup.
     * @remarks
     * To set the part name of this signature part before the signature is generated, call  the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setsignaturepartname">IOpcSigningOptions::SetSignaturePartName</a> method. To access the signature part name before the signature is generated, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-getsignaturepartname">IOpcSigningOptions::GetSignaturePartName</a>.
     * 
     * The signature part that stores signature markup is specific to the signature.
     * @returns {IOpcPartUri} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface pointer that represents the part name of the signature part that contains the signature markup.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturepartname
     */
    GetSignaturePartName() {
        result := ComCall(5, this, "ptr*", &signaturePartName := 0, "HRESULT")
        return IOpcPartUri(signaturePartName)
    }

    /**
     * Gets the signature method used to calculate the value in the SignatureValue element of the signature markup.
     * @remarks
     * This method allocates memory used by the string that is returned in <i>signatureMethod</i>.  If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
     * 
     * To set the signature method before the signature is generated, call  the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setsignaturemethod">IOpcSigningOptions::SetSignatureMethod</a> method.
     * 
     * To access the signature method before the signature is generated, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-getsignaturemethod">IOpcSigningOptions::GetSignatureMethod</a>.  To access the signature method after the signature is generated, call the <b>IOpcDigitalSignature::GetSignatureMethod</b> method. Both methods retrieve the value that was set by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setsignaturemethod">IOpcSigningOptions::SetSignatureMethod</a>.
     * 
     * <div class="alert"><b>Important</b>  A valid signature method must be set before the signature is generated by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign">IOpcDigitalSignatureManager::Sign</a> method.</div>
     * <div> </div>
     * When a signature is generated it is serialized as signature markup. The signature method is used to calculate the value in the <b>SignatureValue</b> element in the signature markup.
     * 
     * When a signature is validated, the signature method is used to recalculate that value, and the recalculated value is compared to the value in the <b>SignatureValue</b> element in the signature markup.
     * @returns {PWSTR} A pointer to the signature method.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturemethod
     */
    GetSignatureMethod() {
        result := ComCall(6, this, "ptr*", &signatureMethod := 0, "HRESULT")
        return signatureMethod
    }

    /**
     * Gets the canonicalization method that was applied to the SignedInfo element of the serialized signature.
     * @remarks
     * When using the APIs to generate a signature, the C14N canonicalization method that removes comments is applied to the <b>SignedInfo</b> element. This method corresponds to the <b>OPC_CANONICALIZATION_C14N</b> enum value.
     * @returns {Integer} An <a href="https://docs.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_canonicalization_method">OPC_CANONICALIZATION_METHOD</a>  value that specifies the canonicalization method that was applied to the <b>SignedInfo</b> element of the signature markup when the signature was generated.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getcanonicalizationmethod
     */
    GetCanonicalizationMethod() {
        result := ComCall(7, this, "int*", &canonicalizationMethod := 0, "HRESULT")
        return canonicalizationMethod
    }

    /**
     * Gets the decoded value in the SignatureValue element of the signature markup.
     * @remarks
     * This method allocates memory used by the buffer returned in <i>signatureValue</i>.  If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
     * 
     * The <b>SignatureValue</b> element contains a base-64 encoded value that was computed by applying the signature method to the <b>SignedInfo</b> element of the signature markup. To get the signature method, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturemethod">GetSignatureMethod</a> method.
     * 
     * When using the APIs to generate a signature, set the signature method by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setsignaturemethod">IOpcSigningOptions::SetSignatureMethod</a> method.
     * @param {Pointer<Pointer<Integer>>} signatureValue A pointer to a buffer that contains the decoded value in the <b>SignatureValue</b> element of the signature markup.
     * @param {Pointer<Integer>} count The size of the <i>signatureHashValue</i> buffer.
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
     *  At least one of the <i>signatureValue</i>, and <i>count</i> parameters is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturevalue
     */
    GetSignatureValue(signatureValue, count) {
        signatureValueMarshal := signatureValue is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, signatureValueMarshal, signatureValue, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * Gets an enumerator of IOpcSignaturePartReference interface pointers, which represent references to parts that have been signed.
     * @returns {IOpcSignaturePartReferenceEnumerator} A pointer to an enumerator of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturepartreference">IOpcSignaturePartReference</a> interface pointers, which represent references to parts that have been signed.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturepartreferenceenumerator
     */
    GetSignaturePartReferenceEnumerator() {
        result := ComCall(9, this, "ptr*", &partReferenceEnumerator := 0, "HRESULT")
        return IOpcSignaturePartReferenceEnumerator(partReferenceEnumerator)
    }

    /**
     * Gets an enumerator of IOpcSignatureRelationshipReference interface pointers, which represent references to relationships that have been signed.
     * @returns {IOpcSignatureRelationshipReferenceEnumerator} A pointer to an enumerator of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturerelationshipreference">IOpcSignatureRelationshipReference</a> interface pointers, which represent references to relationships that have been signed.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturerelationshipreferenceenumerator
     */
    GetSignatureRelationshipReferenceEnumerator() {
        result := ComCall(10, this, "ptr*", &relationshipReferenceEnumerator := 0, "HRESULT")
        return IOpcSignatureRelationshipReferenceEnumerator(relationshipReferenceEnumerator)
    }

    /**
     * Gets a string that indicates the time at which the signature was generated.
     * @remarks
     * This method allocates memory used by the string returned in <i>signingTime</i>.  If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
     * 
     * To get the format of the <i>signingTime </i> string, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-gettimeformat">GetTimeFormat</a> method.
     * 
     * <div class="alert"><b>Caution</b>  This is not a trusted time stamp.</div>
     * <div> </div>
     * @returns {PWSTR} A pointer to a string that indicates the time at which the signature was generated.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsigningtime
     */
    GetSigningTime() {
        result := ComCall(11, this, "ptr*", &signingTime := 0, "HRESULT")
        return signingTime
    }

    /**
     * Gets the format of the string returned by the GetSigningTime method.
     * @remarks
     * To access a string that indicates the time at which the current package signature was generated, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-getsigningtime">GetSigningTime</a> method.
     * 
     * To set the format of the signing time string before the signature is generated, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-settimeformat">IOpcSigningOptions::SetTimeFormat</a> method. To access the format before the signature is generated, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-gettimeformat">IOpcSigningOptions::GetTimeFormat</a> method.
     * @returns {Integer} An <a href="https://docs.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_signature_time_format">OPC_SIGNATURE_TIME_FORMAT</a> value that describes the format of the string returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-getsigningtime">GetSigningTime</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-gettimeformat
     */
    GetTimeFormat() {
        result := ComCall(12, this, "int*", &timeFormat := 0, "HRESULT")
        return timeFormat
    }

    /**
     * Gets an IOpcSignatureReference interface pointer that represents the reference to the package-specific Object element that has been signed.
     * @remarks
     * The   <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereference">IOpcSignatureReference</a>   interface pointer received in the <i>packageObjectReference</i> parameter represents the <b>Reference</b> element that has the  <b>URI</b> attribute value set to "#idPackageObject". The <b>URI</b> attribute value of this element is the <b>Id</b> attribute value of the package-specific <b>Object</b> element, prefixed with a pound sign ("#").
     * 
     * When the signature is generated and serialized as signature markup, the reference and the referenced  package-specific <b>Object</b> element are signed. The following markup shows the package-specific <b>Reference</b> element and the package-specific <b>Object</b> element in the resultant signature markup.
     * 
     * 
     * ```xml
     * <!-- Signature markup. -->
     * <Signature>
     *     <SignedInfo>
     *         [...]
     *         <!-- A reference to the package-specific <Object> that
     *         is, or will be, signed. -->
     *         <Reference URI="#idPackageObject">
     *              [...]
     *         </Reference>
     *     </SignedInfo>
     *     [...]
     *     <!-- The package-specific <Object> element. -->
     *     <Object Id="idPackageObject">
     *         <!-- This element contains the <Reference> elements that
     *         refer to parts and relationships in the package that are
     *         or will be signed. -->
     *         <Manifest>
     *             [...] 
     *         </Manifest>
     *     </Object>
     * </Signature>
     * ```
     * @returns {IOpcSignatureReference} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereference">IOpcSignatureReference</a> interface pointer that represents the reference to the package-specific <b>Object</b> element that has been signed.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getpackageobjectreference
     */
    GetPackageObjectReference() {
        result := ComCall(13, this, "ptr*", &packageObjectReference := 0, "HRESULT")
        return IOpcSignatureReference(packageObjectReference)
    }

    /**
     * Gets an enumerator of certificates that are used in the signature.
     * @returns {IOpcCertificateEnumerator} A pointer to an enumerator of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structures that are used in the signature.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getcertificateenumerator
     */
    GetCertificateEnumerator() {
        result := ComCall(14, this, "ptr*", &certificateEnumerator := 0, "HRESULT")
        return IOpcCertificateEnumerator(certificateEnumerator)
    }

    /**
     * Gets an enumerator of the IOpcSignatureReference interface pointers that represent references to application-specific XML elements that have been signed.
     * @remarks
     * To access the signed XML Element by using an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobject">IOpcSignatureCustomObject</a> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturecustomobjectenumerator-getcurrent">IOpcSignatureCustomObjectEnumerator::GetCurrent</a> method. To access the markup of the signed XML element, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturecustomobject-getxml">IOpcSignatureCustomObject::GetXml</a> method.
     * @returns {IOpcSignatureReferenceEnumerator} A pointer to an enumerator of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereference">IOpcSignatureReference</a> interface pointers.  An <b>IOpcSignatureReference</b> interface pointer represents a reference to an application-specific XML element that has been signed.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getcustomreferenceenumerator
     */
    GetCustomReferenceEnumerator() {
        result := ComCall(15, this, "ptr*", &customReferenceEnumerator := 0, "HRESULT")
        return IOpcSignatureReferenceEnumerator(customReferenceEnumerator)
    }

    /**
     * Gets an enumerator of IOpcSignatureCustomObject interface pointers that represent application-specific Object elements in the signature markup.
     * @returns {IOpcSignatureCustomObjectEnumerator} A pointer to an enumerator of  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobject">IOpcSignatureCustomObject</a> interface pointers.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getcustomobjectenumerator
     */
    GetCustomObjectEnumerator() {
        result := ComCall(16, this, "ptr*", &customObjectEnumerator := 0, "HRESULT")
        return IOpcSignatureCustomObjectEnumerator(customObjectEnumerator)
    }

    /**
     * Gets the signature markup.
     * @remarks
     * This method allocates memory used by the buffer returned in <i>signatureXml</i>.  If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
     * @param {Pointer<Pointer<Integer>>} signatureXml A pointer to a buffer that contains the signature markup.
     * @param {Pointer<Integer>} count The size of the <i>signatureXml</i> buffer.
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
     *  At least one of the <i>digestValue</i>, and <i>count</i> parameters is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturexml
     */
    GetSignatureXml(signatureXml, count) {
        signatureXmlMarshal := signatureXml is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, signatureXmlMarshal, signatureXml, countMarshal, count, "HRESULT")
        return result
    }
}
