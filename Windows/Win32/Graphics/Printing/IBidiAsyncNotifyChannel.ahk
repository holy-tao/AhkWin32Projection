#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintAsyncNotifyChannel.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IBidiAsyncNotifyChannel extends IPrintAsyncNotifyChannel{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBidiAsyncNotifyChannel
     * @type {Guid}
     */
    static IID => Guid("{532818f7-921b-4fb2-bff8-2f4fd52ebebf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateNotificationChannel", "GetPrintName", "GetChannelNotificationType", "AsyncGetNotificationSendResponse", "AsyncCloseChannel"]

    /**
     * 
     * @returns {HRESULT} 
     */
    CreateNotificationChannel() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPrintAsyncNotifyDataObject>} param0 
     * @returns {HRESULT} 
     */
    GetPrintName(param0) {
        result := ComCall(6, this, "ptr*", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPrintAsyncNotifyDataObject>} param0 
     * @returns {HRESULT} 
     */
    GetChannelNotificationType(param0) {
        result := ComCall(7, this, "ptr*", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPrintAsyncNotifyDataObject} param0 
     * @param {IAsyncGetSendNotificationCookie} param1 
     * @returns {HRESULT} 
     */
    AsyncGetNotificationSendResponse(param0, param1) {
        result := ComCall(8, this, "ptr", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPrintAsyncNotifyDataObject} param0 
     * @param {IPrintAsyncCookie} param1 
     * @returns {HRESULT} 
     */
    AsyncCloseChannel(param0, param1) {
        result := ComCall(9, this, "ptr", param0, "ptr", param1, "HRESULT")
        return result
    }
}
