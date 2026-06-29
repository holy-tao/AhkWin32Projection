#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ICSSFilterSite extends IUnknown {
    /**
     * The interface identifier for ICSSFilterSite
     * @type {Guid}
     */
    static IID := Guid("{3050f3ed-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICSSFilterSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetElement              : IntPtr
        FireOnFilterChangeEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICSSFilterSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    GetElement() {
        result := ComCall(3, this, "ptr*", &Element := 0, "HRESULT")
        return IHTMLElement(Element)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FireOnFilterChangeEvent() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICSSFilterSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetElement := CallbackCreate(GetMethod(implObj, "GetElement"), flags, 2)
        this.vtbl.FireOnFilterChangeEvent := CallbackCreate(GetMethod(implObj, "FireOnFilterChangeEvent"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetElement)
        CallbackFree(this.vtbl.FireOnFilterChangeEvent)
    }
}
