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
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     */
    DynamicQueryAccept(pmt) {
        result := ComCall(3, this, "ptr", pmt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hNotifyEvent 
     * @returns {HRESULT} 
     */
    NotifyEndOfStream(hNotifyEvent) {
        hNotifyEvent := hNotifyEvent is Win32Handle ? NumGet(hNotifyEvent, "ptr") : hNotifyEvent

        result := ComCall(4, this, "ptr", hNotifyEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsEndPin() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DynamicDisconnect() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
