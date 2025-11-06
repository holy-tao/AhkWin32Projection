#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10DepthStencilState.ahk
#Include .\D3D10_DEPTH_STENCIL_DESC.ahk
#Include .\ID3D10EffectVariable.ahk

/**
 * A depth-stencil-variable interface accesses depth-stencil state.
 * @remarks
 * 
  * An <b>ID3D10EffectDepthStencilVariable Interface</b> is created when an effect is read into memory.
  * 
  * Effect variables are saved in memory in the backing store; when a technique is applied, the values in the backing store are copied to the device. You
  *  can use either of these methods to return state. For examples, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-effects-set-state">Two Ways to Get the State in an Effect Variable</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effectdepthstencilvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10EffectDepthStencilVariable extends ID3D10EffectVariable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10EffectDepthStencilVariable
     * @type {Guid}
     */
    static IID => Guid("{af482368-330a-46a5-9a5c-01c71af24c8d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDepthStencilState", "GetBackingStore"]

    /**
     * 
     * @param {Integer} Index 
     * @returns {ID3D10DepthStencilState} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectdepthstencilvariable-getdepthstencilstate
     */
    GetDepthStencilState(Index) {
        result := ComCall(25, this, "uint", Index, "ptr*", &ppDepthStencilState := 0, "HRESULT")
        return ID3D10DepthStencilState(ppDepthStencilState)
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {D3D10_DEPTH_STENCIL_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectdepthstencilvariable-getbackingstore
     */
    GetBackingStore(Index) {
        pDepthStencilDesc := D3D10_DEPTH_STENCIL_DESC()
        result := ComCall(26, this, "uint", Index, "ptr", pDepthStencilDesc, "HRESULT")
        return pDepthStencilDesc
    }
}
