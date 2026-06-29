#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IElementBehaviorLayout extends IUnknown {
    /**
     * The interface identifier for IElementBehaviorLayout
     * @type {Guid}
     */
    static IID := Guid("{3050f6ba-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IElementBehaviorLayout interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSize       : IntPtr
        GetLayoutInfo : IntPtr
        GetPosition   : IntPtr
        MapSize       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IElementBehaviorLayout.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {SIZE} sizeContent 
     * @param {Pointer<POINT>} pptTranslateBy 
     * @param {Pointer<POINT>} pptTopLeft 
     * @param {Pointer<SIZE>} psizeProposed 
     * @returns {HRESULT} 
     */
    GetSize(dwFlags, sizeContent, pptTranslateBy, pptTopLeft, psizeProposed) {
        result := ComCall(3, this, "int", dwFlags, SIZE, sizeContent, POINT.Ptr, pptTranslateBy, POINT.Ptr, pptTopLeft, SIZE.Ptr, psizeProposed, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLayoutInfo() {
        result := ComCall(4, this, "int*", &plLayoutInfo := 0, "HRESULT")
        return plLayoutInfo
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<POINT>} pptTopLeft 
     * @returns {HRESULT} 
     */
    GetPosition(lFlags, pptTopLeft) {
        result := ComCall(5, this, "int", lFlags, POINT.Ptr, pptTopLeft, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} psizeIn 
     * @returns {RECT} 
     */
    MapSize(psizeIn) {
        prcOut := RECT()
        result := ComCall(6, this, SIZE.Ptr, psizeIn, RECT.Ptr, prcOut, "HRESULT")
        return prcOut
    }

    Query(iid) {
        if (IElementBehaviorLayout.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSize := CallbackCreate(GetMethod(implObj, "GetSize"), flags, 6)
        this.vtbl.GetLayoutInfo := CallbackCreate(GetMethod(implObj, "GetLayoutInfo"), flags, 2)
        this.vtbl.GetPosition := CallbackCreate(GetMethod(implObj, "GetPosition"), flags, 3)
        this.vtbl.MapSize := CallbackCreate(GetMethod(implObj, "MapSize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSize)
        CallbackFree(this.vtbl.GetLayoutInfo)
        CallbackFree(this.vtbl.GetPosition)
        CallbackFree(this.vtbl.MapSize)
    }
}
