#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Imaging\IWICBitmapSource.ahk
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
     * Performs pixel processing for the bitmap effect.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * A zero based index value indicating which output pin to use for output.
     * @param {IMILBitmapEffectRenderContext} pContext Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectrendercontext">IMILBitmapEffectRenderContext</a>*</b>
     * 
     * The render context to use to determine how the effect should be rendered.
     * @param {Pointer<VARIANT_BOOL>} pfModifyInPlace Type: <b>VARIANT_BOOL*</b>
     * 
     * A value that indicates whether the effect should attempt to modify the input image in place.
     * @returns {IWICBitmapSource} Type: <b>IWICBitmapSource**</b>
     * 
     * When this method returns, contains a pointer to the effect output.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectprimitive-getoutput
     */
    GetOutput(uiIndex, pContext, pfModifyInPlace) {
        pfModifyInPlaceMarshal := pfModifyInPlace is VarRef ? "short*" : "ptr"

        result := ComCall(3, this, "uint", uiIndex, "ptr", pContext, pfModifyInPlaceMarshal, pfModifyInPlace, "ptr*", &ppBitmapSource := 0, "HRESULT")
        return IWICBitmapSource(ppBitmapSource)
    }

    /**
     * Transforms the given point.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * A zero based index value indicating the output pin through which to transform the point.
     * @param {Pointer<MilPoint2D>} p Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/ns-mileffects-milpoint2d">MIL_2DPOINTD</a>*</b>
     * 
     * A pointer to the point to transform.
     * @param {VARIANT_BOOL} fForwardTransform Type: <b>VARIANT_BOOL</b>
     * 
     * A value indicating whether the point is being transformed from front to back in the effects graph.
     * @param {IMILBitmapEffectRenderContext} pContext Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectrendercontext">IMILBitmapEffectRenderContext</a>*</b>
     * 
     * The render context to use for the transformation.
     * @returns {VARIANT_BOOL} Type: <b>VARIANT_BOOL*</b>
     * 
     * When this method returns, contains a value indicating whether the point transformed to a known location.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectprimitive-transformpoint
     */
    TransformPoint(uiIndex, p, fForwardTransform, pContext) {
        result := ComCall(4, this, "uint", uiIndex, "ptr", p, "short", fForwardTransform, "ptr", pContext, "short*", &pfPointTransformed := 0, "HRESULT")
        return pfPointTransformed
    }

    /**
     * Transforms the output of the given rectangle.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * A zero based index value indicating the output pin through which to transform the rectangle.
     * @param {Pointer<MilRectD>} p Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/ns-mileffects-milrectd">MIL_RECTD</a>*</b>
     * 
     * A pointer to the rectangle to transform.
     * @param {VARIANT_BOOL} fForwardTransform Type: <b>VARIANT_BOOL</b>
     * 
     * A value indicating whether the rectangle is being transformed from front to back in the effects graph.
     * @param {IMILBitmapEffectRenderContext} pContext Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectrendercontext">IMILBitmapEffectRenderContext</a>*</b>
     * 
     * The render context to use for the transformation.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectprimitive-transformrect
     */
    TransformRect(uiIndex, p, fForwardTransform, pContext) {
        result := ComCall(5, this, "uint", uiIndex, "ptr", p, "short", fForwardTransform, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * Determines whether the effect has an affine transform.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * A zero based index value indicating the output pin through which to query.
     * @returns {VARIANT_BOOL} Type: <b>VARIANT_BOOL*</b>
     * 
     * When this method returns, contains a value indicating whether the effect has an affine transform.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectprimitive-hasaffinetransform
     */
    HasAffineTransform(uiIndex) {
        result := ComCall(6, this, "uint", uiIndex, "short*", &pfAffine := 0, "HRESULT")
        return pfAffine
    }

    /**
     * Determines whether the effect has an inverse transform.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * A zero based index value indicating the output pin through which to query.
     * @returns {VARIANT_BOOL} Type: <b>VARIANT_BOOL*</b>
     * 
     * When this method returns, contains a value indicating whether the effect has an inverse transform.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectprimitive-hasinversetransform
     */
    HasInverseTransform(uiIndex) {
        result := ComCall(7, this, "uint", uiIndex, "short*", &pfHasInverse := 0, "HRESULT")
        return pfHasInverse
    }

    /**
     * Retrieves the affine transormation matrix for the effect.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * A zero based index value indicating the output pin through which to retrieve the affine matrix.
     * @param {Pointer<MilMatrix3x2D>} pMatrix Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/ns-mileffects-milmatrix3x2d">MIL_MATRIX3X2D</a>*</b>
     * 
     * When this method returns, contains a pointer to the affine matrix describing the effects transform.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectprimitive-getaffinematrix
     */
    GetAffineMatrix(uiIndex, pMatrix) {
        result := ComCall(8, this, "uint", uiIndex, "ptr", pMatrix, "HRESULT")
        return result
    }
}
