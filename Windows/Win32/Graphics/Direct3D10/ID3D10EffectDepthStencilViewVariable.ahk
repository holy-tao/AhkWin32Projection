#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10EffectVariable.ahk

/**
 * A depth-stencil-view-variable interface accesses a depth-stencil view.
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effectdepthstencilviewvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10EffectDepthStencilViewVariable extends ID3D10EffectVariable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10EffectDepthStencilViewVariable
     * @type {Guid}
     */
    static IID => Guid("{3e02c918-cc79-4985-b622-2d92ad701623}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDepthStencil", "GetDepthStencil", "SetDepthStencilArray", "GetDepthStencilArray"]

    /**
     * 
     * @param {ID3D10DepthStencilView} pResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectdepthstencilviewvariable-setdepthstencil
     */
    SetDepthStencil(pResource) {
        result := ComCall(25, this, "ptr", pResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10DepthStencilView>} ppResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectdepthstencilviewvariable-getdepthstencil
     */
    GetDepthStencil(ppResource) {
        result := ComCall(26, this, "ptr*", ppResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10DepthStencilView>} ppResources 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectdepthstencilviewvariable-setdepthstencilarray
     */
    SetDepthStencilArray(ppResources, Offset, Count) {
        result := ComCall(27, this, "ptr*", ppResources, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10DepthStencilView>} ppResources 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectdepthstencilviewvariable-getdepthstencilarray
     */
    GetDepthStencilArray(ppResources, Offset, Count) {
        result := ComCall(28, this, "ptr*", ppResources, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }
}
