#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11Query.ahk" { ID3D11Query }

/**
 * A predicate interface determines whether geometry should be processed depending on the results of a previous draw call. (ID3D11Predicate)
 * @remarks
 * To create a predicate object, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createpredicate">ID3D11Device::CreatePredicate</a>. To set the predicate object, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-setpredication">ID3D11DeviceContext::SetPredication</a>.
 * 
 * There are two types of predicates: stream-output-overflow predicates and occlusion predicates. Stream-output-overflow predicates cause any geometry residing in stream-output buffers that were overflowed to not be processed. Occlusion predicates cause any geometry that did not have a single sample pass the depth/stencil tests to not be processed.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11predicate
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11Predicate extends ID3D11Query {
    /**
     * The interface identifier for ID3D11Predicate
     * @type {Guid}
     */
    static IID := Guid("{9eb576dd-9f77-4d86-81aa-8bab5fe490e2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11Predicate interfaces
    */
    struct Vtbl extends ID3D11Query.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11Predicate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ID3D11Predicate.IID.Equals(iid)) {
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
