#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface provides methods for reconnecting an input pin while the filter is still running.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ipinconnection
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IPinConnection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPinConnection
     * @type {Guid}
     */
    static IID => Guid("{4a9a62d3-27d4-403d-91e9-89f540e55534}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DynamicQueryAccept", "NotifyEndOfStream", "IsEndPin", "DynamicDisconnect"]

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipinconnection-dynamicqueryaccept
     */
    DynamicQueryAccept(pmt) {
        result := ComCall(3, this, "ptr", pmt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hNotifyEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipinconnection-notifyendofstream
     */
    NotifyEndOfStream(hNotifyEvent) {
        hNotifyEvent := hNotifyEvent is Win32Handle ? NumGet(hNotifyEvent, "ptr") : hNotifyEvent

        result := ComCall(4, this, "ptr", hNotifyEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipinconnection-isendpin
     */
    IsEndPin() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipinconnection-dynamicdisconnect
     */
    DynamicDisconnect() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
