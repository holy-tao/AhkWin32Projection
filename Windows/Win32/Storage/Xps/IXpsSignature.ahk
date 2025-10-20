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
     * 
     * @param {Pointer<PWSTR>} sigId 
     * @returns {HRESULT} 
     */
    GetSignatureId(sigId) {
        result := ComCall(3, this, "ptr", sigId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} signatureHashValue 
     * @param {Pointer<UInt32>} count 
     * @returns {HRESULT} 
     */
    GetSignatureValue(signatureHashValue, count) {
        result := ComCall(4, this, "char*", signatureHashValue, "uint*", count, "int")
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
        result := ComCall(5, this, "ptr", certificateEnumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} sigDateTimeString 
     * @returns {HRESULT} 
     */
    GetSigningTime(sigDateTimeString) {
        result := ComCall(6, this, "ptr", sigDateTimeString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} timeFormat 
     * @returns {HRESULT} 
     */
    GetSigningTimeFormat(timeFormat) {
        result := ComCall(7, this, "int*", timeFormat, "int")
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
        result := ComCall(8, this, "ptr", signaturePartName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CERT_CONTEXT>} x509Certificate 
     * @param {Pointer<Int32>} sigStatus 
     * @returns {HRESULT} 
     */
    Verify(x509Certificate, sigStatus) {
        result := ComCall(9, this, "ptr", x509Certificate, "int*", sigStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} policy 
     * @returns {HRESULT} 
     */
    GetPolicy(policy) {
        result := ComCall(10, this, "int*", policy, "int")
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
        result := ComCall(11, this, "ptr", customObjectEnumerator, "int")
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
        result := ComCall(12, this, "ptr", customReferenceEnumerator, "int")
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
        result := ComCall(13, this, "char*", signatureXml, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} signatureXml 
     * @param {Integer} count 
     * @returns {HRESULT} 
     */
    SetSignatureXml(signatureXml, count) {
        result := ComCall(14, this, "char*", signatureXml, "uint", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
