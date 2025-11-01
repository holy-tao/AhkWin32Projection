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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOffset", "SetBaseFrequency", "SetSize", "SetNumOctaves", "SetSeed", "SetNoise", "SetStitchable"]

    /**
     * 
     * @param {Pointer<D2D_VECTOR_2F>} offset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionturbulenceeffect-setoffset
     */
    SetOffset(offset) {
        result := ComCall(4, this, "ptr", offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_VECTOR_2F>} frequency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionturbulenceeffect-setbasefrequency
     */
    SetBaseFrequency(frequency) {
        result := ComCall(5, this, "ptr", frequency, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_VECTOR_2F>} size 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionturbulenceeffect-setsize
     */
    SetSize(size) {
        result := ComCall(6, this, "ptr", size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} numOctaves 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionturbulenceeffect-setnumoctaves
     */
    SetNumOctaves(numOctaves) {
        result := ComCall(7, this, "uint", numOctaves, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} seed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionturbulenceeffect-setseed
     */
    SetSeed(seed) {
        result := ComCall(8, this, "uint", seed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} noise 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionturbulenceeffect-setnoise
     */
    SetNoise(noise) {
        result := ComCall(9, this, "int", noise, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} stitchable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionturbulenceeffect-setstitchable
     */
    SetStitchable(stitchable) {
        result := ComCall(10, this, "int", stitchable, "HRESULT")
        return result
    }
}
