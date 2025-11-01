#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface to retrieve the access token or authorization scheme used during the authentication of a client.
 * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nn-wsdbase-iwsdhttpauthparameters
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDHttpAuthParameters extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDHttpAuthParameters
     * @type {Guid}
     */
    static IID => Guid("{0b476df0-8dac-480d-b05c-99781a5884aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClientAccessToken", "GetAuthType"]

    /**
     * 
     * @param {Pointer<HANDLE>} phToken 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpauthparameters-getclientaccesstoken
     */
    GetClientAccessToken(phToken) {
        result := ComCall(3, this, "ptr", phToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pAuthType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpauthparameters-getauthtype
     */
    GetAuthType(pAuthType) {
        pAuthTypeMarshal := pAuthType is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pAuthTypeMarshal, pAuthType, "HRESULT")
        return result
    }
}
