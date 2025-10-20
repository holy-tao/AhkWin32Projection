#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionFilterEffect.ahk

/**
 * The turbulence effect is used to generate a bitmap based on the Perlin noise function. The turbulence effect has no input image.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionturbulenceeffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionTurbulenceEffect extends IDCompositionFilterEffect{
    /**
     * The interface identifier for IDCompositionTurbulenceEffect
     * @type {Guid}
     */
    static IID => Guid("{a6a55bda-c09c-49f3-9193-a41922c89715}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Pointer<D2D_VECTOR_2F>} offset 
     * @returns {HRESULT} 
     */
    SetOffset(offset) {
        result := ComCall(4, this, "ptr", offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D_VECTOR_2F>} frequency 
     * @returns {HRESULT} 
     */
    SetBaseFrequency(frequency) {
        result := ComCall(5, this, "ptr", frequency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D_VECTOR_2F>} size 
     * @returns {HRESULT} 
     */
    SetSize(size) {
        result := ComCall(6, this, "ptr", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} numOctaves 
     * @returns {HRESULT} 
     */
    SetNumOctaves(numOctaves) {
        result := ComCall(7, this, "uint", numOctaves, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} seed 
     * @returns {HRESULT} 
     */
    SetSeed(seed) {
        result := ComCall(8, this, "uint", seed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} noise 
     * @returns {HRESULT} 
     */
    SetNoise(noise) {
        result := ComCall(9, this, "int", noise, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} stitchable 
     * @returns {HRESULT} 
     */
    SetStitchable(stitchable) {
        result := ComCall(10, this, "int", stitchable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
