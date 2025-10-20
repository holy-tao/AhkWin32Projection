#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10EffectVariable.ahk

/**
 * A shader-resource interface accesses a shader resource.
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effectshaderresourcevariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10EffectShaderResourceVariable extends ID3D10EffectVariable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10EffectShaderResourceVariable
     * @type {Guid}
     */
    static IID => Guid("{c0a7157b-d872-4b1d-8073-efc2acd4b1fc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetResource", "GetResource", "SetResourceArray", "GetResourceArray"]

    /**
     * 
     * @param {ID3D10ShaderResourceView} pResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshaderresourcevariable-setresource
     */
    SetResource(pResource) {
        result := ComCall(25, this, "ptr", pResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10ShaderResourceView>} ppResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshaderresourcevariable-getresource
     */
    GetResource(ppResource) {
        result := ComCall(26, this, "ptr*", ppResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10ShaderResourceView>} ppResources 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshaderresourcevariable-setresourcearray
     */
    SetResourceArray(ppResources, Offset, Count) {
        result := ComCall(27, this, "ptr*", ppResources, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10ShaderResourceView>} ppResources 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectshaderresourcevariable-getresourcearray
     */
    GetResourceArray(ppResources, Offset, Count) {
        result := ComCall(28, this, "ptr*", ppResources, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }
}
