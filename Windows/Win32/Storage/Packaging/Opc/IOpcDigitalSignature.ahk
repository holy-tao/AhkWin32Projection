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
     * 
     * @param {Pointer<PWSTR>} prefixes 
     * @param {Pointer<PWSTR>} namespaces 
     * @param {Pointer<UInt32>} count 
     * @returns {HRESULT} 
     */
    GetNamespaces(prefixes, namespaces, count) {
        result := ComCall(3, this, "ptr", prefixes, "ptr", namespaces, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} signatureId 
     * @returns {HRESULT} 
     */
    GetSignatureId(signatureId) {
        result := ComCall(4, this, "ptr", signatureId, "int")
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
        result := ComCall(5, this, "ptr", signaturePartName, "int")
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
        result := ComCall(6, this, "ptr", signatureMethod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} canonicalizationMethod 
     * @returns {HRESULT} 
     */
    GetCanonicalizationMethod(canonicalizationMethod) {
        result := ComCall(7, this, "int*", canonicalizationMethod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} signatureValue 
     * @param {Pointer<UInt32>} count 
     * @returns {HRESULT} 
     */
    GetSignatureValue(signatureValue, count) {
        result := ComCall(8, this, "char*", signatureValue, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignaturePartReferenceEnumerator>} partReferenceEnumerator 
     * @returns {HRESULT} 
     */
    GetSignaturePartReferenceEnumerator(partReferenceEnumerator) {
        result := ComCall(9, this, "ptr", partReferenceEnumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignatureRelationshipReferenceEnumerator>} relationshipReferenceEnumerator 
     * @returns {HRESULT} 
     */
    GetSignatureRelationshipReferenceEnumerator(relationshipReferenceEnumerator) {
        result := ComCall(10, this, "ptr", relationshipReferenceEnumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} signingTime 
     * @returns {HRESULT} 
     */
    GetSigningTime(signingTime) {
        result := ComCall(11, this, "ptr", signingTime, "int")
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
        result := ComCall(12, this, "int*", timeFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignatureReference>} packageObjectReference 
     * @returns {HRESULT} 
     */
    GetPackageObjectReference(packageObjectReference) {
        result := ComCall(13, this, "ptr", packageObjectReference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcCertificateEnumerator>} certificateEnumerator 
     * @returns {HRESULT} 
     */
    GetCertificateEnumerator(certificateEnumerator) {
        result := ComCall(14, this, "ptr", certificateEnumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignatureReferenceEnumerator>} customReferenceEnumerator 
     * @returns {HRESULT} 
     */
    GetCustomReferenceEnumerator(customReferenceEnumerator) {
        result := ComCall(15, this, "ptr", customReferenceEnumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignatureCustomObjectEnumerator>} customObjectEnumerator 
     * @returns {HRESULT} 
     */
    GetCustomObjectEnumerator(customObjectEnumerator) {
        result := ComCall(16, this, "ptr", customObjectEnumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} signatureXml 
     * @param {Pointer<UInt32>} count 
     * @returns {HRESULT} 
     */
    GetSignatureXml(signatureXml, count) {
        result := ComCall(17, this, "char*", signatureXml, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
