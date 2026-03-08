#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IMediaControl interface provides methods for controlling the flow of data through the filter graph.
 * @see https://learn.microsoft.com/windows/win32/api/control/nn-control-imediacontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaControl extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaControl
     * @type {Guid}
     */
    static IID => Guid("{56a868b1-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Run", "Pause", "Stop", "GetState", "RenderFile", "AddSourceFilter", "get_FilterCollection", "get_RegFilterCollection", "StopWhenReady"]

    /**
     * @type {IDispatch} 
     */
    FilterCollection {
        get => this.get_FilterCollection()
    }

    /**
     * @type {IDispatch} 
     */
    RegFilterCollection {
        get => this.get_RegFilterCollection()
    }

    /**
     * The Run method runs all the filters in the filter graph. While the graph is running, data moves through the graph and is rendered.
     * @remarks
     * If the filter graph is stopped, this method pauses the graph before running. If the graph is already running, the method returns S_OK but has no effect.
     * 
     * The graph runs until the application calls the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediacontrol-pause">IMediaControl::Pause</a> or <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediacontrol-stop">IMediaControl::Stop</a> method. When playback reaches the end of the stream, the graph continues to run, but the filters do not stream any more data. At that point, the application can pause or stop the graph. For information about the end-of-stream event, see <b>IMediaControl::Pause</b> and <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-complete">EC_COMPLETE</a>.
     * 
     * This method does not seek to the beginning of the stream. Therefore, if you run the graph, pause it, and then run it again, playback resumes from the paused position. If you run the graph after it has reached the end of the stream, nothing is rendered. To seek the graph, use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imediaseeking">IMediaSeeking</a> interface.
     * 
     * If method returns <b>S_FALSE</b>, it means that the method returned before all of the filters switched to a running state. The filters will complete the transition after the method returns. Optionally, you can wait  for the transition to complete by calling the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediacontrol-getstate">IMediaControl::GetState</a> method with a timeout value. However, this is not required.
     * 
     * If the <b>Run</b> method returns an error code, it means that one or more filters failed to run. However, some filters might be in a running state. In a multistream graph, entire streams might be playing successfully. Typically the application would tear down the graph and report an error in this case.
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
     * The graph is preparing to run, but some filters have not completed the transition to a running state.
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
     * All filters in the graph completed the transition to a running state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediacontrol-run
     */
    Run() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The Pause method pauses all the filters in the filter graph.
     * @remarks
     * Pausing the filter graph cues the graph for immediate rendering when the graph is next run. While the graph is paused, filters process data but do not render it. Data is pushed through the graph and processed by transform filters as far as buffering permits, but renderer filters do not render the data. However, video renderers display a static poster frame of the first sample.
     * 
     * If the method returns S_FALSE, call the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediacontrol-getstate">IMediaControl::GetState</a> method to wait for the state transition to complete, or to check if the transition has completed. When you call <c>Pause</c> to display the first frame of a video file, always follow it immediately with a call to <b>GetState</b> to ensure that the state transition has completed. Failure to do this can result in the video rectangle being painted black.
     * 
     * If the method fails, it stops the graph before returning.
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
     * The graph paused successfully, but some filters have not completed the state transition.
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
     * All filters in the graph completed the transition to a paused state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediacontrol-pause
     */
    Pause() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * The Stop method stops all the filters in the graph.
     * @remarks
     * If the graph is running, this method pauses the graph before stopping it. While paused, video renderers can copy the current frame to display as a poster frame.
     * 
     * This method does not seek to the beginning of the stream. If you call this method and then call the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediacontrol-run">IMediaControl::Run</a> method, playback resumes from the stopped position. To seek, use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imediaseeking">IMediaSeeking</a> interface.
     * 
     * The Filter Graph Manager pauses all the filters in the graph, and then calls the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediafilter-stop">IMediaFilter::Stop</a> method on all filters, without waiting for the pause operations to complete. Therefore, some filters might have their <c>Stop</c> method called before they complete their pause operation. If you develop a custom rendering filter, you might need to handle this case by pausing the filter if it receives a stop command while in a running state. However, most filters do not need to take any special action in this regard.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value that indicates the cause of the error.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediacontrol-stop
     */
    Stop() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * The GetState method retrieves the state of the filter graph�paused, running, or stopped.
     * @remarks
     * Applications can use this method to determine whether playback has started after a call to <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediacontrol-run">IMediaControl::Run</a>. Generally, applications should have their own mechanism for tracking which state they have put the filter graph into. Applications typically use the current state to determine which user interface controls are enabled or disabled. For example, once the graph goes into the running state, the application might disable a "Play" button and enable "Stop" and "Pause" buttons.
     * 
     * If the filter graph is in a transition to a new state, the returned state is the new state, not the previous state.
     * 
     * This method returns an error if there is a call on another thread to change the state while this method is blocked.
     * 
     * Avoid specifying a time-out of INFINITE, because threads cannot process messages while waiting in <c>GetState</code>. If you call <code>GetState</c> from the thread that processes Windows messages, specify small wait times on the call in order to remain responsive to user input. This is especially important when the source is streaming over a network or from the Internet because state transitions in these environments can take significantly more time to complete.
     * 
     * The [FILTER_STATE](/windows/desktop/api/strmif/ne-strmif-filter_state) enumeration. You can cast the variable as follows:
     * 
     * 
     * ```cpp
     * 
     * FILTER_STATE fs;
     * hr = pControl->GetState(msTimeOut, (OAFilterState*)&fs);
     * 
     * ```
     * 
     * 
     * For more information about filter graph states, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/filter-states">Filter States</a>.
     * @param {Integer} msTimeout Duration of the time-out, in milliseconds, or INFINITE to specify an infinite time-out.
     * @returns {Integer} Receives a member of the [FILTER_STATE](/windows/desktop/api/strmif/ne-strmif-filter_state) enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediacontrol-getstate
     */
    GetState(msTimeout) {
        result := ComCall(10, this, "int", msTimeout, "int*", &pfs := 0, "HRESULT")
        return pfs
    }

    /**
     * The RenderFile method builds a filter graph that renders the specified file. (IMediaControl.RenderFile)
     * @param {BSTR} strFilename Specifies the name of the file to load.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediacontrol-renderfile
     */
    RenderFile(strFilename) {
        strFilename := strFilename is String ? BSTR.Alloc(strFilename).Value : strFilename

        result := ComCall(11, this, "ptr", strFilename, "HRESULT")
        return result
    }

    /**
     * The AddSourceFilter method adds a source filter to the filter graph.
     * @param {BSTR} strFilename Specifies the name of the file to load.
     * @returns {IDispatch} Receives a pointer to the <b>IDispatch</b> interface.  The caller must release the interface. You can query the returned pointer for the <b>IFilterInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediacontrol-addsourcefilter
     */
    AddSourceFilter(strFilename) {
        strFilename := strFilename is String ? BSTR.Alloc(strFilename).Value : strFilename

        result := ComCall(12, this, "ptr", strFilename, "ptr*", &ppUnk := 0, "HRESULT")
        return IDispatch(ppUnk)
    }

    /**
     * The get_FilterCollection method retrieves a collection of the filters in the filter graph.
     * @returns {IDispatch} Receives a pointer to the <b>IDispatch</b> interface.  The caller must release the interface. You can query the returned pointer for the <b>IAMCollection</b> interface. The collection contains a list of <b>IFilterInfo</b> pointers.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediacontrol-get_filtercollection
     */
    get_FilterCollection() {
        result := ComCall(13, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IDispatch(ppUnk)
    }

    /**
     * The get_RegFilterCollection method retrieves a collection of all the filters listed in the registry.
     * @returns {IDispatch} Receives a pointer to the <b>IDispatch</b> interface.  The caller must release the interface. You can query the returned pointer for the <b>IAMCollection</b> interface. The collection contains a list of <b>IRegFilterInfo</b> pointers.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediacontrol-get_regfiltercollection
     */
    get_RegFilterCollection() {
        result := ComCall(14, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IDispatch(ppUnk)
    }

    /**
     * The StopWhenReady method pauses the filter graph, allowing filters to queue data, and then stops the filter graph.
     * @remarks
     * This method is useful if you want to seek the filter graph while the graph is stopped. As long as the filter graph is stopped, changes in the current position do not repaint the video window with a new frame. Therefore, calling <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-setpositions">IMediaSeeking::SetPositions</a> does not update the video window. To update the window after the seek operation, call <c>StopWhenReady</c>. This method transitions the graph to a paused state, waits for the pause operation to complete, and then transitions the graph back to stopped. The pause operation queues data in the graph, so that the video renderer receives and displays the new frame.
     * 
     * This method is asynchronous. It waits on a separate thread for the pause to complete. The calling thread does not block, which enables the application to respond to user input. When the method returns, the logical state of the graph is stopped, even before the pause operation completes. If you call the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediacontrol-getstate">IMediaControl::GetState</a> method at this point, it returns State_Stopped.
     * 
     * If the application issues another state-change command (such as pause, run, or seek) before the pause operation completes, the new command cancels the pending stop command. The pause operation completes, but the graph does not stop.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graph was still transitioning to the paused state when the method returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediacontrol-stopwhenready
     */
    StopWhenReady() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}
