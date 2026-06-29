#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }

/**
 * A container for 3D lookup table data that can be passed to the LookupTable3D effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1lookuptable3d
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1LookupTable3D extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1LookupTable3D
     * @type {Guid}
     */
    static IID := Guid("{53dd9855-a3b0-4d5b-82e1-26e25c5e5797}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1LookupTable3D interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1LookupTable3D.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ID2D1LookupTable3D.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
