#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D2D1_GRADIENT_MESH_PATCH.ahk
#Include .\ID2D1Resource.ahk

/**
 * Represents a device-dependent representation of a gradient mesh composed of patches. Use the ID2D1DeviceContext2::CreateGradientMesh method to create an instance of ID2D1GradientMesh.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1gradientmesh
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1GradientMesh extends ID2D1Resource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1GradientMesh
     * @type {Guid}
     */
    static IID => Guid("{f292e401-c050-4cde-83d7-04962d3b23c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPatchCount", "GetPatches"]

    /**
     * Returns the number of patches that make up this gradient mesh.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * Returns the number of patches that make up this gradient mesh.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1gradientmesh-getpatchcount
     */
    GetPatchCount() {
        result := ComCall(4, this, "uint")
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
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1gradientmesh-getpatches
     */
    GetPatches(startIndex, patchesCount) {
        patches := D2D1_GRADIENT_MESH_PATCH()
        result := ComCall(5, this, "uint", startIndex, "ptr", patches, "uint", patchesCount, "HRESULT")
        return patches
    }
}
