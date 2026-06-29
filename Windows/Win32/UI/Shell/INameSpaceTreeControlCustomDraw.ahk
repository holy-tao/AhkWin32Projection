#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\NSTCCUSTOMDRAW.ahk" { NSTCCUSTOMDRAW }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that enable the user to draw a custom namespace tree control and its items.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-inamespacetreecontrolcustomdraw
 * @namespace Windows.Win32.UI.Shell
 */
export default struct INameSpaceTreeControlCustomDraw extends IUnknown {
    /**
     * The interface identifier for INameSpaceTreeControlCustomDraw
     * @type {Guid}
     */
    static IID := Guid("{2d3ba758-33ee-42d5-bb7b-5f3431d86c78}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INameSpaceTreeControlCustomDraw interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PrePaint      : IntPtr
        PostPaint     : IntPtr
        ItemPrePaint  : IntPtr
        ItemPostPaint : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INameSpaceTreeControlCustomDraw.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called before the namespace tree control is drawn.
     * @param {HDC} _hdc Type: <b>HDC</b>
     * 
     * A handle to the control's device context. Use this HDC to perform any GDI functions.
     * @param {Pointer<RECT>} prc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that describes the bounding rectangle of the area being drawn.
     * @returns {LRESULT} Type: <b>LRESULT*</b>
     * 
     * When this method returns, contains a pointer to an <b>LRESULT</b>, which contains one or more of the values from the <a href="https://docs.microsoft.com/windows/desktop/Controls/cdrf-constants">CDRF Constants</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolcustomdraw-prepaint
     */
    PrePaint(_hdc, prc) {
        result := ComCall(3, this, HDC, _hdc, RECT.Ptr, prc, LRESULT.Ptr, &plres := 0, "HRESULT")
        return plres
    }

    /**
     * Called after the namespace tree control is drawn.
     * @param {HDC} _hdc Type: <b>HDC</b>
     * 
     * A handle to the control's device context. Use this HDC to perform any GDI functions.
     * @param {Pointer<RECT>} prc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that describes the bounding rectangle of the area being drawn.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolcustomdraw-postpaint
     */
    PostPaint(_hdc, prc) {
        result := ComCall(4, this, HDC, _hdc, RECT.Ptr, prc, "HRESULT")
        return result
    }

    /**
     * Called before an item in the namespace tree control is drawn.
     * @param {HDC} _hdc Type: <b>HDC</b>
     * 
     * A handle to the control's device context. Use this HDC to perform any GDI functions.
     * @param {Pointer<RECT>} prc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that describes the bounding rectangle of the area being drawn.
     * @param {Pointer<NSTCCUSTOMDRAW>} pnstccdItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-nstccustomdraw">NSTCCUSTOMDRAW</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-nstccustomdraw">NSTCCUSTOMDRAW</a> structure that determines the details of the drawing.
     * @param {Pointer<COLORREF>} pclrText Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>*</b>
     * 
     * On entry, a pointer to a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> structure that declares the default color of the text. When this method returns, contains a pointer to a <b>COLORREF</b> structure that declares the color that should be used in its place, if any. This allows the client to provide their own color if they do not want to use the default.
     * @param {Pointer<COLORREF>} pclrTextBk Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>*</b>
     * 
     * On entry, a pointer to a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> structure that declares the default color of the background. When this method returns, contains a pointer to a <b>COLORREF</b> structure that declares the color that should be used in its place, if any. This allows the client to provide their own color if they do not want to use the default.
     * @returns {LRESULT} Type: <b>LRESULT*</b>
     * 
     * When this method returns, contains a pointer to an <b>LRESULT</b>, which points to one or more of the values from the <a href="https://docs.microsoft.com/windows/desktop/Controls/cdrf-constants">CDRF Constants</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolcustomdraw-itemprepaint
     */
    ItemPrePaint(_hdc, prc, pnstccdItem, pclrText, pclrTextBk) {
        pclrTextMarshal := pclrText is VarRef ? "uint*" : "ptr"
        pclrTextBkMarshal := pclrTextBk is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, HDC, _hdc, RECT.Ptr, prc, NSTCCUSTOMDRAW.Ptr, pnstccdItem, pclrTextMarshal, pclrText, pclrTextBkMarshal, pclrTextBk, LRESULT.Ptr, &plres := 0, "HRESULT")
        return plres
    }

    /**
     * Called after an item in the namespace tree control is drawn.
     * @param {HDC} _hdc Type: <b>HDC</b>
     * 
     * A handle to the control's device context. Use this HDC to perform any GDI functions.
     * @param {Pointer<RECT>} prc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that describes the bounding rectangle of the area being drawn.
     * @param {Pointer<NSTCCUSTOMDRAW>} pnstccdItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-nstccustomdraw">NSTCCUSTOMDRAW</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-nstccustomdraw">NSTCCUSTOMDRAW</a> struct that determines the details of the drawing.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolcustomdraw-itempostpaint
     */
    ItemPostPaint(_hdc, prc, pnstccdItem) {
        result := ComCall(6, this, HDC, _hdc, RECT.Ptr, prc, NSTCCUSTOMDRAW.Ptr, pnstccdItem, "HRESULT")
        return result
    }

    Query(iid) {
        if (INameSpaceTreeControlCustomDraw.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PrePaint := CallbackCreate(GetMethod(implObj, "PrePaint"), flags, 4)
        this.vtbl.PostPaint := CallbackCreate(GetMethod(implObj, "PostPaint"), flags, 3)
        this.vtbl.ItemPrePaint := CallbackCreate(GetMethod(implObj, "ItemPrePaint"), flags, 7)
        this.vtbl.ItemPostPaint := CallbackCreate(GetMethod(implObj, "ItemPostPaint"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PrePaint)
        CallbackFree(this.vtbl.PostPaint)
        CallbackFree(this.vtbl.ItemPrePaint)
        CallbackFree(this.vtbl.ItemPostPaint)
    }
}
