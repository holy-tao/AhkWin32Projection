#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\HTML_PAINT_DRAW_INFO.ahk" { HTML_PAINT_DRAW_INFO }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Graphics\Gdi\HRGN.ahk" { HRGN }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLPaintSite extends IUnknown {
    /**
     * The interface identifier for IHTMLPaintSite
     * @type {Guid}
     */
    static IID := Guid("{3050f6a7-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLPaintSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InvalidatePainterInfo  : IntPtr
        InvalidateRect         : IntPtr
        InvalidateRegion       : IntPtr
        GetDrawInfo            : IntPtr
        TransformGlobalToLocal : IntPtr
        TransformLocalToGlobal : IntPtr
        GetHitTestCookie       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLPaintSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InvalidatePainterInfo() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The InvalidateRect function adds a rectangle to the specified window's update region. The update region represents the portion of the window's client area that must be redrawn.
     * @remarks
     * The invalidated areas accumulate in the update region until the region is processed when the next <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-paint">WM_PAINT</a> message occurs or until the region is validated by using the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-validaterect">ValidateRect</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-validatergn">ValidateRgn</a> function.
     * 
     * The system sends a <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-paint">WM_PAINT</a> message to a window whenever its update region is not empty and there are no other messages in the application queue for that window.
     * 
     * If the <i>bErase</i> parameter is <b>TRUE</b> for any part of the update region, the background is erased in the entire region, not just in the specified part.
     * @param {Pointer<RECT>} prcInvalid 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-invalidaterect
     */
    InvalidateRect(prcInvalid) {
        result := ComCall(4, this, RECT.Ptr, prcInvalid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRGN} rgnInvalid 
     * @returns {HRESULT} 
     */
    InvalidateRegion(rgnInvalid) {
        result := ComCall(5, this, HRGN, rgnInvalid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HTML_PAINT_DRAW_INFO} 
     */
    GetDrawInfo(lFlags) {
        pDrawInfo := HTML_PAINT_DRAW_INFO()
        result := ComCall(6, this, "int", lFlags, HTML_PAINT_DRAW_INFO.Ptr, pDrawInfo, "HRESULT")
        return pDrawInfo
    }

    /**
     * 
     * @param {POINT} ptGlobal 
     * @returns {POINT} 
     */
    TransformGlobalToLocal(ptGlobal) {
        pptLocal := POINT()
        result := ComCall(7, this, POINT, ptGlobal, POINT.Ptr, pptLocal, "HRESULT")
        return pptLocal
    }

    /**
     * 
     * @param {POINT} ptLocal 
     * @returns {POINT} 
     */
    TransformLocalToGlobal(ptLocal) {
        pptGlobal := POINT()
        result := ComCall(8, this, POINT, ptLocal, POINT.Ptr, pptGlobal, "HRESULT")
        return pptGlobal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetHitTestCookie() {
        result := ComCall(9, this, "int*", &plCookie := 0, "HRESULT")
        return plCookie
    }

    Query(iid) {
        if (IHTMLPaintSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InvalidatePainterInfo := CallbackCreate(GetMethod(implObj, "InvalidatePainterInfo"), flags, 1)
        this.vtbl.InvalidateRect := CallbackCreate(GetMethod(implObj, "InvalidateRect"), flags, 2)
        this.vtbl.InvalidateRegion := CallbackCreate(GetMethod(implObj, "InvalidateRegion"), flags, 2)
        this.vtbl.GetDrawInfo := CallbackCreate(GetMethod(implObj, "GetDrawInfo"), flags, 3)
        this.vtbl.TransformGlobalToLocal := CallbackCreate(GetMethod(implObj, "TransformGlobalToLocal"), flags, 3)
        this.vtbl.TransformLocalToGlobal := CallbackCreate(GetMethod(implObj, "TransformLocalToGlobal"), flags, 3)
        this.vtbl.GetHitTestCookie := CallbackCreate(GetMethod(implObj, "GetHitTestCookie"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InvalidatePainterInfo)
        CallbackFree(this.vtbl.InvalidateRect)
        CallbackFree(this.vtbl.InvalidateRegion)
        CallbackFree(this.vtbl.GetDrawInfo)
        CallbackFree(this.vtbl.TransformGlobalToLocal)
        CallbackFree(this.vtbl.TransformLocalToGlobal)
        CallbackFree(this.vtbl.GetHitTestCookie)
    }
}
