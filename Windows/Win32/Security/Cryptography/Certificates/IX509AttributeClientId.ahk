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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeEncode", "InitializeDecode", "get_ClientId", "get_MachineDnsName", "get_UserSamName", "get_ProcessName"]

    /**
     * 
     * @param {Integer} ClientId 
     * @param {BSTR} strMachineDnsName 
     * @param {BSTR} strUserSamName 
     * @param {BSTR} strProcessName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributeclientid-initializeencode
     */
    InitializeEncode(ClientId, strMachineDnsName, strUserSamName, strProcessName) {
        strMachineDnsName := strMachineDnsName is String ? BSTR.Alloc(strMachineDnsName).Value : strMachineDnsName
        strUserSamName := strUserSamName is String ? BSTR.Alloc(strUserSamName).Value : strUserSamName
        strProcessName := strProcessName is String ? BSTR.Alloc(strProcessName).Value : strProcessName

        result := ComCall(10, this, "int", ClientId, "ptr", strMachineDnsName, "ptr", strUserSamName, "ptr", strProcessName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strEncodedData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributeclientid-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(11, this, "int", Encoding, "ptr", strEncodedData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributeclientid-get_clientid
     */
    get_ClientId(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributeclientid-get_machinednsname
     */
    get_MachineDnsName(pValue) {
        result := ComCall(13, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributeclientid-get_usersamname
     */
    get_UserSamName(pValue) {
        result := ComCall(14, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributeclientid-get_processname
     */
    get_ProcessName(pValue) {
        result := ComCall(15, this, "ptr", pValue, "HRESULT")
        return result
    }
}
