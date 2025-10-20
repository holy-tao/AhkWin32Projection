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
     * 
     * @param {Pointer<VARIANT_BOOL>} pfSoftware 
     * @returns {HRESULT} 
     */
    GetUseSoftwareRenderer(pfSoftware) {
        result := ComCall(3, this, "ptr", pfSoftware, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MILMatrixF>} pMatrix 
     * @returns {HRESULT} 
     */
    GetTransform(pMatrix) {
        result := ComCall(4, this, "ptr", pMatrix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MILMatrixF>} pMatrix 
     * @returns {HRESULT} 
     */
    UpdateTransform(pMatrix) {
        result := ComCall(5, this, "ptr", pMatrix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MilRectD>} pRect 
     * @returns {HRESULT} 
     */
    GetOutputBounds(pRect) {
        result := ComCall(6, this, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MilRectD>} pRect 
     * @returns {HRESULT} 
     */
    UpdateOutputBounds(pRect) {
        result := ComCall(7, this, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
