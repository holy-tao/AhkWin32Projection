#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IEnumUnknown.ahk" { IEnumUnknown }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IElementBehaviorSiteCategory extends IUnknown {
    /**
     * The interface identifier for IElementBehaviorSiteCategory
     * @type {Guid}
     */
    static IID := Guid("{3050f4ee-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IElementBehaviorSiteCategory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRelatedBehaviors : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IElementBehaviorSiteCategory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} lDirection 
     * @param {PWSTR} pchCategory 
     * @returns {IEnumUnknown} 
     */
    GetRelatedBehaviors(lDirection, pchCategory) {
        pchCategory := pchCategory is String ? StrPtr(pchCategory) : pchCategory

        result := ComCall(3, this, "int", lDirection, "ptr", pchCategory, "ptr*", &ppEnumerator := 0, "HRESULT")
        return IEnumUnknown(ppEnumerator)
    }

    Query(iid) {
        if (IElementBehaviorSiteCategory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRelatedBehaviors := CallbackCreate(GetMethod(implObj, "GetRelatedBehaviors"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRelatedBehaviors)
    }
}
