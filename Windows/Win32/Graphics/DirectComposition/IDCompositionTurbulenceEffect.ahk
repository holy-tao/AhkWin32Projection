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
     * Sets the coordinates where the turbulence output is generated.
     * @param {Pointer<D2D_VECTOR_2F>} offset Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_2f">D2D1_VECTOR_2F</a></b>
     * 
     * The coordinates where the turbulence output is generated.
     *             The algorithm used to generate the Perlin noise is position dependent, so a different offset results in a different output. This value is not bounded and the units are specified in DIPs
     *             
     * 
     * <div class="alert"><b>Note</b>  Note  The offset does not have the same effect as a translation because the noise function output is infinite and the function will wrap around the tile.</div>
     * <div> </div>
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionturbulenceeffect-setoffset
     */
    SetOffset(offset) {
        result := ComCall(4, this, "ptr", offset, "HRESULT")
        return result
    }

    /**
     * Sets the base frequencies in the X and Y direction.
     * @param {Pointer<D2D_VECTOR_2F>} frequency Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_2f">D2D1_VECTOR_2F</a></b>
     * 
     * The base frequencies in the X and Y direction. This must be greater than 0. The units are specified in 1/DIPs.
     *             A value of 1 (1/DIPs) for the base frequency results in the Perlin noise completing an entire cycle between two pixels. The ease interpolation for these pixels results in completely random pixels,
     *             since there is no correlation between the pixels.
     *             A value of 0.1(1/DIPs) for the base frequency results in the Perlin noise function repeating every 10 DIPs. This results in correlation between pixels and the typical turbulence effect is visible.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionturbulenceeffect-setbasefrequency
     */
    SetBaseFrequency(frequency) {
        result := ComCall(5, this, "ptr", frequency, "HRESULT")
        return result
    }

    /**
     * Sets the size of the turbulence output.
     * @param {Pointer<D2D_VECTOR_2F>} size Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_2f">D2D1_VECTOR_2F</a></b>
     * 
     * The size of the turbulence output
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionturbulenceeffect-setsize
     */
    SetSize(size) {
        result := ComCall(6, this, "ptr", size, "HRESULT")
        return result
    }

    /**
     * Sets the number of octaves for the noise function.
     * @param {Integer} numOctaves Type: <b>UINT</b>
     * 
     * The number of octaves for the noise function. This value must be greater than 0.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionturbulenceeffect-setnumoctaves
     */
    SetNumOctaves(numOctaves) {
        result := ComCall(7, this, "uint", numOctaves, "HRESULT")
        return result
    }

    /**
     * Sets the seed for the pseudo random generator.
     * @param {Integer} seed Type: <b>UINT</b>
     * 
     * The seed for the pseudo random generator. This value is unbounded.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionturbulenceeffect-setseed
     */
    SetSeed(seed) {
        result := ComCall(8, this, "uint", seed, "HRESULT")
        return result
    }

    /**
     * Sets the turbulence noise mode.
     * @param {Integer} noise Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/turbulence">D2D1_TURBULENCE_NOISE</a></b>
     * 
     * The turbulence noise mode. Indicates whether to generate a bitmap based on Fractal Noise or the Turbulence function.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionturbulenceeffect-setnoise
     */
    SetNoise(noise) {
        result := ComCall(9, this, "int", noise, "HRESULT")
        return result
    }

    /**
     * Specifies whether stitching is on or off.
     * @param {BOOL} stitchable Type: <b>BOOL</b>
     * 
     * A boolean value that specifies whether stitching is on or off. The base frequency is adjusted so that the output bitmap can be stitched.
     *             This is useful if you want to tile multiple copies of the turbulence effect output.
     *             If this value is TRUE, the output bitmap can be tiled (using the tile effect) without the appearance of seams and the base frequency is adjusted so that output bitmap can be stitched.
     *             If this value is FALSE, the base frequency is not adjusted, so seams may appear between tiles if the bitmap is tiled.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionturbulenceeffect-setstitchable
     */
    SetStitchable(stitchable) {
        result := ComCall(10, this, "int", stitchable, "HRESULT")
        return result
    }
}
