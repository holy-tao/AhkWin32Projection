#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Packaging\Opc\IOpcCertificateEnumerator.ahk
#Include ..\Packaging\Opc\IOpcPartUri.ahk
#Include ..\Packaging\Opc\IOpcSignatureCustomObjectEnumerator.ahk
#Include ..\Packaging\Opc\IOpcSignatureReferenceEnumerator.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a single digital signature.
 * @remarks
 * 
 * This interface is linked to the signature manager from which it was instantiated and it cannot exist independently.
 * 
 * An <b>IXpsSignature</b> interface may represent a signature that is not XPS compliant. For example, it could represent a signature that includes only custom parts, which is not allowed by the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignature
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsSignature extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsSignature
     * @type {Guid}
     */
    static IID => Guid("{6ae4c93e-1ade-42fb-898b-3a5658284857}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSignatureId", "GetSignatureValue", "GetCertificateEnumerator", "GetSigningTime", "GetSigningTimeFormat", "GetSignaturePartName", "Verify", "GetPolicy", "GetCustomObjectEnumerator", "GetCustomReferenceEnumerator", "GetSignatureXml", "SetSignatureXml"]

    /**
     * Gets the value of the Id attribute of the Signature element.
     * @returns {PWSTR} The value of the <b>Id</b> attribute of the <b>Signature</b> element. If the <b>Id</b> attribute is not present, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsignatureid
     */
    GetSignatureId() {
        result := ComCall(3, this, "ptr*", &sigId := 0, "HRESULT")
        return sigId
    }

    /**
     * Gets the encrypted hash value of the signature.
     * @param {Pointer<Pointer<Integer>>} signatureHashValue The byte array that represents the encrypted hash value of the signature.
     * @param {Pointer<Integer>} count The length of the byte array that is referenced by <i>signatureHashValue</i>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372949(v=vs.85)">XPS Digital Signature API Errors</a> and  <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsignaturevalue
     */
    GetSignatureValue(signatureHashValue, count) {
        signatureHashValueMarshal := signatureHashValue is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, signatureHashValueMarshal, signatureHashValue, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to an IOpcCertificateEnumerator interface, which enumerates the package certificates that are attached to the signature.
     * @returns {IOpcCertificateEnumerator} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopccertificateenumerator">IOpcCertificateEnumerator</a> interface, which enumerates the certificates that are attached to the signature.
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getcertificateenumerator
     */
    GetCertificateEnumerator() {
        result := ComCall(5, this, "ptr*", &certificateEnumerator := 0, "HRESULT")
        return IOpcCertificateEnumerator(certificateEnumerator)
    }

    /**
     * Gets the date and time of signature creation.
     * @returns {PWSTR} A string that contains the date and time information.
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsigningtime
     */
    GetSigningTime() {
        result := ComCall(6, this, "ptr*", &sigDateTimeString := 0, "HRESULT")
        return sigDateTimeString
    }

    /**
     * Gets the format of the signing time.
     * @returns {Integer} The value of <a href="https://docs.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_signature_time_format">OPC_SIGNATURE_TIME_FORMAT</a> that describes the format of the signing time.
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsigningtimeformat
     */
    GetSigningTimeFormat() {
        result := ComCall(7, this, "int*", &timeFormat := 0, "HRESULT")
        return timeFormat
    }

    /**
     * Gets the part name of the signature part.
     * @returns {IOpcPartUri} A pointer to an  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name of the signature part.
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsignaturepartname
     */
    GetSignaturePartName() {
        result := ComCall(8, this, "ptr*", &signaturePartName := 0, "HRESULT")
        return IOpcPartUri(signaturePartName)
    }

    /**
     * Verifies the signature against a specified X.509 certificate.
     * @param {Pointer<CERT_CONTEXT>} x509Certificate The <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that contains the X.509 certificate that will be used for verification.
     * 
     * If the signature is not incomplete or incompliant, this  certificate will be used  only to  validate that the signed data in the XPS package is intact. The certificate will not be used to perform any other checks.
     *     Before using the certificate the application is expected to verify the trust chain and any other requirements.
     * @returns {Integer} The <a href="https://docs.microsoft.com/windows/win32/api/xpsdigitalsignature/ne-xpsdigitalsignature-xps_signature_status">XPS_SIGNATURE_STATUS</a> value that describes the results of the verification.
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-verify
     */
    Verify(x509Certificate) {
        result := ComCall(9, this, "ptr", x509Certificate, "int*", &sigStatus := 0, "HRESULT")
        return sigStatus
    }

    /**
     * Gets the XPS_SIGN_POLICY value that represents the signing policy used when the signature is created.
     * @returns {Integer} The logical <b>OR</b> of the <a href="https://docs.microsoft.com/windows/win32/api/xpsdigitalsignature/ne-xpsdigitalsignature-xps_sign_policy">XPS_SIGN_POLICY</a> values that represent the signing policy.
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getpolicy
     */
    GetPolicy() {
        result := ComCall(10, this, "int*", &policy := 0, "HRESULT")
        return policy
    }

    /**
     * Gets a pointer to an IOpcSignatureCustomObjectEnumerator interface, which enumerates the custom objects of the signature.
     * @returns {IOpcSignatureCustomObjectEnumerator} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobjectset">IOpcSignatureCustomObjectSet</a> interface, which  enumerates the custom objects of the signature.
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getcustomobjectenumerator
     */
    GetCustomObjectEnumerator() {
        result := ComCall(11, this, "ptr*", &customObjectEnumerator := 0, "HRESULT")
        return IOpcSignatureCustomObjectEnumerator(customObjectEnumerator)
    }

    /**
     * Gets a pointer to an IOpcSignatureReferenceEnumerator interface, which enumerates the custom references of the signature.
     * @returns {IOpcSignatureReferenceEnumerator} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturereferenceenumerator">IOpcSignatureReferenceEnumerator</a> interface, which enumerates the custom references of the signature.
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getcustomreferenceenumerator
     */
    GetCustomReferenceEnumerator() {
        result := ComCall(12, this, "ptr*", &customReferenceEnumerator := 0, "HRESULT")
        return IOpcSignatureReferenceEnumerator(customReferenceEnumerator)
    }

    /**
     * Gets the XML markup of the digital signature.
     * @param {Pointer<Pointer<Integer>>} signatureXml The XML markup of the digital signature.
     * @param {Pointer<Integer>} count The size, in bytes, of the buffer referenced by <i>signatureXml</i>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372949(v=vs.85)">XPS Digital Signature API Errors</a> and  <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsignaturexml
     */
    GetSignatureXml(signatureXml, count) {
        signatureXmlMarshal := signatureXml is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, signatureXmlMarshal, signatureXml, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * Sets the XML markup of the digital signature.
     * @param {Pointer<Integer>} signatureXml The XML markup of the digital signature.
     * @param {Integer} count The size, in bytes, of the buffer referenced by <i>signatureXml</i>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372949(v=vs.85)">XPS Digital Signature API Errors</a> and  <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-setsignaturexml
     */
    SetSignatureXml(signatureXml, count) {
        signatureXmlMarshal := signatureXml is VarRef ? "char*" : "ptr"

        result := ComCall(14, this, signatureXmlMarshal, signatureXml, "uint", count, "HRESULT")
        return result
    }
}
