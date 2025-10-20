#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509Extension.ahk

/**
 * Enables you to specify a collection of object identifiers (OIDs) that indicate how a certificate can be used by an application.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509extensionmsapplicationpolicies
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509ExtensionMSApplicationPolicies extends IX509Extension{
    /**
     * The interface identifier for IX509ExtensionMSApplicationPolicies
     * @type {Guid}
     */
    static IID => Guid("{728ab321-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * 
     * @param {Pointer<ICertificatePolicies>} pValue 
     * @returns {HRESULT} 
     */
    InitializeEncode(pValue) {
        result := ComCall(12, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strEncodedData 
     * @returns {HRESULT} 
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(13, this, "int", Encoding, "ptr", strEncodedData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICertificatePolicies>} ppValue 
     * @returns {HRESULT} 
     */
    get_Policies(ppValue) {
        result := ComCall(14, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
