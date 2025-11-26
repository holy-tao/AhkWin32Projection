#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MILMatrixF.ahk
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
     * Sets the output pixel format.
     * @param {Pointer<Guid>} format Type: <b>REFWICPixelFormatGUID</b>
     * 
     * The GUID of the output pixel format.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectrendercontext-setoutputpixelformat
     */
    SetOutputPixelFormat(format) {
        result := ComCall(3, this, "ptr", format, "HRESULT")
        return result
    }

    /**
     * Gets the output pixel format GUID.
     * @returns {Guid} Type: <b>WICPixelFormatGUID*</b>
     * 
     * The output pixel format GUID
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectrendercontext-getoutputpixelformat
     */
    GetOutputPixelFormat() {
        pFormat := Guid()
        result := ComCall(4, this, "ptr", pFormat, "HRESULT")
        return pFormat
    }

    /**
     * Sets a value to indicate whether to use software rendering.
     * @param {VARIANT_BOOL} fSoftware Type: <b>VARIANT_BOOL</b>
     * 
     * A value indicating whether to use software rendering.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectrendercontext-setusesoftwarerenderer
     */
    SetUseSoftwareRenderer(fSoftware) {
        result := ComCall(5, this, "short", fSoftware, "HRESULT")
        return result
    }

    /**
     * Gets the initial MILMatrixF transform.
     * @param {Pointer<MILMatrixF>} pMatrix Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/ns-mileffects-milmatrixf">MILMatrixF</a>*</b>
     * 
     * The initial transform.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectrendercontext-setinitialtransform
     */
    SetInitialTransform(pMatrix) {
        result := ComCall(6, this, "ptr", pMatrix, "HRESULT")
        return result
    }

    /**
     * Gets the final MILMatrixF transform.
     * @returns {MILMatrixF} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/ns-mileffects-milmatrixf">MILMatrixF</a>*</b>
     * 
     * The final transform.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectrendercontext-getfinaltransform
     */
    GetFinalTransform() {
        pMatrix := MILMatrixF()
        result := ComCall(7, this, "ptr", pMatrix, "HRESULT")
        return pMatrix
    }

    /**
     * Sets the output dots per inch (dpi).
     * @param {Float} dblDpiX Type: <b>double</b>
     * 
     * The horizontal resolution.
     * @param {Float} dblDpiY Type: <b>double</b>
     * 
     * The vertical resolution.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectrendercontext-setoutputdpi
     */
    SetOutputDPI(dblDpiX, dblDpiY) {
        result := ComCall(8, this, "double", dblDpiX, "double", dblDpiY, "HRESULT")
        return result
    }

    /**
     * Gets the output dots per inch (dpi).
     * @param {Pointer<Float>} pdblDpiX Type: <b>double*</b>
     * 
     * A pointer that receives the horizontal resolution.
     * @param {Pointer<Float>} pdblDpiY Type: <b>double*</b>
     * 
     * A pointer that receives the vertical resolution.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectrendercontext-getoutputdpi
     */
    GetOutputDPI(pdblDpiX, pdblDpiY) {
        pdblDpiXMarshal := pdblDpiX is VarRef ? "double*" : "ptr"
        pdblDpiYMarshal := pdblDpiY is VarRef ? "double*" : "ptr"

        result := ComCall(9, this, pdblDpiXMarshal, pdblDpiX, pdblDpiYMarshal, pdblDpiY, "HRESULT")
        return result
    }

    /**
     * Sets the region of interest for the effect.
     * @param {Pointer<MilRectD>} pRect Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/ns-mileffects-milrectd">MIL_RECTD</a>*</b>
     * 
     * The region of interest.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectrendercontext-setregionofinterest
     */
    SetRegionOfInterest(pRect) {
        result := ComCall(10, this, "ptr", pRect, "HRESULT")
        return result
    }
}
