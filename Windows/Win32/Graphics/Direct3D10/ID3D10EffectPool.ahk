#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A pool interface represents a common memory space (or pool) for sharing variables between effects.
 * @remarks
 * 
  * To create an effect pool, call a function like <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3dx10createeffectpoolfromfile">D3DX10CreateEffectPoolFromFile</a>. Effect pools can improve performance by reducing the number of API calls required to make state changes (see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-effects-performance">Using Effect Pools</a>).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effectpool
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10EffectPool extends IUnknown{
    /**
     * The interface identifier for ID3D10EffectPool
     * @type {Guid}
     */
    static IID => Guid("{9537ab04-3250-412e-8213-fcd2f8677933}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {Pointer<ID3D10Effect>} 
     */
    AsEffect() {
        result := ComCall(3, this, "ptr")
        return result
    }
}
