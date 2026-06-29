#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMOverlayFX interface controls how the video overlay appears on the user's screen. The Overlay Mixer filter implements this interface.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamoverlayfx
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMOverlayFX extends IUnknown {
    /**
     * The interface identifier for IAMOverlayFX
     * @type {Guid}
     */
    static IID := Guid("{62fae250-7e65-4460-bfc9-6398b322073c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMOverlayFX interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryOverlayFXCaps : IntPtr
        SetOverlayFX       : IntPtr
        GetOverlayFX       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMOverlayFX.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The QueryOverlayFXCaps method retrieves information about which overlay effects are available to the Overlay Mixer filter.
     * @returns {Integer} Pointer to a variable that receives a value indicating the overlay effects capabilities of the overlay surface. The value is a logical combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-amoverlayfx">AMOVERLAYFX</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamoverlayfx-queryoverlayfxcaps
     */
    QueryOverlayFXCaps() {
        result := ComCall(3, this, "uint*", &lpdwOverlayFXCaps := 0, "HRESULT")
        return lpdwOverlayFXCaps
    }

    /**
     * The SetOverlayFX method applies the specified effects to the overlay surface.
     * @remarks
     * The application must call this method while the filter graph is running. The effects are applied immediately.
     * @param {Integer} dwOverlayFX Value specifying which effects to apply. The value must be a logical combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-amoverlayfx">AMOVERLAYFX</a> enumeration, or the method returns E_INVALIDARG.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface. The DirectShow implementation may return one of the following values, or others not listed.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamoverlayfx-setoverlayfx
     */
    SetOverlayFX(dwOverlayFX) {
        result := ComCall(4, this, "uint", dwOverlayFX, "HRESULT")
        return result
    }

    /**
     * The GetOverlayFX method retrieves the effects currently applied to the overlay surface, if any. The application can call this method while the filter graph is running.
     * @returns {Integer} Pointer a variable that receives a value indicating which effects, if any, are currently applied to the overlay surface. The value is a logical combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-amoverlayfx">AMOVERLAYFX</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamoverlayfx-getoverlayfx
     */
    GetOverlayFX() {
        result := ComCall(5, this, "uint*", &lpdwOverlayFX := 0, "HRESULT")
        return lpdwOverlayFX
    }

    Query(iid) {
        if (IAMOverlayFX.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryOverlayFXCaps := CallbackCreate(GetMethod(implObj, "QueryOverlayFXCaps"), flags, 2)
        this.vtbl.SetOverlayFX := CallbackCreate(GetMethod(implObj, "SetOverlayFX"), flags, 2)
        this.vtbl.GetOverlayFX := CallbackCreate(GetMethod(implObj, "GetOverlayFX"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryOverlayFXCaps)
        CallbackFree(this.vtbl.SetOverlayFX)
        CallbackFree(this.vtbl.GetOverlayFX)
    }
}
