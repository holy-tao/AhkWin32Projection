#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDxcBlobEncoding.ahk" { IDxcBlobEncoding }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct IDxcBlobUtf16 extends IDxcBlobEncoding {
    /**
     * The interface identifier for IDxcBlobUtf16
     * @type {Guid}
     */
    static IID := Guid("{a3f84eab-0faa-497e-a39c-ee6ed60b2d84}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDxcBlobUtf16 interfaces
    */
    struct Vtbl extends IDxcBlobEncoding.Vtbl {
        GetStringPointer : IntPtr
        GetStringLength  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDxcBlobUtf16.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetStringPointer() {
        result := ComCall(6, this, PWSTR)
        return result
    }

    /**
     * 
     * @returns {Pointer} 
     */
    GetStringLength() {
        result := ComCall(7, this, IntPtr)
        return result
    }

    Query(iid) {
        if (IDxcBlobUtf16.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStringPointer := CallbackCreate(GetMethod(implObj, "GetStringPointer"), flags, 1)
        this.vtbl.GetStringLength := CallbackCreate(GetMethod(implObj, "GetStringLength"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStringPointer)
        CallbackFree(this.vtbl.GetStringLength)
    }
}
