#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }

/**
 * Encapsulates a device- and transform-dependent representation of a filled or stroked geometry.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_2/nn-d2d1_2-id2d1geometryrealization
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1GeometryRealization extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1GeometryRealization
     * @type {Guid}
     */
    static IID := Guid("{a16907d7-bc02-4801-99e8-8cf7f485f774}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1GeometryRealization interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1GeometryRealization.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ID2D1GeometryRealization.IID.Equals(iid)) {
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
