#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface provides methods for reconnecting an input pin while the filter is still running.
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nn-strmif-ipinconnection
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
     * @remarks
     * If this method succeeds, the pin can accept the media type on the next sample or in a call to <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-receiveconnection">IPin::ReceiveConnection</a>.
     * 
     * An application or filter can call this method to determine whether the filter graph must be reconfigured. If the pin can accept the specified media type, there is no need to reconfigure the graph.
     * 
     * Although the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-queryaccept">IPin::QueryAccept</a> method also determines whether a pin can accept a format type, it does not guarantee that the pin can switch to that format while the filter is running. If you need to switch formats while the filter is running, call <c>DynamicQueryAccept</c> instead.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ipinconnection-dynamicqueryaccept
     */
    DynamicQueryAccept(pmt) {
        result := ComCall(3, this, "ptr", pmt, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The NotifyEndOfStream method requests notification from the pin when the next end-of-stream condition occurs.
     * @remarks
     * This method enables the caller to push data through a portion of the filter graph ending with this pin.
     * 
     * For example, suppose the caller is pushing data from an output pin called "A" on one filter, to an input pin called "B" on another filter, possibly with intermediate filters connecting them. The following sequence of events would take place.
     * 
     * <ol>
     * <li>The caller blocks the data flow at pin A.</li>
     * <li>It calls <c>NotifyEndOfStream</c> on pin B.</li>
     * <li>It calls <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-endofstream">IPin::EndOfStream</a> on the input pin connected to pin A.</li>
     * <li>As the remaining data travels downstream through any intermediate filters, those filters propagate the end-of-stream notification.</li>
     * <li>When pin B receives the end-of-stream notification, it signals the event given in the <i>hNotifyEvent</i> parameter. At that point, the caller can safely reconfigure the graph between pin A and pin B.</li>
     * </ol>
     * Because the purpose of this method is to enable the caller to rebuild the graph dynamically and then restart the connection, the end-of-stream notification does not represent the actual end of the stream. Therefore, pin B does not propagate the end-of-stream condition or signal EC_COMPLETE. This is an exception to the usual rules for data flow in the filter graph.
     * 
     * It is the caller's responsibility to cancel notification by calling this method again with a <b>NULL</b> event handle.
     * 
     * The filter graph calls this method inside the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphconfig-reconnect">IGraphConfig::Reconnect</a> method. If an application or filter does any specialized dynamic reconfiguration to the graph (using the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphconfig-reconfigure">IGraphConfig::Reconfigure</a> method), it might call this method first in order to push data through the portion of the graph that is being reconfigured.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ipinconnection-notifyendofstream
     */
    NotifyEndOfStream(hNotifyEvent) {
        hNotifyEvent := hNotifyEvent is Win32Handle ? NumGet(hNotifyEvent, "ptr") : hNotifyEvent

        result := ComCall(4, this, "ptr", hNotifyEvent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IsEndPin method indicates whether a reconnection search should end at this pin.
     * @remarks
     * A filter or application can call this method to determine whether the pin is a candidate for dynamic reconnection.
     * 
     * Generally, a sink filter or a filter that splits or merges data should return S_OK. Other filters (for example, simple transform filters) should return S_FALSE.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ipinconnection-isendpin
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ipinconnection-dynamicdisconnect
     */
    DynamicDisconnect() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
