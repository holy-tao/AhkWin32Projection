#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionEffect.ahk

/**
 * Represents a filter effect.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionfiltereffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionFilterEffect extends IDCompositionEffect{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionFilterEffect
     * @type {Guid}
     */
    static IID => Guid("{30c421d5-8cb2-4e9f-b133-37be270d4ac2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetInput"]

    /**
     * Sets the the input at an index to the specified filter effect.
     * @param {Integer} index Type: <b>UINT</b>
     * 
     * Specifies the index the to apply the filter effect at.
     * @param {IUnknown} input Type: <b>IUnknown*</b>
     * 
     * The filter effect to apply.
     *           The following effects are available:
     *           
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionaffinetransform2deffect">IDCompositionAffineTransform2DEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionarithmeticcompositeeffect">IDCompositionArithmeticCompositeEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionblendeffect">IDCompositionBlendEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionbrightnesseffect">IDCompositionBrightnessEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositioncolormatrixeffect">IDCompositionColorNatrixEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositioncompositeeffect">IDCompositionCompositeEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dn919732(v=vs.85)">IDCompositionFloodEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiongaussianblureffect">IDCompositionGaussianBlurEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionhuerotationeffect">IDCompositionHueRotationEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionlineartransfereffect">IDCompositionLinearTransferRffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionsaturationeffect">IDCompositionSaturationRffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionshadoweffect">IDCompositionShadowEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontabletransfereffect">IDCompositionTableTransferEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionturbulenceeffect">IDCompositionTurbulenceEffect</a>
     * </li>
     * </ul>
     * @param {Integer} flags Type: <b>UINT</b>
     * 
     * Flags to apply to the filter effect.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionfiltereffect-setinput
     */
    SetInput(index, input, flags) {
        result := ComCall(3, this, "uint", index, "ptr", input, "uint", flags, "HRESULT")
        return result
    }
}
