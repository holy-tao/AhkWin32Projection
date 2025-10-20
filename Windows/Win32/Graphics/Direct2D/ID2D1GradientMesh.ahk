#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Resource.ahk

/**
 * Represents a device-dependent representation of a gradient mesh composed of patches. Use the ID2D1DeviceContext2::CreateGradientMesh method to create an instance of ID2D1GradientMesh.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1gradientmesh
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1GradientMesh extends ID2D1Resource{
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
     * 
     * @returns {Integer} 
     */
    GetPatchCount() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} startIndex 
     * @param {Pointer<D2D1_GRADIENT_MESH_PATCH>} patches 
     * @param {Integer} patchesCount 
     * @returns {HRESULT} 
     */
    GetPatches(startIndex, patches, patchesCount) {
        result := ComCall(5, this, "uint", startIndex, "ptr", patches, "uint", patchesCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
