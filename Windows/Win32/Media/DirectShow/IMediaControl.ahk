#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IMediaControl interface provides methods for controlling the flow of data through the filter graph.
 * @see https://docs.microsoft.com/windows/win32/api//control/nn-control-imediacontrol
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
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediacontrol-run
     */
    Run() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The Pause method pauses all the filters in the filter graph.
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
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediacontrol-pause
     */
    Pause() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * The Stop method stops all the filters in the graph.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value that indicates the cause of the error.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediacontrol-stop
     */
    Stop() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * The GetState method retrieves the state of the filter graph�paused, running, or stopped.
     * @param {Integer} msTimeout Duration of the time-out, in milliseconds, or INFINITE to specify an infinite time-out.
     * @returns {Integer} Receives a member of the [FILTER_STATE](/windows/desktop/api/strmif/ne-strmif-filter_state) enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediacontrol-getstate
     */
    GetState(msTimeout) {
        result := ComCall(10, this, "int", msTimeout, "int*", &pfs := 0, "HRESULT")
        return pfs
    }

    /**
     * The RenderFile method builds a filter graph that renders the specified file.
     * @param {BSTR} strFilename Specifies the name of the file to load.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediacontrol-renderfile
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
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediacontrol-addsourcefilter
     */
    AddSourceFilter(strFilename) {
        strFilename := strFilename is String ? BSTR.Alloc(strFilename).Value : strFilename

        result := ComCall(12, this, "ptr", strFilename, "ptr*", &ppUnk := 0, "HRESULT")
        return IDispatch(ppUnk)
    }

    /**
     * The get_FilterCollection method retrieves a collection of the filters in the filter graph.
     * @returns {IDispatch} Receives a pointer to the <b>IDispatch</b> interface.  The caller must release the interface. You can query the returned pointer for the <b>IAMCollection</b> interface. The collection contains a list of <b>IFilterInfo</b> pointers.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediacontrol-get_filtercollection
     */
    get_FilterCollection() {
        result := ComCall(13, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IDispatch(ppUnk)
    }

    /**
     * The get_RegFilterCollection method retrieves a collection of all the filters listed in the registry.
     * @returns {IDispatch} Receives a pointer to the <b>IDispatch</b> interface.  The caller must release the interface. You can query the returned pointer for the <b>IAMCollection</b> interface. The collection contains a list of <b>IRegFilterInfo</b> pointers.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediacontrol-get_regfiltercollection
     */
    get_RegFilterCollection() {
        result := ComCall(14, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IDispatch(ppUnk)
    }

    /**
     * The StopWhenReady method pauses the filter graph, allowing filters to queue data, and then stops the filter graph.
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
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediacontrol-stopwhenready
     */
    StopWhenReady() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}
