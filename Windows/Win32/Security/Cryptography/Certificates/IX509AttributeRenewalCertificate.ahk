#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509Attribute.ahk

/**
 * Represents an attribute that contains the certificate being renewed. This attribute is automatically placed in the PKCS
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509attributerenewalcertificate
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509AttributeRenewalCertificate extends IX509Attribute{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509AttributeRenewalCertificate
     * @type {Guid}
     */
    static IID => Guid("{728ab326-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeEncode", "InitializeDecode", "get_RenewalCertificate"]

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strCert 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributerenewalcertificate-initializeencode
     */
    InitializeEncode(Encoding, strCert) {
        strCert := strCert is String ? BSTR.Alloc(strCert).Value : strCert

        result := ComCall(10, this, "int", Encoding, "ptr", strCert, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strEncodedData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributerenewalcertificate-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(11, this, "int", Encoding, "ptr", strEncodedData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributerenewalcertificate-get_renewalcertificate
     */
    get_RenewalCertificate(Encoding) {
        pValue := BSTR()
        result := ComCall(12, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }
}
