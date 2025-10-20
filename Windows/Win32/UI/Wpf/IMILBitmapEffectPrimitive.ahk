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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOutput", "TransformPoint", "TransformRect", "HasAffineTransform", "HasInverseTransform", "GetAffineMatrix"]

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {IMILBitmapEffectRenderContext} pContext 
     * @param {Pointer<VARIANT_BOOL>} pfModifyInPlace 
     * @param {Pointer<IWICBitmapSource>} ppBitmapSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectprimitive-getoutput
     */
    GetOutput(uiIndex, pContext, pfModifyInPlace, ppBitmapSource) {
        result := ComCall(3, this, "uint", uiIndex, "ptr", pContext, "ptr", pfModifyInPlace, "ptr*", ppBitmapSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<MilPoint2D>} p 
     * @param {VARIANT_BOOL} fForwardTransform 
     * @param {IMILBitmapEffectRenderContext} pContext 
     * @param {Pointer<VARIANT_BOOL>} pfPointTransformed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectprimitive-transformpoint
     */
    TransformPoint(uiIndex, p, fForwardTransform, pContext, pfPointTransformed) {
        result := ComCall(4, this, "uint", uiIndex, "ptr", p, "short", fForwardTransform, "ptr", pContext, "ptr", pfPointTransformed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<MilRectD>} p 
     * @param {VARIANT_BOOL} fForwardTransform 
     * @param {IMILBitmapEffectRenderContext} pContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectprimitive-transformrect
     */
    TransformRect(uiIndex, p, fForwardTransform, pContext) {
        result := ComCall(5, this, "uint", uiIndex, "ptr", p, "short", fForwardTransform, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<VARIANT_BOOL>} pfAffine 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectprimitive-hasaffinetransform
     */
    HasAffineTransform(uiIndex, pfAffine) {
        result := ComCall(6, this, "uint", uiIndex, "ptr", pfAffine, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<VARIANT_BOOL>} pfHasInverse 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectprimitive-hasinversetransform
     */
    HasInverseTransform(uiIndex, pfHasInverse) {
        result := ComCall(7, this, "uint", uiIndex, "ptr", pfHasInverse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<MilMatrix3x2D>} pMatrix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectprimitive-getaffinematrix
     */
    GetAffineMatrix(uiIndex, pMatrix) {
        result := ComCall(8, this, "uint", uiIndex, "ptr", pMatrix, "HRESULT")
        return result
    }
}
