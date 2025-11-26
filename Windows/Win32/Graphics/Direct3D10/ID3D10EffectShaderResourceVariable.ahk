#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10ShaderResourceView.ahk
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
     * Set a shader resource.
     * @param {ID3D10ShaderResourceView} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView</a>*</b>
     * 
     * The address of a pointer to a shader-resource-view interface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView Interface</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectshaderresourcevariable-setresource
     */
    SetResource(pResource) {
        result := ComCall(25, this, "ptr", pResource, "HRESULT")
        return result
    }

    /**
     * Get a shader resource.
     * @returns {ID3D10ShaderResourceView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView</a>**</b>
     * 
     * The address of a pointer to a shader-resource-view interface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectshaderresourcevariable-getresource
     */
    GetResource() {
        result := ComCall(26, this, "ptr*", &ppResource := 0, "HRESULT")
        return ID3D10ShaderResourceView(ppResource)
    }

    /**
     * Set an array of shader resources.
     * @param {Pointer<ID3D10ShaderResourceView>} ppResources Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView</a>**</b>
     * 
     * The address of an array of shader-resource-view interfaces. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView Interface</a>.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The zero-based array index to get the first interface.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of elements in the array.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectshaderresourcevariable-setresourcearray
     */
    SetResourceArray(ppResources, Offset, Count) {
        result := ComCall(27, this, "ptr*", ppResources, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * Get an array of shader resources.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The zero-based array index to get the first interface.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of elements in the array.
     * @returns {ID3D10ShaderResourceView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView</a>**</b>
     * 
     * The address of an array of shader-resource-view interfaces. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectshaderresourcevariable-getresourcearray
     */
    GetResourceArray(Offset, Count) {
        result := ComCall(28, this, "ptr*", &ppResources := 0, "uint", Offset, "uint", Count, "HRESULT")
        return ID3D10ShaderResourceView(ppResources)
    }
}
