#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\IReferenceClock.ahk
#Include ..\..\System\Com\IPersist.ahk

/**
 * The IMediaFilter interface controls the streaming state of a filter.All DirectShow filters implement this interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nn-strmif-imediafilter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaFilter extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaFilter
     * @type {Guid}
     */
    static IID => Guid("{56a86899-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Stop", "Pause", "Run", "GetState", "SetSyncSource", "GetSyncSource"]

    /**
     * The Stop method stops the filter.
     * @remarks
     * When a filter is stopped, it does not process or deliver any samples, and it rejects samples from upstream filters.
     * 
     * The state transition might be asynchronous. If the method returns before the transition completes, the return value is S_FALSE.
     * 
     * This method always sets the filter's state to State_Stopped, even if the method returns an error code.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
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
     * Transition is not complete.
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
     * Success. Transition is complete.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-imediafilter-stop
     */
    Stop() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Pause method pauses the filter.
     * @remarks
     * When a filter is paused, it can receive, process, and deliver samples. However, a renderer filter will only accept one sample while paused. Therefore, when the filter graph is paused, samples move through the graph until the first sample reaches the renderer. At that point, streaming is paused until the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediafilter-run">IMediaFilter::Run</a> method is called. Video renderers display the first sample as a still frame.
     *       
     * 
     * Live capture filters do not deliver any samples while paused, only while running.
     *       
     * 
     * The state transition might be asynchronous. If the method returns before the transition completes, the return value is <b>S_FALSE</b>. A renderer filter does not complete the transition to paused until either (1) it receives one sample, or (2) it receives an end-of-stream notification. While the state transition is pending, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediafilter-getstate">IMediaFilter::GetState</a> returns <b>VFW_S_STATE_INTERMEDIATE</b>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
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
     * Transition is not complete.
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
     * Success. Transition is complete.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-imediafilter-pause
     */
    Pause() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Run method runs the filter.
     * @remarks
     * When a filter is running, it can receive, process, and deliver samples. Source filters generate new samples, and renderer filters render them.
     * 
     * The state transition might be asynchronous. If the method returns before the transition completes, the return value is S_FALSE.
     * 
     * Stream time is calculated as the current reference time minus <i>tStart</i>. To calculate when a media sample should be rendered, the renderer compares the time stamp with the current stream time. Thus, a media sample with a time stamp of zero should be rendered at time <i>tStart</i>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-and-clocks-in-directshow">Time and Clocks in DirectShow</a>.
     * 
     * When an application calls the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediacontrol-run">IMediaControl::Run</a> method, the Filter Graph Manager calls <c>IMediaFilter::Run</c> on each filter. It sets the value of <i>tStart</i> slightly in the future, to account for graph latency.
     * @param {Integer} tStart Reference time corresponding to stream time 0.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
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
     * Transition is not complete.
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
     * Success. Transition is complete.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-imediafilter-run
     */
    Run(tStart) {
        result := ComCall(6, this, "int64", tStart, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetState method retrieves the filter's state (running, stopped, or paused).
     * @remarks
     * State transitions can be asynchronous. If the filter is transitioning to a new state, and the method times out before the transition completes, the method returns <b>VFW_S_STATE_INTERMEDIATE</b>.
     * 
     * If a filter cannot deliver data for some reason, it returns <b>VFW_S_CANT_CUE</b>. Live capture filters return this value while paused, because they do not deliver data in the paused state.
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/data-flow-in-the-filter-graph">Data Flow in the Filter Graph</a>.
     * @param {Integer} dwMilliSecsTimeout Time-out interval, in milliseconds. To block indefinitely, use the value <b>INFINITE</b>.
     * @returns {Integer} Receives a member of the [FILTER_STATE](/windows/desktop/api/strmif/ne-strmif-filter_state) enumerated type, indicating the filter's state.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-imediafilter-getstate
     */
    GetState(dwMilliSecsTimeout) {
        result := ComCall(7, this, "uint", dwMilliSecsTimeout, "int*", &State := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return State
    }

    /**
     * The SetSyncSource method sets the reference clock.
     * @remarks
     * All the filters in the filter graph share the same reference clock, in order to stay synchronized. Stream time is calculated from the reference clock. Renderer filters use the reference clock to schedule when they render samples. If there is no reference clock, a renderer filter renders every sample as soon as it arrives.
     * 
     * This method is implemented by all DirectShow filters, and also by the Filter Graph Manager.
     * 
     * <h3><a id="Filter_Implementation"></a><a id="filter_implementation"></a><a id="FILTER_IMPLEMENTATION"></a>Filter Implementation</h3>
     * When the graph runs, the Filter Graph manager calls this method on every filter in the graph, to notify them of the graph reference clock. Use this method to store the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ireferenceclock">IReferenceClock</a> pointer. Increment the reference count on the stored pointer. Before the filter is removed from the graph, the Filter Graph Manager calls <b>SetSyncSource</b> again with the value <b>NULL</b>. Release the stored pointer and set it to <b>NULL</b>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/cbasefilter">CBaseFilter</a> class implements this method; see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/cbasefilter-setsyncsource">CBaseFilter::SetSyncSource</a>.
     * 
     * Note that filters cannot use this method to select the graph clock. In filters, the only function of this method is to inform the filter of the clock that the graph is using. A filter can provide a reference clock by exposing the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ireferenceclock">IReferenceClock</a> interface. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-and-clocks-in-directshow">Time and Clocks in DirectShow</a>.
     * 
     * <h3><a id="Application_Use"></a><a id="application_use"></a><a id="APPLICATION_USE"></a>Application Use</h3>
     * An application can override the default clock by calling <b>SetSyncSource</b> on the Filter Graph Manager. Do not do this unless you have a particular reason to prefer another clock. You can also set the graph not to use any reference clock, by calling <b>SetSyncSource</b> with the value <b>NULL</b>. You might do this to process samples as quickly as possible. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/setting-the-graph-clock">Setting the Graph Clock</a>.
     * 
     * Applications should never call this method on filters.
     * @param {IReferenceClock} pClock Pointer to the clock's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ireferenceclock">IReferenceClock</a> interface, or <b>NULL</b>. If this parameter is <b>NULL</b>, the filter graph does not use a reference clock, and all filters run as quickly as possible.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-imediafilter-setsyncsource
     */
    SetSyncSource(pClock) {
        result := ComCall(8, this, "ptr", pClock, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetSyncSource method retrieves the current reference clock.
     * @remarks
     * This method returns the same reference clock as the last call to <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediafilter-setsyncsource">IMediaFilter::SetSyncSource</a>. If there is no reference clock, <i>pClock</i> receives the value <b>NULL</b>. When the method returns, if <i>*pClock</i> is non-<b>NULL</b>, the <b>IReferenceClock</b> interface has an outstanding reference count. Be sure to release it when you are done.
     * 
     * You can also call this method on the Filter Graph Manager to determine the current reference clock.
     * @returns {IReferenceClock} Receives a pointer to the clock's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ireferenceclock">IReferenceClock</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-imediafilter-getsyncsource
     */
    GetSyncSource() {
        result := ComCall(9, this, "ptr*", &pClock := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReferenceClock(pClock)
    }
}
