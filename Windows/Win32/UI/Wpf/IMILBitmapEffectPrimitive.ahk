#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that create a bitmap effect's output. This interface must be implemented to create third party Windows Presentation Foundation (WPF) bitmap effects.
 * @remarks
 * 
  * Effect clients, in general, should interact with the outer <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffect">IMILBitmapEffect</a> object rather than the <b>IMILBitmapEffectPrimitive</b> object.
  *             If the client needs to interact with the <b>IMILBitmapEffectPrimitive</b> directly the client will need to implement <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectconnections">IMILBitmapEffectConnections</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectconnectionsinfo">IMILBitmapEffectConnectionsInfo</a>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectconnectorinfo">IMILBitmapEffectConnectorInfo</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectprimitive
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectPrimitive extends IUnknown{
    /**
     * The interface identifier for IMILBitmapEffectPrimitive
     * @type {Guid}
     */
    static IID => Guid("{67e31025-3091-4dfc-98d6-dd494551461d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<IMILBitmapEffectRenderContext>} pContext 
     * @param {Pointer<VARIANT_BOOL>} pfModifyInPlace 
     * @param {Pointer<IWICBitmapSource>} ppBitmapSource 
     * @returns {HRESULT} 
     */
    GetOutput(uiIndex, pContext, pfModifyInPlace, ppBitmapSource) {
        result := ComCall(3, this, "uint", uiIndex, "ptr", pContext, "ptr", pfModifyInPlace, "ptr", ppBitmapSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<MilPoint2D>} p 
     * @param {VARIANT_BOOL} fForwardTransform 
     * @param {Pointer<IMILBitmapEffectRenderContext>} pContext 
     * @param {Pointer<VARIANT_BOOL>} pfPointTransformed 
     * @returns {HRESULT} 
     */
    TransformPoint(uiIndex, p, fForwardTransform, pContext, pfPointTransformed) {
        result := ComCall(4, this, "uint", uiIndex, "ptr", p, "short", fForwardTransform, "ptr", pContext, "ptr", pfPointTransformed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<MilRectD>} p 
     * @param {VARIANT_BOOL} fForwardTransform 
     * @param {Pointer<IMILBitmapEffectRenderContext>} pContext 
     * @returns {HRESULT} 
     */
    TransformRect(uiIndex, p, fForwardTransform, pContext) {
        result := ComCall(5, this, "uint", uiIndex, "ptr", p, "short", fForwardTransform, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<VARIANT_BOOL>} pfAffine 
     * @returns {HRESULT} 
     */
    HasAffineTransform(uiIndex, pfAffine) {
        result := ComCall(6, this, "uint", uiIndex, "ptr", pfAffine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<VARIANT_BOOL>} pfHasInverse 
     * @returns {HRESULT} 
     */
    HasInverseTransform(uiIndex, pfHasInverse) {
        result := ComCall(7, this, "uint", uiIndex, "ptr", pfHasInverse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<MilMatrix3x2D>} pMatrix 
     * @returns {HRESULT} 
     */
    GetAffineMatrix(uiIndex, pMatrix) {
        result := ComCall(8, this, "uint", uiIndex, "ptr", pMatrix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
