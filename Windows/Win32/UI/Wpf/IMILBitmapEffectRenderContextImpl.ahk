#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that define a IMILBitmapEffectRenderContext.
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectrendercontextimpl
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectRenderContextImpl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMILBitmapEffectRenderContextImpl
     * @type {Guid}
     */
    static IID => Guid("{4d25accb-797d-4fd2-b128-dffeff84fcc3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUseSoftwareRenderer", "GetTransform", "UpdateTransform", "GetOutputBounds", "UpdateOutputBounds"]

    /**
     * Gets a value that indicates whether to use software rendering.
     * @returns {VARIANT_BOOL} Type: <b>VARIANT_BOOL*</b>
     * 
     * A pointer that receives a value that indicates whether to use software rendering.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectrendercontextimpl-getusesoftwarerenderer
     */
    GetUseSoftwareRenderer() {
        result := ComCall(3, this, "short*", &pfSoftware := 0, "HRESULT")
        return pfSoftware
    }

    /**
     * Gets the matrix transform of the render context.
     * @param {Pointer<MILMatrixF>} pMatrix Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/ns-mileffects-milmatrixf">MILMatrixF</a>*</b>
     * 
     * The matrix transform of the render context.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectrendercontextimpl-gettransform
     */
    GetTransform(pMatrix) {
        result := ComCall(4, this, "ptr", pMatrix, "HRESULT")
        return result
    }

    /**
     * Updates the output transform with the new matrix.
     * @param {Pointer<MILMatrixF>} pMatrix Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/ns-mileffects-milmatrixf">MILMatrixF</a>*</b>
     * 
     * The new transform to use.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectrendercontextimpl-updatetransform
     */
    UpdateTransform(pMatrix) {
        result := ComCall(5, this, "ptr", pMatrix, "HRESULT")
        return result
    }

    /**
     * Gets the output bounds of the render context.
     * @param {Pointer<MilRectD>} pRect Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/ns-mileffects-milrectd">MIL_RECTD</a>*</b>
     * 
     * The output bounds.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectrendercontextimpl-getoutputbounds
     */
    GetOutputBounds(pRect) {
        result := ComCall(6, this, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * Updates the output bounds with the given region.
     * @param {Pointer<MilRectD>} pRect Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/ns-mileffects-milrectd">MIL_RECTD</a>*</b>
     * 
     * The new output bounds to use.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectrendercontextimpl-updateoutputbounds
     */
    UpdateOutputBounds(pRect) {
        result := ComCall(7, this, "ptr", pRect, "HRESULT")
        return result
    }
}
