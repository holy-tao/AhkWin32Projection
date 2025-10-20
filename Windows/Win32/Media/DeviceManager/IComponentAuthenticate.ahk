#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IComponentAuthenticate interface provides secure, encrypted communication between modules of Windows Media Device Manager.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-icomponentauthenticate
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IComponentAuthenticate extends IUnknown{
    /**
     * The interface identifier for IComponentAuthenticate
     * @type {Guid}
     */
    static IID => Guid("{a9889c00-6d2b-11d3-8496-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwProtocolID 
     * @param {Integer} dwPass 
     * @param {Pointer<Byte>} pbDataIn 
     * @param {Integer} dwDataInLen 
     * @param {Pointer<Byte>} ppbDataOut 
     * @param {Pointer<UInt32>} pdwDataOutLen 
     * @returns {HRESULT} 
     */
    SACAuth(dwProtocolID, dwPass, pbDataIn, dwDataInLen, ppbDataOut, pdwDataOutLen) {
        result := ComCall(3, this, "uint", dwProtocolID, "uint", dwPass, "char*", pbDataIn, "uint", dwDataInLen, "char*", ppbDataOut, "uint*", pdwDataOutLen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} ppdwProtocols 
     * @param {Pointer<UInt32>} pdwProtocolCount 
     * @returns {HRESULT} 
     */
    SACGetProtocols(ppdwProtocols, pdwProtocolCount) {
        result := ComCall(4, this, "uint*", ppdwProtocols, "uint*", pdwProtocolCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
