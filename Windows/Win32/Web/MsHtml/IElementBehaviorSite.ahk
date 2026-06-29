#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IElementBehaviorSite extends IUnknown {
    /**
     * The interface identifier for IElementBehaviorSite
     * @type {Guid}
     */
    static IID := Guid("{3050f427-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IElementBehaviorSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetElement           : IntPtr
        RegisterNotification : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IElementBehaviorSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    GetElement() {
        result := ComCall(3, this, "ptr*", &ppElement := 0, "HRESULT")
        return IHTMLElement(ppElement)
    }

    /**
     * 
     * @param {Integer} lEvent 
     * @returns {HRESULT} 
     */
    RegisterNotification(lEvent) {
        result := ComCall(4, this, "int", lEvent, "HRESULT")
        return result
    }

    Query(iid) {
        if (IElementBehaviorSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetElement := CallbackCreate(GetMethod(implObj, "GetElement"), flags, 2)
        this.vtbl.RegisterNotification := CallbackCreate(GetMethod(implObj, "RegisterNotification"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetElement)
        CallbackFree(this.vtbl.RegisterNotification)
    }
}
