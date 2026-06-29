#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IViewObjectPresentSite.ahk" { IViewObjectPresentSite }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IViewObjectPresentNotifySite extends IViewObjectPresentSite {
    /**
     * The interface identifier for IViewObjectPresentNotifySite
     * @type {Guid}
     */
    static IID := Guid("{305107fa-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IViewObjectPresentNotifySite interfaces
    */
    struct Vtbl extends IViewObjectPresentSite.Vtbl {
        RequestFrame : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IViewObjectPresentNotifySite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RequestFrame() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IViewObjectPresentNotifySite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RequestFrame := CallbackCreate(GetMethod(implObj, "RequestFrame"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RequestFrame)
    }
}
