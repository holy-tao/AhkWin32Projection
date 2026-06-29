#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12Pageable.ahk" { ID3D12Pageable }

/**
 * Represents a variable amount of configuration state, including shaders, that an application manages as a single unit and which is given to a driver atomically to process, such as compile or optimize.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12stateobject
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12StateObject extends ID3D12Pageable {
    /**
     * The interface identifier for ID3D12StateObject
     * @type {Guid}
     */
    static IID := Guid("{47016943-fca8-4594-93ea-af258b55346d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12StateObject interfaces
    */
    struct Vtbl extends ID3D12Pageable.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12StateObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ID3D12StateObject.IID.Equals(iid)) {
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
