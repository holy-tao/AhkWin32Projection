#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Security\Cryptography\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import ".\XPS_SIGNATURE_STATUS.ahk" { XPS_SIGNATURE_STATUS }
#Import ".\XPS_SIGN_POLICY.ahk" { XPS_SIGN_POLICY }
#Import "..\Packaging\Opc\IOpcPartUri.ahk" { IOpcPartUri }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Packaging\Opc\IOpcSignatureCustomObjectEnumerator.ahk" { IOpcSignatureCustomObjectEnumerator }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Packaging\Opc\IOpcCertificateEnumerator.ahk" { IOpcCertificateEnumerator }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\Packaging\Opc\OPC_SIGNATURE_TIME_FORMAT.ahk" { OPC_SIGNATURE_TIME_FORMAT }
#Import "..\Packaging\Opc\IOpcSignatureReferenceEnumerator.ahk" { IOpcSignatureReferenceEnumerator }

/**
 * Represents a single digital signature.
 * @remarks
 * This interface is linked to the signature manager from which it was instantiated and it cannot exist independently.
 * 
 * An <b>IXpsSignature</b> interface may represent a signature that is not XPS compliant. For example, it could represent a signature that includes only custom parts, which is not allowed by the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
 * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignature
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsSignature extends IUnknown {
    /**
     * The interface identifier for IXpsSignature
     * @type {Guid}
     */
    static IID := Guid("{6ae4c93e-1ade-42fb-898b-3a5658284857}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsSignature interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSignatureId               : IntPtr
        GetSignatureValue            : IntPtr
        GetCertificateEnumerator     : IntPtr
        GetSigningTime               : IntPtr
        GetSigningTimeFormat         : IntPtr
        GetSignaturePartName         : IntPtr
        Verify                       : IntPtr
        GetPolicy                    : IntPtr
        GetCustomObjectEnumerator    : IntPtr
        GetCustomReferenceEnumerator : IntPtr
        GetSignatureXml              : IntPtr
        SetSignatureXml              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsSignature.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the value of the Id attribute of the Signature element. (IXpsSignature.GetSignatureId)
     * @remarks
     * This method allocates the memory used by the string that is returned in <i>sigId</i>.  If <i>sigId</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @returns {PWSTR} The value of the <b>Id</b> attribute of the <b>Signature</b> element. If the <b>Id</b> attribute is not present, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsignatureid
     */
    GetSignatureId() {
        result := ComCall(3, this, PWSTR.Ptr, &sigId := 0, "HRESULT")
        return sigId
    }

    /**
     * Gets the encrypted hash value of the signature.
     * @remarks
     * This method allocates the memory buffer whose pointer is returned in <i>signatureHashValue</i>.  If <i>signatureHashValue</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @param {Pointer<Pointer<Integer>>} signatureHashValue The byte array that represents the encrypted hash value of the signature.
     * @param {Pointer<Integer>} count The length of the byte array that is referenced by <i>signatureHashValue</i>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372949(v=vs.85)">XPS Digital Signature API Errors</a> and  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is not connected to the signature manager.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsignaturevalue
     */
    GetSignatureValue(signatureHashValue, count) {
        signatureHashValueMarshal := signatureHashValue is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, signatureHashValueMarshal, signatureHashValue, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to an IOpcCertificateEnumerator interface, which enumerates the package certificates that are attached to the signature.
     * @remarks
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopccertificateenumerator">IOpcCertificateEnumerator</a> interface returned in <i>certificateEnumerator</i> can be empty; however the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a> requires that at least the signing certificate be included in the XPS package. Package producers may include additional certificates as well. For example, the entire certificate trust chain could be included in the XPS package.
     * @returns {IOpcCertificateEnumerator} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopccertificateenumerator">IOpcCertificateEnumerator</a> interface, which enumerates the certificates that are attached to the signature.
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getcertificateenumerator
     */
    GetCertificateEnumerator() {
        result := ComCall(5, this, "ptr*", &certificateEnumerator := 0, "HRESULT")
        return IOpcCertificateEnumerator(certificateEnumerator)
    }

    /**
     * Gets the date and time of signature creation.
     * @remarks
     * The date-time string returned in <i>sigDateTimeString</i> is in a  W3C date-time format, which is described at <a href="https://www.w3.org/TR/NOTE-datetime.html">http://www.w3.org/TR/NOTE-datetime</a>.
     * 
     * To get the specific format of the date-time string that is returned in <i>sigDateTimeString</i>, call <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsigningtimeformat">GetSigningTimeFormat</a>.
     * 
     * This method allocates the memory used by the string that is returned in <i>sigDateTimeString</i>.  If <i>sigDateTimeString</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @returns {PWSTR} A string that contains the date and time information.
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsigningtime
     */
    GetSigningTime() {
        result := ComCall(6, this, PWSTR.Ptr, &sigDateTimeString := 0, "HRESULT")
        return sigDateTimeString
    }

    /**
     * Gets the format of the signing time.
     * @remarks
     * For more information about the  format of the date-time string that is returned  in <i>timeFormat</i>, see <a href="https://docs.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_signature_time_format">OPC_SIGNATURE_TIME_FORMAT</a>.
     * @returns {OPC_SIGNATURE_TIME_FORMAT} The value of <a href="https://docs.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_signature_time_format">OPC_SIGNATURE_TIME_FORMAT</a> that describes the format of the signing time.
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsigningtimeformat
     */
    GetSigningTimeFormat() {
        result := ComCall(7, this, "int*", &timeFormat := 0, "HRESULT")
        return timeFormat
    }

    /**
     * Gets the part name of the signature part.
     * @returns {IOpcPartUri} A pointer to an  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name of the signature part.
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsignaturepartname
     */
    GetSignaturePartName() {
        result := ComCall(8, this, "ptr*", &signaturePartName := 0, "HRESULT")
        return IOpcPartUri(signaturePartName)
    }

    /**
     * Verifies the signature against a specified X.509 certificate.
     * @remarks
     * This method detects the signature status in the order that is specified in section 10.2.1.2 of the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
     *     The sequence of detection is as follows: incompliant, incomplete, broken, questionable, and, finally, valid.
     *     This means that  if, for example,  a signature is found to be incompliant, no digest will be calculated  if the signature is also broken.
     * 
     * For more information on the different types of signature statuses that can be detected by this method, see  <a href="https://docs.microsoft.com/windows/win32/api/xpsdigitalsignature/ne-xpsdigitalsignature-xps_signature_status">XPS_SIGNATURE_STATUS</a>.
     * @param {Pointer<CERT_CONTEXT>} _x509Certificate The <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that contains the X.509 certificate that will be used for verification.
     * 
     * If the signature is not incomplete or incompliant, this  certificate will be used  only to  validate that the signed data in the XPS package is intact. The certificate will not be used to perform any other checks.
     *     Before using the certificate the application is expected to verify the trust chain and any other requirements.
     * @returns {XPS_SIGNATURE_STATUS} The <a href="https://docs.microsoft.com/windows/win32/api/xpsdigitalsignature/ne-xpsdigitalsignature-xps_signature_status">XPS_SIGNATURE_STATUS</a> value that describes the results of the verification.
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-verify
     */
    Verify(_x509Certificate) {
        result := ComCall(9, this, CERT_CONTEXT.Ptr, _x509Certificate, "int*", &sigStatus := 0, "HRESULT")
        return sigStatus
    }

    /**
     * Gets the XPS_SIGN_POLICY value that represents the signing policy used when the signature is created.
     * @remarks
     * The signing policy value that is returned in <i>policy</i> is determined by examining the signed parts and relationships in the document.
     * 
     * This method deduces the signature policy by examining the list of signed parts and relationships.
     *     For example, the <b>XPS_SIGN_POLICY_DISCARD_CONTROL</b> flag is set if the discard-control relationship type from the XPS package root is signed.
     * @returns {XPS_SIGN_POLICY} The logical <b>OR</b> of the <a href="https://docs.microsoft.com/windows/win32/api/xpsdigitalsignature/ne-xpsdigitalsignature-xps_sign_policy">XPS_SIGN_POLICY</a> values that represent the signing policy.
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getpolicy
     */
    GetPolicy() {
        result := ComCall(10, this, "int*", &policy := 0, "HRESULT")
        return policy
    }

    /**
     * Gets a pointer to an IOpcSignatureCustomObjectEnumerator interface, which enumerates the custom objects of the signature.
     * @returns {IOpcSignatureCustomObjectEnumerator} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobjectset">IOpcSignatureCustomObjectSet</a> interface, which  enumerates the custom objects of the signature.
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getcustomobjectenumerator
     */
    GetCustomObjectEnumerator() {
        result := ComCall(11, this, "ptr*", &customObjectEnumerator := 0, "HRESULT")
        return IOpcSignatureCustomObjectEnumerator(customObjectEnumerator)
    }

    /**
     * Gets a pointer to an IOpcSignatureReferenceEnumerator interface, which enumerates the custom references of the signature.
     * @returns {IOpcSignatureReferenceEnumerator} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereferenceenumerator">IOpcSignatureReferenceEnumerator</a> interface, which enumerates the custom references of the signature.
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getcustomreferenceenumerator
     */
    GetCustomReferenceEnumerator() {
        result := ComCall(12, this, "ptr*", &customReferenceEnumerator := 0, "HRESULT")
        return IOpcSignatureReferenceEnumerator(customReferenceEnumerator)
    }

    /**
     * Gets the XML markup of the digital signature.
     * @remarks
     * This method allocates the memory buffer whose pointer is returned in <i>signatureXml</i>.  If <i>signatureXml</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @param {Pointer<Pointer<Integer>>} signatureXml The XML markup of the digital signature.
     * @param {Pointer<Integer>} count The size, in bytes, of the buffer referenced by <i>signatureXml</i>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372949(v=vs.85)">XPS Digital Signature API Errors</a> and  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is not connected to the signature manager.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsignaturexml
     */
    GetSignatureXml(signatureXml, count) {
        signatureXmlMarshal := signatureXml is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, signatureXmlMarshal, signatureXml, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * Sets the XML markup of the digital signature.
     * @remarks
     * Before calling this method, the application must check that the signature markup is valid. If the signature markup is not valid, this method will fail and the content of the signature part will not be changed.
     * 
     * <div class="alert"><b>Warning</b>  <p class="note">Using this method to create digital signatures might cause other methods of this interface to return signatures and data that are no longer valid.
     * 
     * </div>
     * <div> </div>
     * @param {Pointer<Integer>} signatureXml The XML markup of the digital signature.
     * @param {Integer} count The size, in bytes, of the buffer referenced by <i>signatureXml</i>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372949(v=vs.85)">XPS Digital Signature API Errors</a> and  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <i>signatureXml</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is not connected to the signature manager.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-setsignaturexml
     */
    SetSignatureXml(signatureXml, count) {
        signatureXmlMarshal := signatureXml is VarRef ? "char*" : "ptr"

        result := ComCall(14, this, signatureXmlMarshal, signatureXml, "uint", count, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXpsSignature.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSignatureId := CallbackCreate(GetMethod(implObj, "GetSignatureId"), flags, 2)
        this.vtbl.GetSignatureValue := CallbackCreate(GetMethod(implObj, "GetSignatureValue"), flags, 3)
        this.vtbl.GetCertificateEnumerator := CallbackCreate(GetMethod(implObj, "GetCertificateEnumerator"), flags, 2)
        this.vtbl.GetSigningTime := CallbackCreate(GetMethod(implObj, "GetSigningTime"), flags, 2)
        this.vtbl.GetSigningTimeFormat := CallbackCreate(GetMethod(implObj, "GetSigningTimeFormat"), flags, 2)
        this.vtbl.GetSignaturePartName := CallbackCreate(GetMethod(implObj, "GetSignaturePartName"), flags, 2)
        this.vtbl.Verify := CallbackCreate(GetMethod(implObj, "Verify"), flags, 3)
        this.vtbl.GetPolicy := CallbackCreate(GetMethod(implObj, "GetPolicy"), flags, 2)
        this.vtbl.GetCustomObjectEnumerator := CallbackCreate(GetMethod(implObj, "GetCustomObjectEnumerator"), flags, 2)
        this.vtbl.GetCustomReferenceEnumerator := CallbackCreate(GetMethod(implObj, "GetCustomReferenceEnumerator"), flags, 2)
        this.vtbl.GetSignatureXml := CallbackCreate(GetMethod(implObj, "GetSignatureXml"), flags, 3)
        this.vtbl.SetSignatureXml := CallbackCreate(GetMethod(implObj, "SetSignatureXml"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSignatureId)
        CallbackFree(this.vtbl.GetSignatureValue)
        CallbackFree(this.vtbl.GetCertificateEnumerator)
        CallbackFree(this.vtbl.GetSigningTime)
        CallbackFree(this.vtbl.GetSigningTimeFormat)
        CallbackFree(this.vtbl.GetSignaturePartName)
        CallbackFree(this.vtbl.Verify)
        CallbackFree(this.vtbl.GetPolicy)
        CallbackFree(this.vtbl.GetCustomObjectEnumerator)
        CallbackFree(this.vtbl.GetCustomReferenceEnumerator)
        CallbackFree(this.vtbl.GetSignatureXml)
        CallbackFree(this.vtbl.SetSignatureXml)
    }
}
