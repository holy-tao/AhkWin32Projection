#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<PWSTR>} sigId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsignatureid
     */
    GetSignatureId(sigId) {
        result := ComCall(3, this, "ptr", sigId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} signatureHashValue 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsignaturevalue
     */
    GetSignatureValue(signatureHashValue, count) {
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr*", signatureHashValue, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpcCertificateEnumerator>} certificateEnumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getcertificateenumerator
     */
    GetCertificateEnumerator(certificateEnumerator) {
        result := ComCall(5, this, "ptr*", certificateEnumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} sigDateTimeString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsigningtime
     */
    GetSigningTime(sigDateTimeString) {
        result := ComCall(6, this, "ptr", sigDateTimeString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} timeFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsigningtimeformat
     */
    GetSigningTimeFormat(timeFormat) {
        timeFormatMarshal := timeFormat is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, timeFormatMarshal, timeFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpcPartUri>} signaturePartName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsignaturepartname
     */
    GetSignaturePartName(signaturePartName) {
        result := ComCall(8, this, "ptr*", signaturePartName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CERT_CONTEXT>} x509Certificate 
     * @param {Pointer<Integer>} sigStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-verify
     */
    Verify(x509Certificate, sigStatus) {
        sigStatusMarshal := sigStatus is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "ptr", x509Certificate, sigStatusMarshal, sigStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} policy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getpolicy
     */
    GetPolicy(policy) {
        policyMarshal := policy is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, policyMarshal, policy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignatureCustomObjectEnumerator>} customObjectEnumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getcustomobjectenumerator
     */
    GetCustomObjectEnumerator(customObjectEnumerator) {
        result := ComCall(11, this, "ptr*", customObjectEnumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignatureReferenceEnumerator>} customReferenceEnumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getcustomreferenceenumerator
     */
    GetCustomReferenceEnumerator(customReferenceEnumerator) {
        result := ComCall(12, this, "ptr*", customReferenceEnumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} signatureXml 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsignaturexml
     */
    GetSignatureXml(signatureXml, count) {
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr*", signatureXml, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} signatureXml 
     * @param {Integer} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-setsignaturexml
     */
    SetSignatureXml(signatureXml, count) {
        signatureXmlMarshal := signatureXml is VarRef ? "char*" : "ptr"

        result := ComCall(14, this, signatureXmlMarshal, signatureXml, "uint", count, "HRESULT")
        return result
    }
}
