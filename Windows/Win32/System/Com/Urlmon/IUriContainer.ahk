#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUri.ahk" { IUri }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IUriContainer extends IUnknown {
    /**
     * The interface identifier for IUriContainer
     * @type {Guid}
     */
    static IID := Guid("{a158a630-ed6f-45fb-b987-f68676f57752}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUriContainer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIUri : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUriContainer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IUri} 
     */
    GetIUri() {
        result := ComCall(3, this, "ptr*", &ppIUri := 0, "HRESULT")
        return IUri(ppIUri)
    }

    Query(iid) {
        if (IUriContainer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIUri := CallbackCreate(GetMethod(implObj, "GetIUri"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIUri)
    }
}
