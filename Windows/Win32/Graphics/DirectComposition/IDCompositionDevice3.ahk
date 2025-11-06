#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionGaussianBlurEffect.ahk
#Include .\IDCompositionBrightnessEffect.ahk
#Include .\IDCompositionColorMatrixEffect.ahk
#Include .\IDCompositionShadowEffect.ahk
#Include .\IDCompositionHueRotationEffect.ahk
#Include .\IDCompositionSaturationEffect.ahk
#Include .\IDCompositionTurbulenceEffect.ahk
#Include .\IDCompositionLinearTransferEffect.ahk
#Include .\IDCompositionTableTransferEffect.ahk
#Include .\IDCompositionCompositeEffect.ahk
#Include .\IDCompositionBlendEffect.ahk
#Include .\IDCompositionArithmeticCompositeEffect.ahk
#Include .\IDCompositionAffineTransform2DEffect.ahk
#Include .\IDCompositionDevice2.ahk

/**
 * Serves as a factory for all other Microsoft DirectComposition objects and provides methods to control transactional composition.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositiondevice3
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionDevice3 extends IDCompositionDevice2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionDevice3
     * @type {Guid}
     */
    static IID => Guid("{0987cb06-f916-48bf-8d35-ce7641781bd9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateGaussianBlurEffect", "CreateBrightnessEffect", "CreateColorMatrixEffect", "CreateShadowEffect", "CreateHueRotationEffect", "CreateSaturationEffect", "CreateTurbulenceEffect", "CreateLinearTransferEffect", "CreateTableTransferEffect", "CreateCompositeEffect", "CreateBlendEffect", "CreateArithmeticCompositeEffect", "CreateAffineTransform2DEffect"]

    /**
     * 
     * @returns {IDCompositionGaussianBlurEffect} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-creategaussianblureffect
     */
    CreateGaussianBlurEffect() {
        result := ComCall(24, this, "ptr*", &gaussianBlurEffect := 0, "HRESULT")
        return IDCompositionGaussianBlurEffect(gaussianBlurEffect)
    }

    /**
     * 
     * @returns {IDCompositionBrightnessEffect} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createbrightnesseffect
     */
    CreateBrightnessEffect() {
        result := ComCall(25, this, "ptr*", &brightnessEffect := 0, "HRESULT")
        return IDCompositionBrightnessEffect(brightnessEffect)
    }

    /**
     * 
     * @returns {IDCompositionColorMatrixEffect} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createcolormatrixeffect
     */
    CreateColorMatrixEffect() {
        result := ComCall(26, this, "ptr*", &colorMatrixEffect := 0, "HRESULT")
        return IDCompositionColorMatrixEffect(colorMatrixEffect)
    }

    /**
     * 
     * @returns {IDCompositionShadowEffect} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createshadoweffect
     */
    CreateShadowEffect() {
        result := ComCall(27, this, "ptr*", &shadowEffect := 0, "HRESULT")
        return IDCompositionShadowEffect(shadowEffect)
    }

    /**
     * 
     * @returns {IDCompositionHueRotationEffect} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createhuerotationeffect
     */
    CreateHueRotationEffect() {
        result := ComCall(28, this, "ptr*", &hueRotationEffect := 0, "HRESULT")
        return IDCompositionHueRotationEffect(hueRotationEffect)
    }

    /**
     * 
     * @returns {IDCompositionSaturationEffect} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createsaturationeffect
     */
    CreateSaturationEffect() {
        result := ComCall(29, this, "ptr*", &saturationEffect := 0, "HRESULT")
        return IDCompositionSaturationEffect(saturationEffect)
    }

    /**
     * 
     * @returns {IDCompositionTurbulenceEffect} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createturbulenceeffect
     */
    CreateTurbulenceEffect() {
        result := ComCall(30, this, "ptr*", &turbulenceEffect := 0, "HRESULT")
        return IDCompositionTurbulenceEffect(turbulenceEffect)
    }

    /**
     * 
     * @returns {IDCompositionLinearTransferEffect} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createlineartransfereffect
     */
    CreateLinearTransferEffect() {
        result := ComCall(31, this, "ptr*", &linearTransferEffect := 0, "HRESULT")
        return IDCompositionLinearTransferEffect(linearTransferEffect)
    }

    /**
     * 
     * @returns {IDCompositionTableTransferEffect} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createtabletransfereffect
     */
    CreateTableTransferEffect() {
        result := ComCall(32, this, "ptr*", &tableTransferEffect := 0, "HRESULT")
        return IDCompositionTableTransferEffect(tableTransferEffect)
    }

    /**
     * 
     * @returns {IDCompositionCompositeEffect} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createcompositeeffect
     */
    CreateCompositeEffect() {
        result := ComCall(33, this, "ptr*", &compositeEffect := 0, "HRESULT")
        return IDCompositionCompositeEffect(compositeEffect)
    }

    /**
     * 
     * @returns {IDCompositionBlendEffect} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createblendeffect
     */
    CreateBlendEffect() {
        result := ComCall(34, this, "ptr*", &blendEffect := 0, "HRESULT")
        return IDCompositionBlendEffect(blendEffect)
    }

    /**
     * 
     * @returns {IDCompositionArithmeticCompositeEffect} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createarithmeticcompositeeffect
     */
    CreateArithmeticCompositeEffect() {
        result := ComCall(35, this, "ptr*", &arithmeticCompositeEffect := 0, "HRESULT")
        return IDCompositionArithmeticCompositeEffect(arithmeticCompositeEffect)
    }

    /**
     * 
     * @returns {IDCompositionAffineTransform2DEffect} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createaffinetransform2deffect
     */
    CreateAffineTransform2DEffect() {
        result := ComCall(36, this, "ptr*", &affineTransform2dEffect := 0, "HRESULT")
        return IDCompositionAffineTransform2DEffect(affineTransform2dEffect)
    }
}
