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
     * 
     * @param {Pointer<VARIANT_BOOL>} pfSoftware 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontextimpl-getusesoftwarerenderer
     */
    GetUseSoftwareRenderer(pfSoftware) {
        result := ComCall(3, this, "ptr", pfSoftware, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MILMatrixF>} pMatrix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontextimpl-gettransform
     */
    GetTransform(pMatrix) {
        result := ComCall(4, this, "ptr", pMatrix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MILMatrixF>} pMatrix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontextimpl-updatetransform
     */
    UpdateTransform(pMatrix) {
        result := ComCall(5, this, "ptr", pMatrix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MilRectD>} pRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontextimpl-getoutputbounds
     */
    GetOutputBounds(pRect) {
        result := ComCall(6, this, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MilRectD>} pRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontextimpl-updateoutputbounds
     */
    UpdateOutputBounds(pRect) {
        result := ComCall(7, this, "ptr", pRect, "HRESULT")
        return result
    }
}
