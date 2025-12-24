#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10RasterizerState.ahk
#Include .\D3D10_RASTERIZER_DESC.ahk
#Include .\ID3D10EffectVariable.ahk

/**
 * A rasterizer-variable interface accesses rasterizer state.
 * @remarks
 * 
 * An <b>ID3D10EffectRasterizerVariable Interface</b> is created when an effect is read into memory.
 * 
 * Effect variables are saved in memory in the backing store; when a technique is applied, the values in the backing store are copied to the device. You
 *  can use either of these methods to return state. For examples, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-effects-set-state">Two Ways to Get the State in an Effect Variable</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effectrasterizervariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10EffectRasterizerVariable extends ID3D10EffectVariable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10EffectRasterizerVariable
     * @type {Guid}
     */
    static IID => Guid("{21af9f0e-4d94-4ea9-9785-2cb76b8c0b34}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRasterizerState", "GetBackingStore"]

    /**
     * Get a pointer to a rasterizer interface.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into an array of rasterizer interfaces. If there is only one rasterizer interface, use 0.
     * @returns {ID3D10RasterizerState} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rasterizerstate">ID3D10RasterizerState</a>**</b>
     * 
     * The address of a pointer to a rasterizer interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rasterizerstate">ID3D10RasterizerState Interface</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectrasterizervariable-getrasterizerstate
     */
    GetRasterizerState(Index) {
        result := ComCall(25, this, "uint", Index, "ptr*", &ppRasterizerState := 0, "HRESULT")
        return ID3D10RasterizerState(ppRasterizerState)
    }

    /**
     * Get a pointer to a variable that contains rasteriser state.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into an array of rasteriser-state descriptions. If there is only one rasteriser variable in the effect, use 0.
     * @returns {D3D10_RASTERIZER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_rasterizer_desc">D3D10_RASTERIZER_DESC</a>*</b>
     * 
     * A pointer to a rasteriser-state description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_rasterizer_desc">D3D10_RASTERIZER_DESC</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectrasterizervariable-getbackingstore
     */
    GetBackingStore(Index) {
        pRasterizerDesc := D3D10_RASTERIZER_DESC()
        result := ComCall(26, this, "uint", Index, "ptr", pRasterizerDesc, "HRESULT")
        return pRasterizerDesc
    }
}
