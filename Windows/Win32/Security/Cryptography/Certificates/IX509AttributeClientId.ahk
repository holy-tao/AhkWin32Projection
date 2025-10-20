#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509Attribute.ahk

/**
 * Represents an attribute that can be used to identify the client that generated a certificate request.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509attributeclientid
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509AttributeClientId extends IX509Attribute{
    /**
     * The interface identifier for IX509AttributeClientId
     * @type {Guid}
     */
    static IID => Guid("{728ab325-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * 
     * @param {Integer} ClientId 
     * @param {BSTR} strMachineDnsName 
     * @param {BSTR} strUserSamName 
     * @param {BSTR} strProcessName 
     * @returns {HRESULT} 
     */
    InitializeEncode(ClientId, strMachineDnsName, strUserSamName, strProcessName) {
        strMachineDnsName := strMachineDnsName is String ? BSTR.Alloc(strMachineDnsName).Value : strMachineDnsName
        strUserSamName := strUserSamName is String ? BSTR.Alloc(strUserSamName).Value : strUserSamName
        strProcessName := strProcessName is String ? BSTR.Alloc(strProcessName).Value : strProcessName

        result := ComCall(10, this, "int", ClientId, "ptr", strMachineDnsName, "ptr", strUserSamName, "ptr", strProcessName, "int")
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

        result := ComCall(11, this, "int", Encoding, "ptr", strEncodedData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    get_ClientId(pValue) {
        result := ComCall(12, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_MachineDnsName(pValue) {
        result := ComCall(13, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_UserSamName(pValue) {
        result := ComCall(14, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_ProcessName(pValue) {
        result := ComCall(15, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
