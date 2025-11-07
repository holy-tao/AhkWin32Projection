#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509Attribute.ahk

/**
 * Represents an attribute that contains version information about the client operating system on which the certificate request was generated.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509attributeosversion
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509AttributeOSVersion extends IX509Attribute{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509AttributeOSVersion
     * @type {Guid}
     */
    static IID => Guid("{728ab32a-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeEncode", "InitializeDecode", "get_OSVersion"]

    /**
     * 
     * @param {BSTR} strOSVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributeosversion-initializeencode
     */
    InitializeEncode(strOSVersion) {
        strOSVersion := strOSVersion is String ? BSTR.Alloc(strOSVersion).Value : strOSVersion

        result := ComCall(10, this, "ptr", strOSVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strEncodedData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributeosversion-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(11, this, "int", Encoding, "ptr", strEncodedData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributeosversion-get_osversion
     */
    get_OSVersion() {
        pValue := BSTR()
        result := ComCall(12, this, "ptr", pValue, "HRESULT")
        return pValue
    }
}
