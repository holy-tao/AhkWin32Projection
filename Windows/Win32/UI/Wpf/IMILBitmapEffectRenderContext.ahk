#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that define a IMILBitmapEffectRenderContext object.
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectrendercontext
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectRenderContext extends IUnknown{
    /**
     * The interface identifier for IMILBitmapEffectRenderContext
     * @type {Guid}
     */
    static IID => Guid("{12a2ec7e-2d33-44b2-b334-1abb7846e390}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} format 
     * @returns {HRESULT} 
     */
    SetOutputPixelFormat(format) {
        result := ComCall(3, this, "ptr", format, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pFormat 
     * @returns {HRESULT} 
     */
    GetOutputPixelFormat(pFormat) {
        result := ComCall(4, this, "ptr", pFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fSoftware 
     * @returns {HRESULT} 
     */
    SetUseSoftwareRenderer(fSoftware) {
        result := ComCall(5, this, "short", fSoftware, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MILMatrixF>} pMatrix 
     * @returns {HRESULT} 
     */
    SetInitialTransform(pMatrix) {
        result := ComCall(6, this, "ptr", pMatrix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MILMatrixF>} pMatrix 
     * @returns {HRESULT} 
     */
    GetFinalTransform(pMatrix) {
        result := ComCall(7, this, "ptr", pMatrix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} dblDpiX 
     * @param {Float} dblDpiY 
     * @returns {HRESULT} 
     */
    SetOutputDPI(dblDpiX, dblDpiY) {
        result := ComCall(8, this, "double", dblDpiX, "double", dblDpiY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdblDpiX 
     * @param {Pointer<Double>} pdblDpiY 
     * @returns {HRESULT} 
     */
    GetOutputDPI(pdblDpiX, pdblDpiY) {
        result := ComCall(9, this, "double*", pdblDpiX, "double*", pdblDpiY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MilRectD>} pRect 
     * @returns {HRESULT} 
     */
    SetRegionOfInterest(pRect) {
        result := ComCall(10, this, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
