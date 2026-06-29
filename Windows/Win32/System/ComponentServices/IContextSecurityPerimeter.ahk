#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IContextSecurityPerimeter extends IUnknown {
    /**
     * The interface identifier for IContextSecurityPerimeter
     * @type {Guid}
     */
    static IID := Guid("{a7549a29-a7c4-42e1-8dc1-7e3d748dc24a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContextSecurityPerimeter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPerimeterFlag : IntPtr
        SetPerimeterFlag : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContextSecurityPerimeter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<BOOL>} pFlag 
     * @returns {HRESULT} 
     */
    GetPerimeterFlag(pFlag) {
        pFlagMarshal := pFlag is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pFlagMarshal, pFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fFlag 
     * @returns {HRESULT} 
     */
    SetPerimeterFlag(fFlag) {
        result := ComCall(4, this, BOOL, fFlag, "HRESULT")
        return result
    }

    Query(iid) {
        if (IContextSecurityPerimeter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPerimeterFlag := CallbackCreate(GetMethod(implObj, "GetPerimeterFlag"), flags, 2)
        this.vtbl.SetPerimeterFlag := CallbackCreate(GetMethod(implObj, "SetPerimeterFlag"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPerimeterFlag)
        CallbackFree(this.vtbl.SetPerimeterFlag)
    }
}
