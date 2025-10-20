#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines the notifications supported by the IDot11AdHocNetwork interface.
 * @see https://docs.microsoft.com/windows/win32/api//adhoc/nn-adhoc-idot11adhocnetworknotificationsink
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class IDot11AdHocNetworkNotificationSink extends IUnknown{
    /**
     * The interface identifier for IDot11AdHocNetworkNotificationSink
     * @type {Guid}
     */
    static IID => Guid("{8f10cc2a-cf0d-42a0-acbe-e2de7007384d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} eStatus 
     * @returns {HRESULT} 
     */
    OnStatusChange(eStatus) {
        result := ComCall(3, this, "int", eStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eFailReason 
     * @returns {HRESULT} 
     */
    OnConnectFail(eFailReason) {
        result := ComCall(4, this, "int", eFailReason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
