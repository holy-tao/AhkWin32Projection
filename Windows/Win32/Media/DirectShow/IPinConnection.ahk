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
     * The DynamicQueryAccept method queries whether the pin can accept the specified media type while the graph is running with the current connection to this pin.
     * @param {Pointer<AM_MEDIA_TYPE>} pmt Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that specifies the media type.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Media type is acceptable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_TYPE_NOT_ACCEPTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Media type is not acceptable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ipinconnection-dynamicqueryaccept
     */
    DynamicQueryAccept(pmt) {
        result := ComCall(3, this, "ptr", pmt, "HRESULT")
        return result
    }

    /**
     * The NotifyEndOfStream method requests notification from the pin when the next end-of-stream condition occurs.
     * @param {HANDLE} hNotifyEvent Handle to an event object that the pin will signal.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Event handle was <b>NULL</b>, but there was no existing event handle to reset.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Event handle was set. (If event handle was <b>NULL</b>, event notification was canceled.)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ipinconnection-notifyendofstream
     */
    NotifyEndOfStream(hNotifyEvent) {
        hNotifyEvent := hNotifyEvent is Win32Handle ? NumGet(hNotifyEvent, "ptr") : hNotifyEvent

        result := ComCall(4, this, "ptr", hNotifyEvent, "HRESULT")
        return result
    }

    /**
     * The IsEndPin method indicates whether a reconnection search should end at this pin.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This pin is not a candidate for reconnection. (The reconnection search should not stop at this pin.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This pin is a candidate for reconnection. (The reconnection search should stop at this pin.)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ipinconnection-isendpin
     */
    IsEndPin() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * The DynamicDisconnect method disconnects the pin when the filter is active (paused or running). Call this method instead of IPin::Disconnect to disconnect a pin when the graph is running or paused.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is already disconnected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ipinconnection-dynamicdisconnect
     */
    DynamicDisconnect() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
