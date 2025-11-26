#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumFilters.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The Filter Graph Manager exposes IGraphConfig to support dynamic graph building.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-igraphconfig
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IGraphConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGraphConfig
     * @type {Guid}
     */
    static IID => Guid("{03a1eb8e-32bf-4245-8502-114d08a9cb88}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reconnect", "Reconfigure", "AddFilterToCache", "EnumCacheFilter", "RemoveFilterFromCache", "GetStartTime", "PushThroughData", "SetFilterFlags", "GetFilterFlags", "RemoveFilterEx"]

    /**
     * The Reconnect method performs a dynamic reconnection between two pins.
     * @param {IPin} pOutputPin Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface of an output pin. Can be <b>NULL</b>, in which case <i>pInputPin</i> must not be <b>NULL</b>.
     * @param {IPin} pInputPin Pointer the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface to an input pin. Can be <b>NULL</b>, in which case <i>pOutputPin</i> must not be <b>NULL</b>.
     * @param {Pointer<AM_MEDIA_TYPE>} pmtFirstConnection Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that specifies the media type for the first pin connection made during the reconnection. If this parameter is <b>NULL</b>, the first connection can have any media type.
     * @param {IBaseFilter} pUsingFilter Pointer to an optional filter to use in the reconnection. The filter must already be in the graph. Can be <b>NULL</b>.
     * @param {HANDLE} hAbortEvent Handle to an event. If the caller is a filter calling on one of its data processing threads, this parameter should be a handle to an event that will be signaled when the filter is put into a stopped state. Otherwise, this parameter can be <b>NULL</b>. For more information, see Remarks.
     * @param {Integer} dwFlags Combination of flags from the [AM_GRAPH_CONFIG_RECONNECT_FLAGS](/windows/desktop/api/strmif/ne-strmif-am_graph_config_reconnect_flags) enumeration, specifying how to perform the reconnection.
     * @returns {HRESULT} Returns S_OK if successful. Otherwise, returns an error code that may be one of the following values, or others not listed.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument. (For example, both <i>pInputPin</i> and <i>pOutputPin</i> are <b>NULL</b>.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Input pin does not support <a href="/windows/desktop/api/strmif/nn-strmif-ipinconnection">IPinConnection</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_CANNOT_CONNECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to connect filter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_STATE_CHANGED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the filter changed. Unable to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-igraphconfig-reconnect
     */
    Reconnect(pOutputPin, pInputPin, pmtFirstConnection, pUsingFilter, hAbortEvent, dwFlags) {
        hAbortEvent := hAbortEvent is Win32Handle ? NumGet(hAbortEvent, "ptr") : hAbortEvent

        result := ComCall(3, this, "ptr", pOutputPin, "ptr", pInputPin, "ptr", pmtFirstConnection, "ptr", pUsingFilter, "ptr", hAbortEvent, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The Reconfigure method locks the filter graph and calls a callback function in the application or filter to perform a dynamic reconfiguration.
     * @param {IGraphConfigCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphconfigcallback">IGraphConfigCallback</a> callback interface on the application or filter.
     * @param {Pointer<Void>} pvContext Pointer to a variable of type <b>PVOID</b> that is passed to the callback routine.
     * @param {Integer} dwFlags Application-defined flags that are passed to the callback routine.
     * @param {HANDLE} hAbortEvent Handle to an event. If the caller is a filter calling on one of its data processing threads, this parameter should be a handle to an event that will be signaled when the filter is put into a stopped state. Otherwise, this parameter can be <b>NULL</b>. For more information, see Remarks.
     * @returns {HRESULT} Returns S_OK if successful, or an error code otherwise. Possible errors include VFW_E_WRONG_STATE, if the method could not obtain a lock on the filter graph; whatever <b>HRESULT</b> was returned by the callback routine; or an error code indicating that the graph could not put the filters into a running state.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-igraphconfig-reconfigure
     */
    Reconfigure(pCallback, pvContext, dwFlags, hAbortEvent) {
        hAbortEvent := hAbortEvent is Win32Handle ? NumGet(hAbortEvent, "ptr") : hAbortEvent

        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", pCallback, pvContextMarshal, pvContext, "uint", dwFlags, "ptr", hAbortEvent, "HRESULT")
        return result
    }

    /**
     * The AddFilterToCache method adds a filter to the filter cache.
     * @param {IBaseFilter} pFilter Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of the filter.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Filter is already in the cache.
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
     * Filter was added to the cache.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-igraphconfig-addfiltertocache
     */
    AddFilterToCache(pFilter) {
        result := ComCall(5, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * The EnumCacheFilter method enumerates the filters in the filter cache.
     * @returns {IEnumFilters} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ienumfilters">IEnumFilters</a> interface on the filter enumerator. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-igraphconfig-enumcachefilter
     */
    EnumCacheFilter() {
        result := ComCall(6, this, "ptr*", &pEnum := 0, "HRESULT")
        return IEnumFilters(pEnum)
    }

    /**
     * The RemoveFilterFromCache method removes a filter from the filter cache.
     * @param {IBaseFilter} pFilter Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of the filter to remove from the cache.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Filter was not in the cache.
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
     * Filter was successfully removed from the cache.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-igraphconfig-removefilterfromcache
     */
    RemoveFilterFromCache(pFilter) {
        result := ComCall(7, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * The GetStartTime method retrieves the reference time that was used when the filter graph was last put into a running state.
     * @returns {Integer} Receives the start time.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-igraphconfig-getstarttime
     */
    GetStartTime() {
        result := ComCall(8, this, "int64*", &prtStart := 0, "HRESULT")
        return prtStart
    }

    /**
     * The PushThroughData method pushes data through the filter graph to the specified pin.
     * @param {IPin} pOutputPin Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface of an output pin in the filter graph.
     * @param {IPinConnection} pConnection Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipinconnection">IPinConnection</a> interface of an input pin in the filter graph. This parameter can be <b>NULL</b>.
     * @param {HANDLE} hEventAbort Handle to an event. If the caller is a filter calling on one of its data processing threads, this parameter should be a handle to an event that will be signaled when the filter is put into a stopped state. Otherwise, this parameter can be <b>NULL</b>. For more information, see Remarks.
     * @returns {HRESULT} Returns S_OK if successful. Otherwise, returns an error code that may be one of the following values, or others not listed.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate necessary memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not find a candidate input pin.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_STATE_CHANGED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Filter state changed during the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-igraphconfig-pushthroughdata
     */
    PushThroughData(pOutputPin, pConnection, hEventAbort) {
        hEventAbort := hEventAbort is Win32Handle ? NumGet(hEventAbort, "ptr") : hEventAbort

        result := ComCall(9, this, "ptr", pOutputPin, "ptr", pConnection, "ptr", hEventAbort, "HRESULT")
        return result
    }

    /**
     * The SetFilterFlags method sets a filter's configuration information.
     * @param {IBaseFilter} pFilter Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of a filter in the filter graph.
     * @param {Integer} dwFlags 
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_IN_GRAPH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter is not in the graph.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-igraphconfig-setfilterflags
     */
    SetFilterFlags(pFilter, dwFlags) {
        result := ComCall(10, this, "ptr", pFilter, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The GetFilterFlags method retrieves a filter's configuration information.
     * @param {IBaseFilter} pFilter Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of a filter in the filter graph.
     * @returns {Integer} Receives the current configuration flags.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-igraphconfig-getfilterflags
     */
    GetFilterFlags(pFilter) {
        result := ComCall(11, this, "ptr", pFilter, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * The RemoveFilterEx method removes a filter from the filter graph.
     * @param {IBaseFilter} pFilter Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of the filter to remove from the graph.
     * @param {Integer} Flags Combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-_rem_filter_flags">REM_FILTER_FLAGS</a> enumerated type.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the failure.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-igraphconfig-removefilterex
     */
    RemoveFilterEx(pFilter, Flags) {
        result := ComCall(12, this, "ptr", pFilter, "uint", Flags, "HRESULT")
        return result
    }
}
