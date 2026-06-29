#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugHostMemory2.ahk" { IDebugHostMemory2 }
#Import ".\IDebugHostContext.ahk" { IDebugHostContext }
#Import ".\Location.ahk" { Location }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostMemory3 extends IDebugHostMemory2 {
    /**
     * The interface identifier for IDebugHostMemory3
     * @type {Guid}
     */
    static IID := Guid("{a515ed09-2bf3-4499-bb03-553790079f84}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostMemory3 interfaces
    */
    struct Vtbl extends IDebugHostMemory2.Vtbl {
        CanonicalizeLocation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostMemory3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDebugHostContext} _context 
     * @param {Location} _location 
     * @returns {Location} 
     */
    CanonicalizeLocation(_context, _location) {
        pCanonicalizedLocation := Location()
        result := ComCall(9, this, "ptr", _context, Location, _location, Location.Ptr, pCanonicalizedLocation, "HRESULT")
        return pCanonicalizedLocation
    }

    Query(iid) {
        if (IDebugHostMemory3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CanonicalizeLocation := CallbackCreate(GetMethod(implObj, "CanonicalizeLocation"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CanonicalizeLocation)
    }
}
