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
     * 
     * @param {Pointer<HANDLE>} phToken 
     * @returns {HRESULT} 
     */
    GetClientAccessToken(phToken) {
        result := ComCall(3, this, "ptr", phToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pAuthType 
     * @returns {HRESULT} 
     */
    GetAuthType(pAuthType) {
        result := ComCall(4, this, "uint*", pAuthType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
