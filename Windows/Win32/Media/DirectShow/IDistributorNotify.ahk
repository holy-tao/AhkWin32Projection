#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDistributorNotify interface enables a plug-in distributor to be notified when the filter graph changes.Applications never use this interface.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-idistributornotify
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDistributorNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDistributorNotify
     * @type {Guid}
     */
    static IID => Guid("{56a868af-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Stop", "Pause", "Run", "SetSyncSource", "NotifyGraphChange"]

    /**
     * The Stop method is called when the filter graph is entering a stopped state.
     * @remarks
     * This method is called before the filters are notified.
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
     * Transition is not complete, but no error has occurred.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idistributornotify-stop
     */
    Stop() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The Pause method is called when the filter graph is entering a paused state.
     * @remarks
     * This method is called before the filters are notified.
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
     * Transition is not complete, but no error has occurred.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idistributornotify-pause
     */
    Pause() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The Run method is called when the filter graph is entering a running state.
     * @remarks
     * This method is called before the filters are notified.
     * @param {Integer} tStart Stream-time offset that will be passed to every filter's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediafilter-run">IMediaFilter::Run</a> method.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idistributornotify-run
     */
    Run(tStart) {
        result := ComCall(5, this, "int64", tStart, "HRESULT")
        return result
    }

    /**
     * The SetSyncSource method is called when a new clock is registered.
     * @remarks
     * This method is called before the filters are notified. Make sure to use <b>AddRef</b> on the <i>pClock</i> parameter if the plug-in distributor intends to hold it beyond this method call.
     * @param {IReferenceClock} pClock Pointer to the new clock's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ireferenceclock">IReferenceClock</a> interface.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idistributornotify-setsyncsource
     */
    SetSyncSource(pClock) {
        result := ComCall(6, this, "ptr", pClock, "HRESULT")
        return result
    }

    /**
     * The NotifyGraphChange method is called when the set of filters in the filter graph changes or any pin connections change.
     * @remarks
     * This method is called whenever the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifiltergraph-addfilter">IFilterGraph::AddFilter</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifiltergraph-removefilter">IFilterGraph::RemoveFilter</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifiltergraph-connectdirect">IFilterGraph::ConnectDirect</a> method is called or a method is called that will lead to one of these being called (such as <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphbuilder-renderfile">IGraphBuilder::RenderFile</a>).
     * 
     * Make sure you call <b>Release</b> on any held filters that have been removed at this point. For performance reasons, PIDs might choose not to rescan the filters until the PIDs actually need the interfaces, because there might be several separate notifications sent. However, it is important to release any cached interfaces immediately.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idistributornotify-notifygraphchange
     */
    NotifyGraphChange() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
