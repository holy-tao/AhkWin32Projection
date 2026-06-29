#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IElementBehaviorSiteLayout extends IUnknown {
    /**
     * The interface identifier for IElementBehaviorSiteLayout
     * @type {Guid}
     */
    static IID := Guid("{3050f6b7-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IElementBehaviorSiteLayout interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InvalidateLayoutInfo : IntPtr
        InvalidateSize       : IntPtr
        GetMediaResolution   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IElementBehaviorSiteLayout.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InvalidateLayoutInfo() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InvalidateSize() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SIZE} 
     */
    GetMediaResolution() {
        psizeResolution := SIZE()
        result := ComCall(5, this, SIZE.Ptr, psizeResolution, "HRESULT")
        return psizeResolution
    }

    Query(iid) {
        if (IElementBehaviorSiteLayout.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InvalidateLayoutInfo := CallbackCreate(GetMethod(implObj, "InvalidateLayoutInfo"), flags, 1)
        this.vtbl.InvalidateSize := CallbackCreate(GetMethod(implObj, "InvalidateSize"), flags, 1)
        this.vtbl.GetMediaResolution := CallbackCreate(GetMethod(implObj, "GetMediaResolution"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InvalidateLayoutInfo)
        CallbackFree(this.vtbl.InvalidateSize)
        CallbackFree(this.vtbl.GetMediaResolution)
    }
}
