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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOutputPixelFormat", "GetOutputPixelFormat", "SetUseSoftwareRenderer", "SetInitialTransform", "GetFinalTransform", "SetOutputDPI", "GetOutputDPI", "SetRegionOfInterest"]

    /**
     * 
     * @param {Pointer<Guid>} format 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontext-setoutputpixelformat
     */
    SetOutputPixelFormat(format) {
        result := ComCall(3, this, "ptr", format, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontext-getoutputpixelformat
     */
    GetOutputPixelFormat(pFormat) {
        result := ComCall(4, this, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fSoftware 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontext-setusesoftwarerenderer
     */
    SetUseSoftwareRenderer(fSoftware) {
        result := ComCall(5, this, "short", fSoftware, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MILMatrixF>} pMatrix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontext-setinitialtransform
     */
    SetInitialTransform(pMatrix) {
        result := ComCall(6, this, "ptr", pMatrix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MILMatrixF>} pMatrix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontext-getfinaltransform
     */
    GetFinalTransform(pMatrix) {
        result := ComCall(7, this, "ptr", pMatrix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} dblDpiX 
     * @param {Float} dblDpiY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontext-setoutputdpi
     */
    SetOutputDPI(dblDpiX, dblDpiY) {
        result := ComCall(8, this, "double", dblDpiX, "double", dblDpiY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdblDpiX 
     * @param {Pointer<Float>} pdblDpiY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontext-getoutputdpi
     */
    GetOutputDPI(pdblDpiX, pdblDpiY) {
        result := ComCall(9, this, "double*", pdblDpiX, "double*", pdblDpiY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MilRectD>} pRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontext-setregionofinterest
     */
    SetRegionOfInterest(pRect) {
        result := ComCall(10, this, "ptr", pRect, "HRESULT")
        return result
    }
}
