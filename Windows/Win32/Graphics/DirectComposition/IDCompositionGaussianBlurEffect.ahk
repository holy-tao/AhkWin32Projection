#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionFilterEffect.ahk

/**
 * The Gaussian blur effect is used to blur an image by a Gaussian function, typically to reduce image noise and reduce detail.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositiongaussianblureffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionGaussianBlurEffect extends IDCompositionFilterEffect{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionGaussianBlurEffect
     * @type {Guid}
     */
    static IID => Guid("{45d4d0b7-1bd4-454e-8894-2bfa68443033}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetStandardDeviation", "SetStandardDeviation1", "SetBorderMode"]

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiongaussianblureffect-setstandarddeviation(float)
     */
    SetStandardDeviation(animation) {
        result := ComCall(4, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} amount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiongaussianblureffect-setstandarddeviation(float)
     */
    SetStandardDeviation1(amount) {
        result := ComCall(5, this, "float", amount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiongaussianblureffect-setbordermode
     */
    SetBorderMode(mode) {
        result := ComCall(6, this, "int", mode, "HRESULT")
        return result
    }
}
