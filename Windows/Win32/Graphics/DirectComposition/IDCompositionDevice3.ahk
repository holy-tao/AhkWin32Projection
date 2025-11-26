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
     * Creates an instance of IDCompositionGaussianBlurEffect.
     * @returns {IDCompositionGaussianBlurEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiongaussianblureffect">IDCompositionGaussianBlurEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiongaussianblureffect">IDCompositionGaussianBlurEffect</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice3-creategaussianblureffect
     */
    CreateGaussianBlurEffect() {
        result := ComCall(24, this, "ptr*", &gaussianBlurEffect := 0, "HRESULT")
        return IDCompositionGaussianBlurEffect(gaussianBlurEffect)
    }

    /**
     * Creates an instance of IDCompositionBrightnessEffect.
     * @returns {IDCompositionBrightnessEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionbrightnesseffect">IDCompositionBrightnessEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionbrightnesseffect">IDCompositionBrightnessEffect</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice3-createbrightnesseffect
     */
    CreateBrightnessEffect() {
        result := ComCall(25, this, "ptr*", &brightnessEffect := 0, "HRESULT")
        return IDCompositionBrightnessEffect(brightnessEffect)
    }

    /**
     * Creates an instance of IDCompositionColorMatrixEffect.
     * @returns {IDCompositionColorMatrixEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositioncolormatrixeffect">IDCompositionColorMatrixEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositioncolormatrixeffect">IDCompositionColorMatrixEffect</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice3-createcolormatrixeffect
     */
    CreateColorMatrixEffect() {
        result := ComCall(26, this, "ptr*", &colorMatrixEffect := 0, "HRESULT")
        return IDCompositionColorMatrixEffect(colorMatrixEffect)
    }

    /**
     * Creates an instance of IDCompositionShadowEffect.
     * @returns {IDCompositionShadowEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionshadoweffect">IDCompositionShadowEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionshadoweffect">IDCompositionShadowEffect</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice3-createshadoweffect
     */
    CreateShadowEffect() {
        result := ComCall(27, this, "ptr*", &shadowEffect := 0, "HRESULT")
        return IDCompositionShadowEffect(shadowEffect)
    }

    /**
     * Creates an instance of IDCompositionHueRotationEffect.
     * @returns {IDCompositionHueRotationEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionhuerotationeffect">IDCompositionHueRotationEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionhuerotationeffect">IDCompositionHueRotationEffect</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice3-createhuerotationeffect
     */
    CreateHueRotationEffect() {
        result := ComCall(28, this, "ptr*", &hueRotationEffect := 0, "HRESULT")
        return IDCompositionHueRotationEffect(hueRotationEffect)
    }

    /**
     * Creates an instance of IDCompositionSaturationEffect.
     * @returns {IDCompositionSaturationEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionsaturationeffect">IDCompositionSaturationEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionsaturationeffect">IDCompositionSaturationEffect</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice3-createsaturationeffect
     */
    CreateSaturationEffect() {
        result := ComCall(29, this, "ptr*", &saturationEffect := 0, "HRESULT")
        return IDCompositionSaturationEffect(saturationEffect)
    }

    /**
     * Creates an instance of IDCompositionTurbulenceEffect.
     * @returns {IDCompositionTurbulenceEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionturbulenceeffect">IDCompositionTurbulenceEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionturbulenceeffect">IDCompositionTurbulenceEffect</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice3-createturbulenceeffect
     */
    CreateTurbulenceEffect() {
        result := ComCall(30, this, "ptr*", &turbulenceEffect := 0, "HRESULT")
        return IDCompositionTurbulenceEffect(turbulenceEffect)
    }

    /**
     * Creates an instance of IDCompositionLinearTransferEffect.
     * @returns {IDCompositionLinearTransferEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionlineartransfereffect">IDCompositionLinearTransferEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionlineartransfereffect">IDCompositionLinearTransferEffect</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice3-createlineartransfereffect
     */
    CreateLinearTransferEffect() {
        result := ComCall(31, this, "ptr*", &linearTransferEffect := 0, "HRESULT")
        return IDCompositionLinearTransferEffect(linearTransferEffect)
    }

    /**
     * Creates an instance of IDCompositionTableTransferEffect.
     * @returns {IDCompositionTableTransferEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontabletransfereffect">IDCompositionTableTransferEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontabletransfereffect">IDCompositionTableTransferEffect</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice3-createtabletransfereffect
     */
    CreateTableTransferEffect() {
        result := ComCall(32, this, "ptr*", &tableTransferEffect := 0, "HRESULT")
        return IDCompositionTableTransferEffect(tableTransferEffect)
    }

    /**
     * Creates an instance of IDCompositionCompositeEffect.
     * @returns {IDCompositionCompositeEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositioncompositeeffect">IDCompositionCompositeEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositioncompositeeffect">IDCompositionCompositeEffect</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice3-createcompositeeffect
     */
    CreateCompositeEffect() {
        result := ComCall(33, this, "ptr*", &compositeEffect := 0, "HRESULT")
        return IDCompositionCompositeEffect(compositeEffect)
    }

    /**
     * Creates an instance of IDCompositionBlendEffect.
     * @returns {IDCompositionBlendEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionblendeffect">IDCompositionBlendEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionblendeffect">IDCompositionBlendEffect</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice3-createblendeffect
     */
    CreateBlendEffect() {
        result := ComCall(34, this, "ptr*", &blendEffect := 0, "HRESULT")
        return IDCompositionBlendEffect(blendEffect)
    }

    /**
     * Creates an instance of IDCompositionArithmeticCompositeEffect.
     * @returns {IDCompositionArithmeticCompositeEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionarithmeticcompositeeffect">IDCompositionArithmeticCompositeEffect</a>**</b>
     * 
     * Receives the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionarithmeticcompositeeffect">IDCompositionArithmeticCompositeEffect</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice3-createarithmeticcompositeeffect
     */
    CreateArithmeticCompositeEffect() {
        result := ComCall(35, this, "ptr*", &arithmeticCompositeEffect := 0, "HRESULT")
        return IDCompositionArithmeticCompositeEffect(arithmeticCompositeEffect)
    }

    /**
     * Creates an instance of IDCompositionAffineTransform2DEffect.
     * @returns {IDCompositionAffineTransform2DEffect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionaffinetransform2deffect">IDCompositionAffineTransform2DEffect</a>**</b>
     * 
     * Recieves the created instance of <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionaffinetransform2deffect">IDCompositionAffineTransform2DEffect</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiondevice3-createaffinetransform2deffect
     */
    CreateAffineTransform2DEffect() {
        result := ComCall(36, this, "ptr*", &affineTransform2dEffect := 0, "HRESULT")
        return IDCompositionAffineTransform2DEffect(affineTransform2dEffect)
    }
}
