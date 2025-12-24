#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10BlendState.ahk
#Include .\ID3D10EffectVariable.ahk

/**
 * The blend-variable interface accesses blend state.
 * @remarks
 * 
 * An <b>ID3D10EffectBlendVariable Interface</b> is created when an effect is read into memory.
 * 
 * Effect variables are saved in memory in the backing store; when a technique is applied, the values in the backing store are copied to the device. You
 *  can use either of these methods to return state. For examples, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-effects-set-state">Two Ways to Get the State in an Effect Variable</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effectblendvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10EffectBlendVariable extends ID3D10EffectVariable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10EffectBlendVariable
     * @type {Guid}
     */
    static IID => Guid("{1fcd2294-df6d-4eae-86b3-0e9160cfb07b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBlendState", "GetBackingStore"]

    /**
     * Get a pointer to a blend-state interface.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into an array of blend-state interfaces. If there is only one blend-state interface, use 0.
     * @returns {ID3D10BlendState} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10blendstate">ID3D10BlendState</a>**</b>
     * 
     * The address of a pointer to a blend-state interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10blendstate">ID3D10BlendState Interface</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectblendvariable-getblendstate
     */
    GetBlendState(Index) {
        result := ComCall(25, this, "uint", Index, "ptr*", &ppBlendState := 0, "HRESULT")
        return ID3D10BlendState(ppBlendState)
    }

    /**
     * Get a pointer to a blend-state variable.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into an array of blend-state descriptions. If there is only one blend-state variable in the effect, use 0.
     * @param {Pointer<D3D10_BLEND_DESC>} pBlendDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_blend_desc">D3D10_BLEND_DESC</a>*</b>
     * 
     * A pointer to a blend-state description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_blend_desc">D3D10_BLEND_DESC</a>).
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectblendvariable-getbackingstore
     */
    GetBackingStore(Index, pBlendDesc) {
        result := ComCall(26, this, "uint", Index, "ptr", pBlendDesc, "HRESULT")
        return result
    }
}
