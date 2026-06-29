#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_GRADIENT_MESH_PATCH.ahk" { D2D1_GRADIENT_MESH_PATCH }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }

/**
 * Represents a device-dependent representation of a gradient mesh composed of patches. Use the ID2D1DeviceContext2::CreateGradientMesh method to create an instance of ID2D1GradientMesh.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1gradientmesh
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1GradientMesh extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1GradientMesh
     * @type {Guid}
     */
    static IID := Guid("{f292e401-c050-4cde-83d7-04962d3b23c2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1GradientMesh interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
        GetPatchCount : IntPtr
        GetPatches    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1GradientMesh.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the number of patches that make up this gradient mesh.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * Returns the number of patches that make up this gradient mesh.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1gradientmesh-getpatchcount
     */
    GetPatchCount() {
        result := ComCall(4, this, UInt32)
        return result
    }

    /**
     * Returns a subset of the patches that make up this gradient mesh.
     * @param {Integer} startIndex Type: <b>UINT32</b>
     * 
     * Index of the first patch to return.
     * @param {Integer} patchesCount Type: <b>UINT32</b>
     * 
     * The number of patches to be returned.
     * @returns {D2D1_GRADIENT_MESH_PATCH} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_gradient_mesh_patch">D2D1_GRADIENT_MESH_PATCH</a>*</b>
     * 
     * A pointer to the array to be filled with the patch data.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1gradientmesh-getpatches
     */
    GetPatches(startIndex, patchesCount) {
        patches := D2D1_GRADIENT_MESH_PATCH()
        result := ComCall(5, this, "uint", startIndex, D2D1_GRADIENT_MESH_PATCH.Ptr, patches, "uint", patchesCount, "HRESULT")
        return patches
    }

    Query(iid) {
        if (ID2D1GradientMesh.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPatchCount := CallbackCreate(GetMethod(implObj, "GetPatchCount"), flags, 1)
        this.vtbl.GetPatches := CallbackCreate(GetMethod(implObj, "GetPatches"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPatchCount)
        CallbackFree(this.vtbl.GetPatches)
    }
}
