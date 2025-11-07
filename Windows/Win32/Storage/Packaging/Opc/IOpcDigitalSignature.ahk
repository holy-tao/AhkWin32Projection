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
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsignatureid
     */
    GetSignatureId() {
        result := ComCall(4, this, "ptr*", &signatureId := 0, "HRESULT")
        return signatureId
    }

    /**
     * 
     * @returns {IOpcPartUri} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturepartname
     */
    GetSignaturePartName() {
        result := ComCall(5, this, "ptr*", &signaturePartName := 0, "HRESULT")
        return IOpcPartUri(signaturePartName)
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturemethod
     */
    GetSignatureMethod() {
        result := ComCall(6, this, "ptr*", &signatureMethod := 0, "HRESULT")
        return signatureMethod
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getcanonicalizationmethod
     */
    GetCanonicalizationMethod() {
        result := ComCall(7, this, "int*", &canonicalizationMethod := 0, "HRESULT")
        return canonicalizationMethod
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
     * @returns {IOpcSignaturePartReferenceEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturepartreferenceenumerator
     */
    GetSignaturePartReferenceEnumerator() {
        result := ComCall(9, this, "ptr*", &partReferenceEnumerator := 0, "HRESULT")
        return IOpcSignaturePartReferenceEnumerator(partReferenceEnumerator)
    }

    /**
     * 
     * @returns {IOpcSignatureRelationshipReferenceEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturerelationshipreferenceenumerator
     */
    GetSignatureRelationshipReferenceEnumerator() {
        result := ComCall(10, this, "ptr*", &relationshipReferenceEnumerator := 0, "HRESULT")
        return IOpcSignatureRelationshipReferenceEnumerator(relationshipReferenceEnumerator)
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getsigningtime
     */
    GetSigningTime() {
        result := ComCall(11, this, "ptr*", &signingTime := 0, "HRESULT")
        return signingTime
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-gettimeformat
     */
    GetTimeFormat() {
        result := ComCall(12, this, "int*", &timeFormat := 0, "HRESULT")
        return timeFormat
    }

    /**
     * 
     * @returns {IOpcSignatureReference} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getpackageobjectreference
     */
    GetPackageObjectReference() {
        result := ComCall(13, this, "ptr*", &packageObjectReference := 0, "HRESULT")
        return IOpcSignatureReference(packageObjectReference)
    }

    /**
     * 
     * @returns {IOpcCertificateEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getcertificateenumerator
     */
    GetCertificateEnumerator() {
        result := ComCall(14, this, "ptr*", &certificateEnumerator := 0, "HRESULT")
        return IOpcCertificateEnumerator(certificateEnumerator)
    }

    /**
     * 
     * @returns {IOpcSignatureReferenceEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getcustomreferenceenumerator
     */
    GetCustomReferenceEnumerator() {
        result := ComCall(15, this, "ptr*", &customReferenceEnumerator := 0, "HRESULT")
        return IOpcSignatureReferenceEnumerator(customReferenceEnumerator)
    }

    /**
     * 
     * @returns {IOpcSignatureCustomObjectEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcdigitalsignature-getcustomobjectenumerator
     */
    GetCustomObjectEnumerator() {
        result := ComCall(16, this, "ptr*", &customObjectEnumerator := 0, "HRESULT")
        return IOpcSignatureCustomObjectEnumerator(customObjectEnumerator)
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
