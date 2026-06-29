#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDocHostUIHandler.ahk" { IDocHostUIHandler }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ICustomDoc extends IUnknown {
    /**
     * The interface identifier for ICustomDoc
     * @type {Guid}
     */
    static IID := Guid("{3050f3f0-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICustomDoc interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetUIHandler : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICustomDoc.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDocHostUIHandler} pUIHandler 
     * @returns {HRESULT} 
     */
    SetUIHandler(pUIHandler) {
        result := ComCall(3, this, "ptr", pUIHandler, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICustomDoc.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetUIHandler := CallbackCreate(GetMethod(implObj, "SetUIHandler"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetUIHandler)
    }
}
