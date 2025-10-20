#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10EffectVariable.ahk

/**
 * A sampler interface accesses sampler state.
 * @remarks
 * 
  * An <b>ID3D10EffectSamplerVariable Interface</b> is created when an effect is read into memory.
  * 
  * Effect variables are saved in memory in the backing store; when a technique is applied, the values in the backing store are copied to the device. You
  *  can use either of these methods to return state. For examples, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-effects-set-state">Two Ways to Get the State in an Effect Variable</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effectsamplervariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10EffectSamplerVariable extends ID3D10EffectVariable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10EffectSamplerVariable
     * @type {Guid}
     */
    static IID => Guid("{6530d5c7-07e9-4271-a418-e7ce4bd1e480}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSampler", "GetBackingStore"]

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<ID3D10SamplerState>} ppSampler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectsamplervariable-getsampler
     */
    GetSampler(Index, ppSampler) {
        result := ComCall(25, this, "uint", Index, "ptr*", ppSampler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<D3D10_SAMPLER_DESC>} pSamplerDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectsamplervariable-getbackingstore
     */
    GetBackingStore(Index, pSamplerDesc) {
        result := ComCall(26, this, "uint", Index, "ptr", pSamplerDesc, "HRESULT")
        return result
    }
}
