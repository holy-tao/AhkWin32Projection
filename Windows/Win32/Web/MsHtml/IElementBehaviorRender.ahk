#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IElementBehaviorRender extends IUnknown {
    /**
     * The interface identifier for IElementBehaviorRender
     * @type {Guid}
     */
    static IID := Guid("{3050f4aa-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IElementBehaviorRender interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Draw          : IntPtr
        GetRenderInfo : IntPtr
        HitTestPoint  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IElementBehaviorRender.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HDC} _hdc 
     * @param {Integer} lLayer 
     * @param {Pointer<RECT>} pRect 
     * @param {IUnknown} pReserved 
     * @returns {HRESULT} 
     */
    Draw(_hdc, lLayer, pRect, pReserved) {
        result := ComCall(3, this, HDC, _hdc, "int", lLayer, RECT.Ptr, pRect, "ptr", pReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetRenderInfo() {
        result := ComCall(4, this, "int*", &plRenderInfo := 0, "HRESULT")
        return plRenderInfo
    }

    /**
     * 
     * @param {Pointer<POINT>} pPoint 
     * @param {IUnknown} pReserved 
     * @returns {BOOL} 
     */
    HitTestPoint(pPoint, pReserved) {
        result := ComCall(5, this, POINT.Ptr, pPoint, "ptr", pReserved, BOOL.Ptr, &pbHit := 0, "HRESULT")
        return pbHit
    }

    Query(iid) {
        if (IElementBehaviorRender.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Draw := CallbackCreate(GetMethod(implObj, "Draw"), flags, 5)
        this.vtbl.GetRenderInfo := CallbackCreate(GetMethod(implObj, "GetRenderInfo"), flags, 2)
        this.vtbl.HitTestPoint := CallbackCreate(GetMethod(implObj, "HitTestPoint"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Draw)
        CallbackFree(this.vtbl.GetRenderInfo)
        CallbackFree(this.vtbl.HitTestPoint)
    }
}
