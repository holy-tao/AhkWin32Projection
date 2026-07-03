#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IElementBehaviorSiteRender extends IUnknown {
    /**
     * The interface identifier for IElementBehaviorSiteRender
     * @type {Guid}
     */
    static IID := Guid("{3050f4a7-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IElementBehaviorSiteRender interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Invalidate           : IntPtr
        InvalidateRenderInfo : IntPtr
        InvalidateStyle      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IElementBehaviorSiteRender.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     */
    Invalidate(pRect) {
        result := ComCall(3, this, RECT.Ptr, pRect, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InvalidateRenderInfo() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InvalidateStyle() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IElementBehaviorSiteRender.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Invalidate := CallbackCreate(GetMethod(implObj, "Invalidate"), flags, 2)
        this.vtbl.InvalidateRenderInfo := CallbackCreate(GetMethod(implObj, "InvalidateRenderInfo"), flags, 1)
        this.vtbl.InvalidateStyle := CallbackCreate(GetMethod(implObj, "InvalidateStyle"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Invalidate)
        CallbackFree(this.vtbl.InvalidateRenderInfo)
        CallbackFree(this.vtbl.InvalidateStyle)
    }
}
