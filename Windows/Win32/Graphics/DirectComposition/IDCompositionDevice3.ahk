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
     * 
     * @param {Pointer<IDCompositionGaussianBlurEffect>} gaussianBlurEffect 
     * @returns {HRESULT} 
     */
    CreateGaussianBlurEffect(gaussianBlurEffect) {
        result := ComCall(24, this, "ptr", gaussianBlurEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionBrightnessEffect>} brightnessEffect 
     * @returns {HRESULT} 
     */
    CreateBrightnessEffect(brightnessEffect) {
        result := ComCall(25, this, "ptr", brightnessEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionColorMatrixEffect>} colorMatrixEffect 
     * @returns {HRESULT} 
     */
    CreateColorMatrixEffect(colorMatrixEffect) {
        result := ComCall(26, this, "ptr", colorMatrixEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionShadowEffect>} shadowEffect 
     * @returns {HRESULT} 
     */
    CreateShadowEffect(shadowEffect) {
        result := ComCall(27, this, "ptr", shadowEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionHueRotationEffect>} hueRotationEffect 
     * @returns {HRESULT} 
     */
    CreateHueRotationEffect(hueRotationEffect) {
        result := ComCall(28, this, "ptr", hueRotationEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionSaturationEffect>} saturationEffect 
     * @returns {HRESULT} 
     */
    CreateSaturationEffect(saturationEffect) {
        result := ComCall(29, this, "ptr", saturationEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionTurbulenceEffect>} turbulenceEffect 
     * @returns {HRESULT} 
     */
    CreateTurbulenceEffect(turbulenceEffect) {
        result := ComCall(30, this, "ptr", turbulenceEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionLinearTransferEffect>} linearTransferEffect 
     * @returns {HRESULT} 
     */
    CreateLinearTransferEffect(linearTransferEffect) {
        result := ComCall(31, this, "ptr", linearTransferEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionTableTransferEffect>} tableTransferEffect 
     * @returns {HRESULT} 
     */
    CreateTableTransferEffect(tableTransferEffect) {
        result := ComCall(32, this, "ptr", tableTransferEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionCompositeEffect>} compositeEffect 
     * @returns {HRESULT} 
     */
    CreateCompositeEffect(compositeEffect) {
        result := ComCall(33, this, "ptr", compositeEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionBlendEffect>} blendEffect 
     * @returns {HRESULT} 
     */
    CreateBlendEffect(blendEffect) {
        result := ComCall(34, this, "ptr", blendEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionArithmeticCompositeEffect>} arithmeticCompositeEffect 
     * @returns {HRESULT} 
     */
    CreateArithmeticCompositeEffect(arithmeticCompositeEffect) {
        result := ComCall(35, this, "ptr", arithmeticCompositeEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAffineTransform2DEffect>} affineTransform2dEffect 
     * @returns {HRESULT} 
     */
    CreateAffineTransform2DEffect(affineTransform2dEffect) {
        result := ComCall(36, this, "ptr", affineTransform2dEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
