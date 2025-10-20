#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetRasConnectionIpUiInfo extends IUnknown{
    /**
     * The interface identifier for INetRasConnectionIpUiInfo
     * @type {Guid}
     */
    static IID => Guid("{faedcf58-31fe-11d1-aad2-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<RASCON_IPUI>} pInfo 
     * @returns {HRESULT} 
     */
    GetUiInfo(pInfo) {
        result := ComCall(3, this, "ptr", pInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
