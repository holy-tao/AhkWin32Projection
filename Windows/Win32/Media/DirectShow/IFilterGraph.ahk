#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumFilters.ahk
#Include .\IBaseFilter.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IFilterGraph interface provides methods for building a filter graph.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ifiltergraph
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltergraph-addfilter
     */
    AddFilter(pFilter, pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(3, this, "ptr", pFilter, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * The RemoveFilter method removes a filter from the graph.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltergraph-removefilter
     */
    RemoveFilter(pFilter) {
        result := ComCall(4, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * The EnumFilters method provides an enumerator for all filters in the graph.
     * @returns {IEnumFilters} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ienumfilters">IEnumFilters</a> interface. Use this interface to enumerate the filters. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltergraph-enumfilters
     */
    EnumFilters() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumFilters(ppEnum)
    }

    /**
     * The FindFilterByName method finds a filter that was added to the filter graph with a specific name.
     * @param {PWSTR} pName [in, string] Pointer to the name to search for.
     * @returns {IBaseFilter} Receives a pointer to the filter's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltergraph-findfilterbyname
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
     * @returns {HRESULT} Returns one of the following values, or an error value returned by <a href="/windows/desktop/api/strmif/nf-strmif-ipin-connect">IPin::Connect</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltergraph-connectdirect
     */
    ConnectDirect(ppinOut, ppinIn, pmt) {
        result := ComCall(7, this, "ptr", ppinOut, "ptr", ppinIn, "ptr", pmt, "HRESULT")
        return result
    }

    /**
     * The Reconnect method disconnects a pin and then reconnects it to the same pin.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltergraph-reconnect
     */
    Reconnect(ppin) {
        result := ComCall(8, this, "ptr", ppin, "HRESULT")
        return result
    }

    /**
     * The Disconnect method disconnects this pin.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltergraph-disconnect
     */
    Disconnect(ppin) {
        result := ComCall(9, this, "ptr", ppin, "HRESULT")
        return result
    }

    /**
     * The SetDefaultSyncSource method sets the reference clock to the default clock.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltergraph-setdefaultsyncsource
     */
    SetDefaultSyncSource() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
