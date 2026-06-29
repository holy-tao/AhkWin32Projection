#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct IProtectFocus extends IUnknown {
    /**
     * The interface identifier for IProtectFocus
     * @type {Guid}
     */
    static IID := Guid("{d81f90a3-8156-44f7-ad28-5abb87003274}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProtectFocus interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AllowFocusChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProtectFocus.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    AllowFocusChange() {
        result := ComCall(3, this, BOOL.Ptr, &pfAllow := 0, "HRESULT")
        return pfAllow
    }

    Query(iid) {
        if (IProtectFocus.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AllowFocusChange := CallbackCreate(GetMethod(implObj, "AllowFocusChange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AllowFocusChange)
    }
}
