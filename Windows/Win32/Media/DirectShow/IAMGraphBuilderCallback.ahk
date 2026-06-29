#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IBaseFilter.ahk" { IBaseFilter }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IMoniker.ahk" { IMoniker }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMGraphBuilderCallback interface provides a callback mechanism during graph building.To use this interface, implement the interface in your application or client object.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamgraphbuildercallback
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMGraphBuilderCallback extends IUnknown {
    /**
     * The interface identifier for IAMGraphBuilderCallback
     * @type {Guid}
     */
    static IID := Guid("{4995f511-9ddb-4f12-bd3b-f04611807b79}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMGraphBuilderCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SelectedFilter : IntPtr
        CreatedFilter  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMGraphBuilderCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Filter Graph Manager calls this method when it finds a candidate filter for the graph, but before it creates the filter.
     * @remarks
     * This method enables the client to examine a filter to determine whether it is acceptable for the current filter graph.
     * 
     * The Filter Graph Manager holds a graph-wide critical section while it calls this method. Therefore, the callback method should avoid calling any methods on the Filter Graph Manager, or any methods on filters that might change the graph state (such as disconnecting pins). Doing so might cause a deadlock or other unexpected behaviors.
     * @param {IMoniker} pMon Pointer to a moniker that contains information about the filter.
     * @returns {HRESULT} If the method returns a success code, the Filter Graph Manager creates the filter and tries to connect it. If the method returns a failure code, the Filter Graph Manager rejects the filter.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamgraphbuildercallback-selectedfilter
     */
    SelectedFilter(pMon) {
        result := ComCall(3, this, "ptr", pMon, "HRESULT")
        return result
    }

    /**
     * The Filter Graph Manager calls this method after it has created a filter, but before it attempts to connect the filter.
     * @remarks
     * This method enables the client to configure the filter immediately after it has been created. The Video Mixing Renderer is the primary example of a filter that requires configuration before it is connected. Most other DirectShow filters can be configured after they are connected.
     * 
     * The Filter Graph Manager holds a graph-wide critical section while it calls this method. Therefore, the callback method should avoid calling any methods on the Filter Graph Manager, or any methods on filters that might change the graph state (such as disconnecting pins). Doing so might cause a deadlock or other unexpected behaviors.
     * @param {IBaseFilter} pFil Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of the filter.
     * @returns {HRESULT} If the method returns a success code, the Filter Graph Manager tries to connect the filter. If the method returns a failure code, the Filter Graph Manager rejects the filter.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamgraphbuildercallback-createdfilter
     */
    CreatedFilter(pFil) {
        result := ComCall(4, this, "ptr", pFil, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMGraphBuilderCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SelectedFilter := CallbackCreate(GetMethod(implObj, "SelectedFilter"), flags, 2)
        this.vtbl.CreatedFilter := CallbackCreate(GetMethod(implObj, "CreatedFilter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SelectedFilter)
        CallbackFree(this.vtbl.CreatedFilter)
    }
}
