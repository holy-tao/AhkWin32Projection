#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HTML_PAINTER_INFO.ahk" { HTML_PAINTER_INFO }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLPainter extends IUnknown {
    /**
     * The interface identifier for IHTMLPainter
     * @type {Guid}
     */
    static IID := Guid("{3050f6a6-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLPainter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Draw           : IntPtr
        OnResize       : IntPtr
        GetPainterInfo : IntPtr
        HitTestPoint   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLPainter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {RECT} rcBounds 
     * @param {RECT} rcUpdate 
     * @param {Integer} lDrawFlags 
     * @param {HDC} _hdc 
     * @param {Pointer<Void>} pvDrawObject 
     * @returns {HRESULT} 
     */
    Draw(rcBounds, rcUpdate, lDrawFlags, _hdc, pvDrawObject) {
        pvDrawObjectMarshal := pvDrawObject is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, RECT, rcBounds, RECT, rcUpdate, "int", lDrawFlags, HDC, _hdc, pvDrawObjectMarshal, pvDrawObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SIZE} _size 
     * @returns {HRESULT} 
     */
    OnResize(_size) {
        result := ComCall(4, this, SIZE, _size, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HTML_PAINTER_INFO} 
     */
    GetPainterInfo() {
        pInfo := HTML_PAINTER_INFO()
        result := ComCall(5, this, HTML_PAINTER_INFO.Ptr, pInfo, "HRESULT")
        return pInfo
    }

    /**
     * 
     * @param {POINT} pt 
     * @param {Pointer<BOOL>} pbHit 
     * @param {Pointer<Integer>} plPartID 
     * @returns {HRESULT} 
     */
    HitTestPoint(pt, pbHit, plPartID) {
        pbHitMarshal := pbHit is VarRef ? "int*" : "ptr"
        plPartIDMarshal := plPartID is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, POINT, pt, pbHitMarshal, pbHit, plPartIDMarshal, plPartID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLPainter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Draw := CallbackCreate(GetMethod(implObj, "Draw"), flags, 6)
        this.vtbl.OnResize := CallbackCreate(GetMethod(implObj, "OnResize"), flags, 2)
        this.vtbl.GetPainterInfo := CallbackCreate(GetMethod(implObj, "GetPainterInfo"), flags, 2)
        this.vtbl.HitTestPoint := CallbackCreate(GetMethod(implObj, "HitTestPoint"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Draw)
        CallbackFree(this.vtbl.OnResize)
        CallbackFree(this.vtbl.GetPainterInfo)
        CallbackFree(this.vtbl.HitTestPoint)
    }
}
