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
     * 
     * @param {ID3D10RenderTargetView} pResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectrendertargetviewvariable-setrendertarget
     */
    SetRenderTarget(pResource) {
        result := ComCall(25, this, "ptr", pResource, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ID3D10RenderTargetView} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectrendertargetviewvariable-getrendertarget
     */
    GetRenderTarget() {
        result := ComCall(26, this, "ptr*", &ppResource := 0, "HRESULT")
        return ID3D10RenderTargetView(ppResource)
    }

    /**
     * 
     * @param {Pointer<ID3D10RenderTargetView>} ppResources 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectrendertargetviewvariable-setrendertargetarray
     */
    SetRenderTargetArray(ppResources, Offset, Count) {
        result := ComCall(27, this, "ptr*", ppResources, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {ID3D10RenderTargetView} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectrendertargetviewvariable-getrendertargetarray
     */
    GetRenderTargetArray(Offset, Count) {
        result := ComCall(28, this, "ptr*", &ppResources := 0, "uint", Offset, "uint", Count, "HRESULT")
        return ID3D10RenderTargetView(ppResources)
    }
}
