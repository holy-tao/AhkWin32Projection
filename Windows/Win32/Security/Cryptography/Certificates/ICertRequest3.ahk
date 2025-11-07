#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICertRequest2.ahk

/**
 * Provide communications between a client or intermediary application and Certificate Services.
 * @see https://docs.microsoft.com/windows/win32/api//certcli/nn-certcli-icertrequest3
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertRequest3 extends ICertRequest2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertRequest3
     * @type {Guid}
     */
    static IID => Guid("{afc8f92b-33a2-4861-bf36-2933b7cd67b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCredential", "GetRequestIdString", "GetIssuedCertificate2", "GetRefreshPolicy"]

    /**
     * 
     * @param {Integer} hWnd 
     * @param {Integer} AuthType 
     * @param {BSTR} strCredential 
     * @param {BSTR} strPassword 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertrequest3-setcredential
     */
    SetCredential(hWnd, AuthType, strCredential, strPassword) {
        strCredential := strCredential is String ? BSTR.Alloc(strCredential).Value : strCredential
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(20, this, "int", hWnd, "int", AuthType, "ptr", strCredential, "ptr", strPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertrequest3-getrequestidstring
     */
    GetRequestIdString() {
        pstrRequestId := BSTR()
        result := ComCall(21, this, "ptr", pstrRequestId, "HRESULT")
        return pstrRequestId
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {BSTR} strRequestId 
     * @param {BSTR} strSerialNumber 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertrequest3-getissuedcertificate2
     */
    GetIssuedCertificate2(strConfig, strRequestId, strSerialNumber) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strRequestId := strRequestId is String ? BSTR.Alloc(strRequestId).Value : strRequestId
        strSerialNumber := strSerialNumber is String ? BSTR.Alloc(strSerialNumber).Value : strSerialNumber

        result := ComCall(22, this, "ptr", strConfig, "ptr", strRequestId, "ptr", strSerialNumber, "uint*", &pDisposition := 0, "HRESULT")
        return pDisposition
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertrequest3-getrefreshpolicy
     */
    GetRefreshPolicy() {
        result := ComCall(23, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }
}
