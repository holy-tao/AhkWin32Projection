#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10Query.ahk" { ID3D10Query }

/**
 * A predicate interface determines whether geometry should be processed depending on the results of a previous draw call. (ID3D10Predicate)
 * @remarks
 * A predicate can be created with <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createpredicate">ID3D10Device::CreatePredicate</a>, and used with <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-setpredication">ID3D10Device::SetPredication</a>.
 * 
 * There are two types of predicates in Direct3D 10: stream-output-overflow predicates and occlusion predicates. Stream-output-overflow predicates will cause any geometry residing in stream-output buffers that were overflowed to not be processed. Occlusion predicates will cause any geometry that did not have a single sample pass the depth/stencil tests to not be processed.
 * 
 * For an example of occlusion-predicated rendering, see <a href="https://msdn.microsoft.com/library/Ee416402(v=VS.85).aspx">Draw Predicated Sample</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/nn-d3d10-id3d10predicate
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10Predicate extends ID3D10Query {
    /**
     * The interface identifier for ID3D10Predicate
     * @type {Guid}
     */
    static IID := Guid("{9b7e4c10-342c-4106-a19f-4f2704f689f0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10Predicate interfaces
    */
    struct Vtbl extends ID3D10Query.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10Predicate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ID3D10Predicate.IID.Equals(iid)) {
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
