#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPinConnection.ahk" { IPinConnection }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\IGraphConfigCallback.ahk" { IGraphConfigCallback }
#Import "..\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import ".\IEnumFilters.ahk" { IEnumFilters }
#Import ".\IBaseFilter.ahk" { IBaseFilter }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPin.ahk" { IPin }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The Filter Graph Manager exposes IGraphConfig to support dynamic graph building.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-igraphconfig
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IGraphConfig extends IUnknown {
    /**
     * The interface identifier for IGraphConfig
     * @type {Guid}
     */
    static IID := Guid("{03a1eb8e-32bf-4245-8502-114d08a9cb88}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGraphConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Reconnect             : IntPtr
        Reconfigure           : IntPtr
        AddFilterToCache      : IntPtr
        EnumCacheFilter       : IntPtr
        RemoveFilterFromCache : IntPtr
        GetStartTime          : IntPtr
        PushThroughData       : IntPtr
        SetFilterFlags        : IntPtr
        GetFilterFlags        : IntPtr
        RemoveFilterEx        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGraphConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Reconnect method performs a dynamic reconnection between two pins.
     * @remarks
     * If you specify only one pin, the method will search for the other pin. By default, however, the search fails if it reaches a filter that was added to the graph by means of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifiltergraph-addfilter">IFilterGraph::AddFilter</a> method. To override this behavior, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphconfig-setfilterflags">IGraphConfig::SetFilterFlags</a> and set the AM_FILTER_FLAGS_REMOVABLE flag on the filter.
     * 
     * The reconnection process involves several steps, most of them handled inside this method:
     * 
     * <ol>
     * <li>First, before calling the method, make sure to block the flow of data along the path that is being reconfigured. Applications should call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipinflowcontrol-block">IPinFlowControl::Block</a> method to do this. If the caller is a filter, rather than an application, possibly the filter can control the data flow internally.</li>
     * <li>The specified output and input pins define the starting and ending points for the reconnection. The input pin must support the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipinconnection">IPinConnection</a> interface. If you leave one of these pins unspecified (by passing a <b>NULL</b> parameter), the method searches the filter graph to find a candidate pin for reconnection. (To find an input pin, it searches downstream from the output pin; to find an output pin, it searches upstream from the input pin.)</li>
     * <li>The method pushes any pending data through the filter graph (through an internal call to <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphconfig-pushthroughdata">IGraphConfig::PushThroughData</a>).</li>
     * <li>If you have specified a filter to insert into the graph, the method connects the starting output pin to the filter's input pin, and connects the filter's output pin to the final input pin. If you do not specify a filter, the method simply connects the output pin to the input pin. In either case, the method inserts any transform filters required to complete the connections. (However, you can override this behavior by setting the appropriate flag; for more information see the description of the <i>dwFlags</i> parameter.)</li>
     * <li>Finally, the method places the new filters into a running state. It is up to the caller to restart the data flow. Applications can do this by calling <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipinflowcontrol-block">IPinFlowControl::Block</a> with no flags.</li>
     * </ol>
     * If a filter calls this method on one of its own data processing threads, it creates the potential for a deadlock. The method obtains a lock on the filter graph, which can block the filter from stopping on receiving a call to <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediafilter-stop">IMediaFilter::Stop</a>. To prevent this situation, the method takes a handle to an event object provided by filter. The filter should signal the event if it receives a call to its <b>Stop</b> method.
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
     * Input pin does not support <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipinconnection">IPinConnection</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfig-reconnect
     */
    Reconnect(pOutputPin, pInputPin, pmtFirstConnection, pUsingFilter, hAbortEvent, dwFlags) {
        result := ComCall(3, this, "ptr", pOutputPin, "ptr", pInputPin, AM_MEDIA_TYPE.Ptr, pmtFirstConnection, "ptr", pUsingFilter, HANDLE, hAbortEvent, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The Reconfigure method locks the filter graph and calls a callback function in the application or filter to perform a dynamic reconfiguration.
     * @remarks
     * This method is provided so that an application or filter can implement specialized dynamic graph building. In most cases, however, the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphconfig-reconnect">IGraphConfig::Reconnect</a> method is adequate, and should be preferred because it handles most of the implementation details.
     * 
     * Before calling this method, block any streams as needed and push the data through the graph (see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipinflowcontrol-block">IPinFlowControl::Block</a> and <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphconfig-pushthroughdata">IGraphConfig::PushThroughData</a>). If the callback method succeeds, <c>IGraphConfig::Reconfigure</c> attempts to put all the filters into a running state. (The caller must then unblock the data flow.) Otherwise, it returns whatever error code the callback method returned.
     * 
     * If a filter calls this method on one of its own data processing threads, it creates the potential for a deadlock. The method obtains a lock on the filter graph, which can block the filter from stopping on receiving a call to <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediafilter-stop">IMediaFilter::Stop</a>. To prevent this situation, the method takes a handle to an event object provided by filter. The filter should signal the event if it receives a call to its <b>Stop</b> method.
     * @param {IGraphConfigCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphconfigcallback">IGraphConfigCallback</a> callback interface on the application or filter.
     * @param {Pointer<Void>} pvContext Pointer to a variable of type <b>PVOID</b> that is passed to the callback routine.
     * @param {Integer} dwFlags Application-defined flags that are passed to the callback routine.
     * @param {HANDLE} hAbortEvent Handle to an event. If the caller is a filter calling on one of its data processing threads, this parameter should be a handle to an event that will be signaled when the filter is put into a stopped state. Otherwise, this parameter can be <b>NULL</b>. For more information, see Remarks.
     * @returns {HRESULT} Returns S_OK if successful, or an error code otherwise. Possible errors include VFW_E_WRONG_STATE, if the method could not obtain a lock on the filter graph; whatever <b>HRESULT</b> was returned by the callback routine; or an error code indicating that the graph could not put the filters into a running state.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfig-reconfigure
     */
    Reconfigure(pCallback, pvContext, dwFlags, hAbortEvent) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", pCallback, pvContextMarshal, pvContext, "uint", dwFlags, HANDLE, hAbortEvent, "HRESULT")
        return result
    }

    /**
     * The AddFilterToCache method adds a filter to the filter cache.
     * @remarks
     * You must disconnect all of the filter's pins before calling this method, or the method will fail. If the filter is in the filter graph, this method will remove it. This method will also put the filter into a stopped state, if it is not already.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfig-addfiltertocache
     */
    AddFilterToCache(pFilter) {
        result := ComCall(5, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * The EnumCacheFilter method enumerates the filters in the filter cache.
     * @returns {IEnumFilters} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ienumfilters">IEnumFilters</a> interface on the filter enumerator. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfig-enumcachefilter
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfig-removefilterfromcache
     */
    RemoveFilterFromCache(pFilter) {
        result := ComCall(7, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * The GetStartTime method retrieves the reference time that was used when the filter graph was last put into a running state.
     * @remarks
     * The filter graph must currently be in a running state or this method will fail.
     * @returns {Integer} Receives the start time.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfig-getstarttime
     */
    GetStartTime() {
        result := ComCall(8, this, "int64*", &prtStart := 0, "HRESULT")
        return prtStart
    }

    /**
     * The PushThroughData method pushes data through the filter graph to the specified pin.
     * @remarks
     * This method pushes through any pending data, from a specified output pin down to a specified input pin. Optionally, you can leave the input pin unspecified and let the method search the filter graph for the best candidate. Do not call this method from the thread that is pushing data.
     * 
     * If a filter calls this method on one of its own data processing threads, it creates the potential for a deadlock. The method obtains a lock on the filter graph, which can block the filter from stopping on receiving a call to <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediafilter-stop">IMediaFilter::Stop</a>. To prevent this situation, the method takes a handle to an event object provided by the filter. The filter should signal the event if it receives a call to its <b>Stop</b> method.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfig-pushthroughdata
     */
    PushThroughData(pOutputPin, pConnection, hEventAbort) {
        result := ComCall(9, this, "ptr", pOutputPin, "ptr", pConnection, HANDLE, hEventAbort, "HRESULT")
        return result
    }

    /**
     * The SetFilterFlags method sets a filter's configuration information.
     * @remarks
     * The AM_FILTER_FLAGS_REMOVABLE flag changes the behavior of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphconfig-reconnect">IGraphConfig::Reconnect</a> method. The <b>Reconnect</b> method performs a dynamic reconnection between two pins. If the caller specifies one pin, but leaves the other pin unspecified, <b>Reconnect</b> searches upstream or downstream from the specified pin to find a suitable match. By default, however, the search fails if it reaches a filter that was added to the graph by means of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifiltergraph-addfilter">IFilterGraph::AddFilter</a> method. To override this behavior, call <c>SetFilterFlags</c> and set the AM_FILTER_FLAGS_REMOVABLE flag on the filter.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfig-setfilterflags
     */
    SetFilterFlags(pFilter, dwFlags) {
        result := ComCall(10, this, "ptr", pFilter, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The GetFilterFlags method retrieves a filter's configuration information.
     * @param {IBaseFilter} pFilter Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of a filter in the filter graph.
     * @returns {Integer} Receives the current configuration flags.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfig-getfilterflags
     */
    GetFilterFlags(pFilter) {
        result := ComCall(11, this, "ptr", pFilter, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * The RemoveFilterEx method removes a filter from the filter graph.
     * @remarks
     * This method extends the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifiltergraph-removefilter">IFilterGraph::RemoveFilter</a> method by accepting a flag that specifies the behavior of the method. This flag enables an application to remove a filter without disconnecting the pins automatically, which improves performance when moving groups of connected filters into a new graph.
     * 
     * By default, this method disconnects the filter before removing it from the graph. Use the REMFILTERF_LEAVECONNECTED flag to leave the filter connected.
     * @param {IBaseFilter} pFilter Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of the filter to remove from the graph.
     * @param {Integer} Flags Combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-_rem_filter_flags">REM_FILTER_FLAGS</a> enumerated type.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the failure.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfig-removefilterex
     */
    RemoveFilterEx(pFilter, Flags) {
        result := ComCall(12, this, "ptr", pFilter, "uint", Flags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGraphConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Reconnect := CallbackCreate(GetMethod(implObj, "Reconnect"), flags, 7)
        this.vtbl.Reconfigure := CallbackCreate(GetMethod(implObj, "Reconfigure"), flags, 5)
        this.vtbl.AddFilterToCache := CallbackCreate(GetMethod(implObj, "AddFilterToCache"), flags, 2)
        this.vtbl.EnumCacheFilter := CallbackCreate(GetMethod(implObj, "EnumCacheFilter"), flags, 2)
        this.vtbl.RemoveFilterFromCache := CallbackCreate(GetMethod(implObj, "RemoveFilterFromCache"), flags, 2)
        this.vtbl.GetStartTime := CallbackCreate(GetMethod(implObj, "GetStartTime"), flags, 2)
        this.vtbl.PushThroughData := CallbackCreate(GetMethod(implObj, "PushThroughData"), flags, 4)
        this.vtbl.SetFilterFlags := CallbackCreate(GetMethod(implObj, "SetFilterFlags"), flags, 3)
        this.vtbl.GetFilterFlags := CallbackCreate(GetMethod(implObj, "GetFilterFlags"), flags, 3)
        this.vtbl.RemoveFilterEx := CallbackCreate(GetMethod(implObj, "RemoveFilterEx"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Reconnect)
        CallbackFree(this.vtbl.Reconfigure)
        CallbackFree(this.vtbl.AddFilterToCache)
        CallbackFree(this.vtbl.EnumCacheFilter)
        CallbackFree(this.vtbl.RemoveFilterFromCache)
        CallbackFree(this.vtbl.GetStartTime)
        CallbackFree(this.vtbl.PushThroughData)
        CallbackFree(this.vtbl.SetFilterFlags)
        CallbackFree(this.vtbl.GetFilterFlags)
        CallbackFree(this.vtbl.RemoveFilterEx)
    }
}
