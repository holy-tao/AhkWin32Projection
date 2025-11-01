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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SACAuth", "SACGetProtocols"]

    /**
     * 
     * @param {Integer} dwProtocolID 
     * @param {Integer} dwPass 
     * @param {Pointer<Integer>} pbDataIn 
     * @param {Integer} dwDataInLen 
     * @param {Pointer<Pointer<Integer>>} ppbDataOut 
     * @param {Pointer<Integer>} pdwDataOutLen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-icomponentauthenticate-sacauth
     */
    SACAuth(dwProtocolID, dwPass, pbDataIn, dwDataInLen, ppbDataOut, pdwDataOutLen) {
        pbDataInMarshal := pbDataIn is VarRef ? "char*" : "ptr"
        pdwDataOutLenMarshal := pdwDataOutLen is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwProtocolID, "uint", dwPass, pbDataInMarshal, pbDataIn, "uint", dwDataInLen, "ptr*", ppbDataOut, pdwDataOutLenMarshal, pdwDataOutLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppdwProtocols 
     * @param {Pointer<Integer>} pdwProtocolCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-icomponentauthenticate-sacgetprotocols
     */
    SACGetProtocols(ppdwProtocols, pdwProtocolCount) {
        pdwProtocolCountMarshal := pdwProtocolCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr*", ppdwProtocols, pdwProtocolCountMarshal, pdwProtocolCount, "HRESULT")
        return result
    }
}
