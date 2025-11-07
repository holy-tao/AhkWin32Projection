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
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsignatureid
     */
    GetSignatureId() {
        result := ComCall(3, this, "ptr*", &sigId := 0, "HRESULT")
        return sigId
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} signatureHashValue 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsignaturevalue
     */
    GetSignatureValue(signatureHashValue, count) {
        signatureHashValueMarshal := signatureHashValue is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, signatureHashValueMarshal, signatureHashValue, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IOpcCertificateEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getcertificateenumerator
     */
    GetCertificateEnumerator() {
        result := ComCall(5, this, "ptr*", &certificateEnumerator := 0, "HRESULT")
        return IOpcCertificateEnumerator(certificateEnumerator)
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsigningtime
     */
    GetSigningTime() {
        result := ComCall(6, this, "ptr*", &sigDateTimeString := 0, "HRESULT")
        return sigDateTimeString
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsigningtimeformat
     */
    GetSigningTimeFormat() {
        result := ComCall(7, this, "int*", &timeFormat := 0, "HRESULT")
        return timeFormat
    }

    /**
     * 
     * @returns {IOpcPartUri} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsignaturepartname
     */
    GetSignaturePartName() {
        result := ComCall(8, this, "ptr*", &signaturePartName := 0, "HRESULT")
        return IOpcPartUri(signaturePartName)
    }

    /**
     * 
     * @param {Pointer<CERT_CONTEXT>} x509Certificate 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-verify
     */
    Verify(x509Certificate) {
        result := ComCall(9, this, "ptr", x509Certificate, "int*", &sigStatus := 0, "HRESULT")
        return sigStatus
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getpolicy
     */
    GetPolicy() {
        result := ComCall(10, this, "int*", &policy := 0, "HRESULT")
        return policy
    }

    /**
     * 
     * @returns {IOpcSignatureCustomObjectEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getcustomobjectenumerator
     */
    GetCustomObjectEnumerator() {
        result := ComCall(11, this, "ptr*", &customObjectEnumerator := 0, "HRESULT")
        return IOpcSignatureCustomObjectEnumerator(customObjectEnumerator)
    }

    /**
     * 
     * @returns {IOpcSignatureReferenceEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getcustomreferenceenumerator
     */
    GetCustomReferenceEnumerator() {
        result := ComCall(12, this, "ptr*", &customReferenceEnumerator := 0, "HRESULT")
        return IOpcSignatureReferenceEnumerator(customReferenceEnumerator)
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} signatureXml 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignature-getsignaturexml
     */
    GetSignatureXml(signatureXml, count) {
        signatureXmlMarshal := signatureXml is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, signatureXmlMarshal, signatureXml, countMarshal, count, "HRESULT")
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
