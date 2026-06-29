#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugHostMemory.ahk" { IDebugHostMemory }
#Import ".\IDebugHostContext.ahk" { IDebugHostContext }
#Import ".\Location.ahk" { Location }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostMemory2 extends IDebugHostMemory {
    /**
     * The interface identifier for IDebugHostMemory2
     * @type {Guid}
     */
    static IID := Guid("{eea033de-38f6-416b-a251-1d3771001270}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostMemory2 interfaces
    */
    struct Vtbl extends IDebugHostMemory.Vtbl {
        LinearizeLocation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostMemory2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDebugHostContext} _context 
     * @param {Location} _location 
     * @returns {Location} 
     */
    LinearizeLocation(_context, _location) {
        pLinearizedLocation := Location()
        result := ComCall(8, this, "ptr", _context, Location, _location, Location.Ptr, pLinearizedLocation, "HRESULT")
        return pLinearizedLocation
    }

    Query(iid) {
        if (IDebugHostMemory2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LinearizeLocation := CallbackCreate(GetMethod(implObj, "LinearizeLocation"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LinearizeLocation)
    }
}
