#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct ITargetNotify extends IUnknown {
    /**
     * The interface identifier for ITargetNotify
     * @type {Guid}
     */
    static IID := Guid("{863a99a0-21bc-11d0-82b4-00a0c90c29c5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITargetNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnCreate : IntPtr
        OnReuse  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITargetNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pUnkDestination 
     * @param {Integer} cbCookie 
     * @returns {HRESULT} 
     */
    OnCreate(pUnkDestination, cbCookie) {
        result := ComCall(3, this, "ptr", pUnkDestination, "uint", cbCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkDestination 
     * @returns {HRESULT} 
     */
    OnReuse(pUnkDestination) {
        result := ComCall(4, this, "ptr", pUnkDestination, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITargetNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnCreate := CallbackCreate(GetMethod(implObj, "OnCreate"), flags, 3)
        this.vtbl.OnReuse := CallbackCreate(GetMethod(implObj, "OnReuse"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnCreate)
        CallbackFree(this.vtbl.OnReuse)
    }
}
