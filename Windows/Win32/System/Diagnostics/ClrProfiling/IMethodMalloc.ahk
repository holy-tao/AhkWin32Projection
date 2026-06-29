#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct IMethodMalloc extends IUnknown {
    /**
     * The interface identifier for IMethodMalloc
     * @type {Guid}
     */
    static IID := Guid("{a0efb28b-6ee2-4d7b-b983-a75ef7beedb8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMethodMalloc interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Alloc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMethodMalloc.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cb 
     * @returns {Pointer<Void>} 
     */
    Alloc(cb) {
        result := ComCall(3, this, "uint", cb, IntPtr)
        return result
    }

    Query(iid) {
        if (IMethodMalloc.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Alloc := CallbackCreate(GetMethod(implObj, "Alloc"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Alloc)
    }
}
