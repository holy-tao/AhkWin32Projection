#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10RenderTargetView.ahk
#Include .\ID3D10EffectVariable.ahk

/**
 * A render-target-view interface accesses a render target.
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effectrendertargetviewvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10EffectRenderTargetViewVariable extends ID3D10EffectVariable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10EffectRenderTargetViewVariable
     * @type {Guid}
     */
    static IID => Guid("{28ca0cc3-c2c9-40bb-b57f-67b737122b17}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRenderTarget", "GetRenderTarget", "SetRenderTargetArray", "GetRenderTargetArray"]

    /**
     * Set a render-target.
     * @param {ID3D10RenderTargetView} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView</a>*</b>
     * 
     * A pointer to a render-target-view interface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView Interface</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectrendertargetviewvariable-setrendertarget
     */
    SetRenderTarget(pResource) {
        result := ComCall(25, this, "ptr", pResource, "HRESULT")
        return result
    }

    /**
     * Get a render-target.
     * @returns {ID3D10RenderTargetView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView</a>**</b>
     * 
     * The address of a pointer to a render-target-view interface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectrendertargetviewvariable-getrendertarget
     */
    GetRenderTarget() {
        result := ComCall(26, this, "ptr*", &ppResource := 0, "HRESULT")
        return ID3D10RenderTargetView(ppResource)
    }

    /**
     * Set an array of render-targets.
     * @param {Pointer<ID3D10RenderTargetView>} ppResources Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView</a>**</b>
     * 
     * Set an array of render-target-view interfaces. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView Interface</a>.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The zero-based array index to store the first interface.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of elements in the array.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectrendertargetviewvariable-setrendertargetarray
     */
    SetRenderTargetArray(ppResources, Offset, Count) {
        result := ComCall(27, this, "ptr*", ppResources, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * Get an array of render-targets.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The zero-based array index to get the first interface.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of elements in the array.
     * @returns {ID3D10RenderTargetView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView</a>**</b>
     * 
     * A pointer to an array of render-target-view interfaces. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectrendertargetviewvariable-getrendertargetarray
     */
    GetRenderTargetArray(Offset, Count) {
        result := ComCall(28, this, "ptr*", &ppResources := 0, "uint", Offset, "uint", Count, "HRESULT")
        return ID3D10RenderTargetView(ppResources)
    }
}
