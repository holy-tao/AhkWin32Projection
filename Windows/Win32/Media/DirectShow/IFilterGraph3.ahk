#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\IReferenceClock.ahk" { IReferenceClock }
#Import ".\IBaseFilter.ahk" { IBaseFilter }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFilterGraph2.ahk" { IFilterGraph2 }

/**
 * The IFilterGraph3 interface extends the IFilterGraph2 interface, which contains methods for building filter graphs.The Filter Graph Manager implements this interface.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ifiltergraph3
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IFilterGraph3 extends IFilterGraph2 {
    /**
     * The interface identifier for IFilterGraph3
     * @type {Guid}
     */
    static IID := Guid("{aaf38154-b80b-422f-91e6-b66467509a07}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFilterGraph3 interfaces
    */
    struct Vtbl extends IFilterGraph2.Vtbl {
        SetSyncSourceEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFilterGraph3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetSyncSourceEx method establishes two reference clocks for the filter graph:\_a primary clock that is used by most of the filters, and a secondary clock that is used only by one specified filter.
     * @remarks
     * If the filter graph is running or paused, this method return VFW_E_NOT_STOPPED.
     * 
     * To clear both reference clocks, set all three parameters to <b>NULL</b>. To set a single clock for the entire graph, with no secondary clock, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediafilter-setsyncsource">IMediaFilter::SetSyncSource</a> method on the Filter Graph Manager.
     * @param {IReferenceClock} pClockForMostOfFilterGraph Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ireferenceclock">IReferenceClock</a> interface of the main reference clock. Every filter in the graph uses this clock, except for the filter specified by the <i>pFilter</i> parameter.
     * @param {IReferenceClock} pClockForFilter Pointer to the <b>IReferenceClock</b> interface of the secondary clock. The filter specified by the <i>pFilter</i> parameter uses this clock.
     * @param {IBaseFilter} pFilter Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of a filter in the graph. This filter uses the secondary reference clock.
     * @returns {HRESULT} Returns and <b>HRESULT</b> value. Possible values include the following.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltergraph3-setsyncsourceex
     */
    SetSyncSourceEx(pClockForMostOfFilterGraph, pClockForFilter, pFilter) {
        result := ComCall(21, this, "ptr", pClockForMostOfFilterGraph, "ptr", pClockForFilter, "ptr", pFilter, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFilterGraph3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSyncSourceEx := CallbackCreate(GetMethod(implObj, "SetSyncSourceEx"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSyncSourceEx)
    }
}
