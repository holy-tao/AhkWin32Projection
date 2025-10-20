#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IDCompositionGaussianBlurEffect>} gaussianBlurEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-creategaussianblureffect
     */
    CreateGaussianBlurEffect(gaussianBlurEffect) {
        result := ComCall(24, this, "ptr*", gaussianBlurEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionBrightnessEffect>} brightnessEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createbrightnesseffect
     */
    CreateBrightnessEffect(brightnessEffect) {
        result := ComCall(25, this, "ptr*", brightnessEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionColorMatrixEffect>} colorMatrixEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createcolormatrixeffect
     */
    CreateColorMatrixEffect(colorMatrixEffect) {
        result := ComCall(26, this, "ptr*", colorMatrixEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionShadowEffect>} shadowEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createshadoweffect
     */
    CreateShadowEffect(shadowEffect) {
        result := ComCall(27, this, "ptr*", shadowEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionHueRotationEffect>} hueRotationEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createhuerotationeffect
     */
    CreateHueRotationEffect(hueRotationEffect) {
        result := ComCall(28, this, "ptr*", hueRotationEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionSaturationEffect>} saturationEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createsaturationeffect
     */
    CreateSaturationEffect(saturationEffect) {
        result := ComCall(29, this, "ptr*", saturationEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionTurbulenceEffect>} turbulenceEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createturbulenceeffect
     */
    CreateTurbulenceEffect(turbulenceEffect) {
        result := ComCall(30, this, "ptr*", turbulenceEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionLinearTransferEffect>} linearTransferEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createlineartransfereffect
     */
    CreateLinearTransferEffect(linearTransferEffect) {
        result := ComCall(31, this, "ptr*", linearTransferEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionTableTransferEffect>} tableTransferEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createtabletransfereffect
     */
    CreateTableTransferEffect(tableTransferEffect) {
        result := ComCall(32, this, "ptr*", tableTransferEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionCompositeEffect>} compositeEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createcompositeeffect
     */
    CreateCompositeEffect(compositeEffect) {
        result := ComCall(33, this, "ptr*", compositeEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionBlendEffect>} blendEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createblendeffect
     */
    CreateBlendEffect(blendEffect) {
        result := ComCall(34, this, "ptr*", blendEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionArithmeticCompositeEffect>} arithmeticCompositeEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createarithmeticcompositeeffect
     */
    CreateArithmeticCompositeEffect(arithmeticCompositeEffect) {
        result := ComCall(35, this, "ptr*", arithmeticCompositeEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAffineTransform2DEffect>} affineTransform2dEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevice3-createaffinetransform2deffect
     */
    CreateAffineTransform2DEffect(affineTransform2dEffect) {
        result := ComCall(36, this, "ptr*", affineTransform2dEffect, "HRESULT")
        return result
    }
}
