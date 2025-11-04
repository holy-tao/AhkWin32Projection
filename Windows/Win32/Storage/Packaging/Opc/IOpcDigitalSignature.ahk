#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents a package digital signature.
 * @remarks
 * 
  * To generate a signature and create an   <b>IOpcDigitalSignature</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign">IOpcDigitalSignatureManager::Sign</a> method.
  * 
  * To access generated signature by using an   <b>IOpcDigitalSignature</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignatureenumerator-getcurrent">IOpcDigitalSignatureEnumerator::GetCurrent</a> method.
  * 
  * When a signature is generated, this information is serialized in the XML markup of the signature (signature markup).  The signature markup that results is stored in a signature part.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcdigitalsignature
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
     * 
     * @param {Pointer<Pointer<PWSTR>>} prefixes 
     * @param {Pointer<Pointer<PWSTR>>} namespaces 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
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
     * 
     * @param {Pointer<PWSTR>} signatureId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsignatureid
     */
    GetSignatureId(signatureId) {
        result := ComCall(4, this, "ptr", signatureId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpcPartUri>} signaturePartName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturepartname
     */
    GetSignaturePartName(signaturePartName) {
        result := ComCall(5, this, "ptr*", signaturePartName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} signatureMethod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturemethod
     */
    GetSignatureMethod(signatureMethod) {
        result := ComCall(6, this, "ptr", signatureMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} canonicalizationMethod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getcanonicalizationmethod
     */
    GetCanonicalizationMethod(canonicalizationMethod) {
        canonicalizationMethodMarshal := canonicalizationMethod is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, canonicalizationMethodMarshal, canonicalizationMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} signatureValue 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturevalue
     */
    GetSignatureValue(signatureValue, count) {
        signatureValueMarshal := signatureValue is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, signatureValueMarshal, signatureValue, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignaturePartReferenceEnumerator>} partReferenceEnumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturepartreferenceenumerator
     */
    GetSignaturePartReferenceEnumerator(partReferenceEnumerator) {
        result := ComCall(9, this, "ptr*", partReferenceEnumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignatureRelationshipReferenceEnumerator>} relationshipReferenceEnumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturerelationshipreferenceenumerator
     */
    GetSignatureRelationshipReferenceEnumerator(relationshipReferenceEnumerator) {
        result := ComCall(10, this, "ptr*", relationshipReferenceEnumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} signingTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsigningtime
     */
    GetSigningTime(signingTime) {
        result := ComCall(11, this, "ptr", signingTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} timeFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-gettimeformat
     */
    GetTimeFormat(timeFormat) {
        timeFormatMarshal := timeFormat is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, timeFormatMarshal, timeFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignatureReference>} packageObjectReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getpackageobjectreference
     */
    GetPackageObjectReference(packageObjectReference) {
        result := ComCall(13, this, "ptr*", packageObjectReference, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpcCertificateEnumerator>} certificateEnumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getcertificateenumerator
     */
    GetCertificateEnumerator(certificateEnumerator) {
        result := ComCall(14, this, "ptr*", certificateEnumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignatureReferenceEnumerator>} customReferenceEnumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getcustomreferenceenumerator
     */
    GetCustomReferenceEnumerator(customReferenceEnumerator) {
        result := ComCall(15, this, "ptr*", customReferenceEnumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignatureCustomObjectEnumerator>} customObjectEnumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getcustomobjectenumerator
     */
    GetCustomObjectEnumerator(customObjectEnumerator) {
        result := ComCall(16, this, "ptr*", customObjectEnumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} signatureXml 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturexml
     */
    GetSignatureXml(signatureXml, count) {
        signatureXmlMarshal := signatureXml is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, signatureXmlMarshal, signatureXml, countMarshal, count, "HRESULT")
        return result
    }
}
