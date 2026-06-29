#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Gdi\LOGFONTW.ahk" { LOGFONTW }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods for applying color and font information to preview handlers.
 * @remarks
 * <div class="alert"><b>Note</b>  These are suggestions. It is not compulsory for this interface to be called. The preview handlers must be able to make their own decisions.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ipreviewhandlervisuals
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IPreviewHandlerVisuals extends IUnknown {
    /**
     * The interface identifier for IPreviewHandlerVisuals
     * @type {Guid}
     */
    static IID := Guid("{196bf9a5-b346-4ef0-aa1e-5dcdb76768b1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPreviewHandlerVisuals interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetBackgroundColor : IntPtr
        SetFont            : IntPtr
        SetTextColor       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPreviewHandlerVisuals.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the background color of the preview handler.
     * @remarks
     * <div class="alert"><b>Note</b>  These are suggestions. It is not compulsory for this method to be called. The preview handlers must be able to make their own decisions.</div>
     * <div> </div>
     * @param {COLORREF} _color Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * A value of type <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> to use for the preview handler background.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandlervisuals-setbackgroundcolor
     */
    SetBackgroundColor(_color) {
        result := ComCall(3, this, COLORREF, _color, "HRESULT")
        return result
    }

    /**
     * Sets the font attributes to be used for text within the preview handler.
     * @remarks
     * <div class="alert"><b>Note</b>  These are suggestions. It is not compulsory for this method to be called. The preview handlers must be able to make their own decisions.</div>
     * <div> </div>
     * @param {Pointer<LOGFONTW>} plf Type: <b>const LOGFONTW*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa741231(v=vs.85)">LOGFONTW Structure</a> containing the necessary attributes for the font to use.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandlervisuals-setfont
     */
    SetFont(plf) {
        result := ComCall(4, this, LOGFONTW.Ptr, plf, "HRESULT")
        return result
    }

    /**
     * Sets the color of the text within the preview handler.
     * @remarks
     * <div class="alert"><b>Note</b>  These are suggestions. It is not compulsory for this method to be called; the preview handlers must be able to make their own decisions.</div>
     * <div> </div>
     * @param {COLORREF} _color Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * A value of type <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> to use for the preview handler text color.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandlervisuals-settextcolor
     */
    SetTextColor(_color) {
        result := ComCall(5, this, COLORREF, _color, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPreviewHandlerVisuals.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetBackgroundColor := CallbackCreate(GetMethod(implObj, "SetBackgroundColor"), flags, 2)
        this.vtbl.SetFont := CallbackCreate(GetMethod(implObj, "SetFont"), flags, 2)
        this.vtbl.SetTextColor := CallbackCreate(GetMethod(implObj, "SetTextColor"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetBackgroundColor)
        CallbackFree(this.vtbl.SetFont)
        CallbackFree(this.vtbl.SetTextColor)
    }
}
