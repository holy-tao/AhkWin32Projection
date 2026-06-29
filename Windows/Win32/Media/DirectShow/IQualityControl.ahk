#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\Quality.ahk" { Quality }
#Import ".\IBaseFilter.ahk" { IBaseFilter }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IQualityControl interface provides support for quality control.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iqualitycontrol
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IQualityControl extends IUnknown {
    /**
     * The interface identifier for IQualityControl
     * @type {Guid}
     */
    static IID := Guid("{56a868a5-0ad4-11ce-b03a-0020af0ba770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IQualityControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Notify  : IntPtr
        SetSink : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IQualityControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Notify method notifies the filter that a quality change is requested.
     * @param {IBaseFilter} pSelf Pointer to the filter that is sending the quality notification.
     * @param {Quality} q [Quality](/windows/desktop/api/strmif/ns-strmif-quality) structure.
     * @returns {HRESULT} Returns S_OK if the method succeeds; otherwise, returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iqualitycontrol-notify
     */
    Notify(pSelf, q) {
        result := ComCall(3, this, "ptr", pSelf, Quality, q, "HRESULT")
        return result
    }

    /**
     * The SetSink method sets the IQualityControl object that will receive quality messages.
     * @remarks
     * The filter that receives a call to this method should record the <i>piqc</i> but should not add a reference count to it. The object pointed to will be a quality manager and will be a part of the filter graph (for example, a plug-in distributor). Adding a reference count to this could cause circular reference problems.
     * 
     * The reference to the object specified in <i>piqc</i> is guaranteed to be valid until this method is called with a null value.
     * @param {IQualityControl} piqc Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iqualitycontrol">IQualityControl</a> object to which the notifications should be sent.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation. <b>HRESULT</b> can be one of the following standard constants, or other values not listed.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method isn't supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK or NOERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iqualitycontrol-setsink
     */
    SetSink(piqc) {
        result := ComCall(4, this, "ptr", piqc, "HRESULT")
        return result
    }

    Query(iid) {
        if (IQualityControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Notify := CallbackCreate(GetMethod(implObj, "Notify"), flags, 3)
        this.vtbl.SetSink := CallbackCreate(GetMethod(implObj, "SetSink"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Notify)
        CallbackFree(this.vtbl.SetSink)
    }
}
