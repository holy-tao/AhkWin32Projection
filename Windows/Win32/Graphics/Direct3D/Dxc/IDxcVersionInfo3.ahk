#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct IDxcVersionInfo3 extends IUnknown {
    /**
     * The interface identifier for IDxcVersionInfo3
     * @type {Guid}
     */
    static IID := Guid("{5e13e843-9d25-473c-9ad2-03b2d0b44b1e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDxcVersionInfo3 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCustomVersionString : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDxcVersionInfo3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    GetCustomVersionString() {
        result := ComCall(3, this, "ptr*", &pVersionString := 0, "HRESULT")
        return pVersionString
    }

    Query(iid) {
        if (IDxcVersionInfo3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCustomVersionString := CallbackCreate(GetMethod(implObj, "GetCustomVersionString"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCustomVersionString)
    }
}
