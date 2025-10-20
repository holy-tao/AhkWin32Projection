#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509Extension.ahk

/**
 * Enables you to specify a collection of policy information terms, each of which consists of an object identifier (OID) and optional policy qualifiers. A single policy term is defined by an ICertificatePolicy object.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509extensioncertificatepolicies
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509ExtensionCertificatePolicies extends IX509Extension{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509ExtensionCertificatePolicies
     * @type {Guid}
     */
    static IID => Guid("{728ab320-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeEncode", "InitializeDecode", "get_Policies"]

    /**
     * 
     * @param {ICertificatePolicies} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensioncertificatepolicies-initializeencode
     */
    InitializeEncode(pValue) {
        result := ComCall(12, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strEncodedData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensioncertificatepolicies-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(13, this, "int", Encoding, "ptr", strEncodedData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ICertificatePolicies>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensioncertificatepolicies-get_policies
     */
    get_Policies(ppValue) {
        result := ComCall(14, this, "ptr*", ppValue, "HRESULT")
        return result
    }
}
