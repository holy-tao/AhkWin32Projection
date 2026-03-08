#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumFilters.ahk
#Include .\IBaseFilter.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IFilterGraph interface provides methods for building a filter graph.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ifiltergraph
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFilterGraph extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFilterGraph
     * @type {Guid}
     */
    static IID => Guid("{56a8689f-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddFilter", "RemoveFilter", "EnumFilters", "FindFilterByName", "ConnectDirect", "Reconnect", "Disconnect", "SetDefaultSyncSource"]

    /**
     * The AddFilter method adds a filter to the graph.
     * @remarks
     * The name of the filter can be <b>NULL</b>, in which case the Filter Graph Manager generates a name. If the name is not <b>NULL</b> and is not unique, this method will modify the name in an attempt to generate a new unique name. If this is successful, this method returns VFW_S_DUPLICATE_NAME. If it cannot generate a unique name, it returns VFW_E_DUPLICATE_NAME.
     * 
     * <c>AddFilter</code> calls the filter's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ibasefilter-joinfiltergraph">IBaseFilter::JoinFilterGraph</a> method to inform the filter that it has been added. <code>AddFilter</c> must be called before attempting to use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphbuilder-connect">IGraphBuilder::Connect</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifiltergraph-connectdirect">IFilterGraph::ConnectDirect</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphbuilder-render">IGraphBuilder::Render</a> method to connect or render pins belonging to the added filter.
     * 
     * The Filter Graph Manager holds a reference count on the filter until the filter is removed from the graph or the Filter Graph Manager is released.
     * @param {IBaseFilter} pFilter Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of the filter to add.
     * @param {PWSTR} pName Pointer to a wide-character string containing a name for filter.
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
     * <dt><b>VFW_S_DUPLICATE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully added a filter with a duplicate name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_CERTIFICATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use of this filter is restricted by a software key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_DUPLICATE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to add a filter with a duplicate name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltergraph-addfilter
     */
    AddFilter(pFilter, pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(3, this, "ptr", pFilter, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * The RemoveFilter method removes a filter from the graph.
     * @remarks
     * The Filter Graph Manager notifies the filter that it is being removed by calling the filter's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ibasefilter-joinfiltergraph">IBaseFilter::JoinFilterGraph</a> method with a <b>NULL</b> argument. It is not necessary to disconnect the filter's pins before calling <c>RemoveFilter</code>, but the filter graph should be in the Stopped state. If the filters are not stopped, <code>RemoveFilter</c> may fail to disconnect the pins and then fail to remove the filter from the graph. <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphconfig-removefilterex">IGraphConfig::RemoveFilterEx</a> enables an application to remove a filter without disconnecting the pins automatically, which improves performance if you want to move groups of connected filters into a new graph.
     * @param {IBaseFilter} pFilter Pointer to the filter to be removed from the graph.
     * @returns {HRESULT} Returns one of the following values.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltergraph-removefilter
     */
    RemoveFilter(pFilter) {
        result := ComCall(4, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * The EnumFilters method provides an enumerator for all filters in the graph.
     * @returns {IEnumFilters} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ienumfilters">IEnumFilters</a> interface. Use this interface to enumerate the filters. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltergraph-enumfilters
     */
    EnumFilters() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumFilters(ppEnum)
    }

    /**
     * The FindFilterByName method finds a filter that was added to the filter graph with a specific name.
     * @remarks
     * If no filter is found, the method returns a <b>NULL</b> pointer in the <i>ppFilter</i> parameter.
     * 
     * The returned <b>IBaseFilter</b> interface has an outstanding reference count. The caller must release the interface.
     * @param {PWSTR} pName [in, string] Pointer to the name to search for.
     * @returns {IBaseFilter} Receives a pointer to the filter's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltergraph-findfilterbyname
     */
    FindFilterByName(pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(6, this, "ptr", pName, "ptr*", &ppFilter := 0, "HRESULT")
        return IBaseFilter(ppFilter)
    }

    /**
     * The ConnectDirect method connects the two pins directly (without intervening filters).
     * @param {IPin} ppinOut Pointer to the output pin.
     * @param {IPin} ppinIn Pointer to the input pin.
     * @param {Pointer<AM_MEDIA_TYPE>} pmt Pointer to the media type to use for the connection (optional; can be <b>NULL</b>).
     * @returns {HRESULT} Returns one of the following values, or an error value returned by <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-connect">IPin::Connect</a>.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_IN_GRAPH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the specified pins is not in the graph.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_CIRCULAR_GRAPH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input pin is upstream of the output pin, which would result in a circular graph.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltergraph-connectdirect
     */
    ConnectDirect(ppinOut, ppinIn, pmt) {
        result := ComCall(7, this, "ptr", ppinOut, "ptr", ppinIn, "ptr", pmt, "HRESULT")
        return result
    }

    /**
     * The Reconnect method disconnects a pin and then reconnects it to the same pin.
     * @remarks
     * This method is obsolete; use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifiltergraph2-reconnectex">IFilterGraph2::ReconnectEx</a> method instead.
     * 
     * Filters can call this method in order to renegotiate a pin connection. The method executes on a separate thread. Before calling this method, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-queryaccept">IPin::QueryAccept</a> on the other pin to ensure that the reconnection attempt will succeed. Do not call this method unless <b>QueryAccept</b> returns S_OK. Otherwise, because the reconnection is performed asynchronously, the reconnection might fail even though the <c>Reconnect</c> method succeeds, leaving the filter graph in an inconsistent state.
     * @param {IPin} ppin Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface of the pin to reconnect.
     * @returns {HRESULT} Returns one of the following values.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pin is not connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Filter is not stopped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltergraph-reconnect
     */
    Reconnect(ppin) {
        result := ComCall(8, this, "ptr", ppin, "HRESULT")
        return result
    }

    /**
     * The Disconnect method disconnects this pin.
     * @remarks
     * This method does not completely break the connection. To completely break the connection, both ends must be disconnected.
     * 
     * To remove a filter from the filter graph entirely, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifiltergraph-removefilter">IFilterGraph::RemoveFilter</a> method.
     * @param {IPin} ppin Pointer to the pin to disconnect.
     * @returns {HRESULT} Returns one of the following values.
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
     * Pin was not connected. No error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_STOPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter is not stopped, but does not support reconnection while in a running state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltergraph-disconnect
     */
    Disconnect(ppin) {
        result := ComCall(9, this, "ptr", ppin, "HRESULT")
        return result
    }

    /**
     * The SetDefaultSyncSource method sets the reference clock to the default clock.
     * @remarks
     * This method instructs the Filter Graph Manager to choose a reference clock using its default algorithm. For more information about the algorithm that it uses, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/reference-clocks">Reference Clocks</a>.
     * 
     * Usually you do not need to call this method, because the Filter Graph Manager automatically selects a clock. However, if you call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediafilter-setsyncsource">IMediaFilter::SetSyncSource</a> to override the clock, you can use <c>SetDefaultSyncSource</c> to restore the default clock.
     * 
     * This method fails if the filter graph is running or paused.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
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
     * <dt><b>VFW_E_NOT_STOPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter graph is not stopped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltergraph-setdefaultsyncsource
     */
    SetDefaultSyncSource() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
