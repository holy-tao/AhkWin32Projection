#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IBaseFilter.ahk" { IBaseFilter }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IFilterChain interface provides methods for starting, stopping, or removing chains of filters in a filter graph.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ifilterchain
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IFilterChain extends IUnknown {
    /**
     * The interface identifier for IFilterChain
     * @type {Guid}
     */
    static IID := Guid("{dcfbdcf6-0dc2-45f5-9ab2-7c330ea09c29}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFilterChain interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StartChain  : IntPtr
        PauseChain  : IntPtr
        StopChain   : IntPtr
        RemoveChain : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFilterChain.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The StartChain method switches all the filters in a filter chain into a running state.
     * @remarks
     * If this method cannot switch a given filter into a running state, it leaves all the filters in a stopped state. The filter graph must be running when you call this method.
     * @param {IBaseFilter} pStartFilter A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of the filter at the start of the chain.
     * @param {IBaseFilter} pEndFilter Pointer to the filter at the end of the chain. If this parameter is <b>NULL</b>, the method uses the longest possible filter chain that extends downstream from the start filter.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, the return value may be VFW_E_NOT_RUNNING or another <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifilterchain-startchain
     */
    StartChain(pStartFilter, pEndFilter) {
        result := ComCall(3, this, "ptr", pStartFilter, "ptr", pEndFilter, "HRESULT")
        return result
    }

    /**
     * The PauseChain method switches all the filters in a filter chain into a paused state.
     * @remarks
     * If this method cannot switch a given filter into a paused state, it stops all of the filters in chain. The filter graph must be paused when you call this method.
     * @param {IBaseFilter} pStartFilter A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of the filter at the start of the chain.
     * @param {IBaseFilter} pEndFilter A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of the filter at the end of the chain. If this parameter is <b>NULL</b>, the method uses the longest possible filter chain that extends downstream from the start filter.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, the return value may be VFW_E_NOT_PAUSED or another <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifilterchain-pausechain
     */
    PauseChain(pStartFilter, pEndFilter) {
        result := ComCall(4, this, "ptr", pStartFilter, "ptr", pEndFilter, "HRESULT")
        return result
    }

    /**
     * The StopChain method switches all the filters in a filter chain into a stopped state.
     * @param {IBaseFilter} pStartFilter A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of the filter at the start of the chain.
     * @param {IBaseFilter} pEndFilter Pointer to the filter at the end of the chain. If this parameter is <b>NULL</b>, the method uses the longest possible filter chain that extends downstream from the start filter.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the failure otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifilterchain-stopchain
     */
    StopChain(pStartFilter, pEndFilter) {
        result := ComCall(5, this, "ptr", pStartFilter, "ptr", pEndFilter, "HRESULT")
        return result
    }

    /**
     * The RemoveChain method removes every filter in a filter chain from the filter graph.
     * @remarks
     * You can call this method while the graph is running; the method stops the filters in the chain before removing them from the graph.
     * @param {IBaseFilter} pStartFilter A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of the filter at the start of the chain.
     * @param {IBaseFilter} pEndFilter A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of the filter at the end of the chain. If this parameter is <b>NULL</b>, the method uses the longest possible filter chain that extends downstream from the start filter.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the failure otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifilterchain-removechain
     */
    RemoveChain(pStartFilter, pEndFilter) {
        result := ComCall(6, this, "ptr", pStartFilter, "ptr", pEndFilter, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFilterChain.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartChain := CallbackCreate(GetMethod(implObj, "StartChain"), flags, 3)
        this.vtbl.PauseChain := CallbackCreate(GetMethod(implObj, "PauseChain"), flags, 3)
        this.vtbl.StopChain := CallbackCreate(GetMethod(implObj, "StopChain"), flags, 3)
        this.vtbl.RemoveChain := CallbackCreate(GetMethod(implObj, "RemoveChain"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartChain)
        CallbackFree(this.vtbl.PauseChain)
        CallbackFree(this.vtbl.StopChain)
        CallbackFree(this.vtbl.RemoveChain)
    }
}
