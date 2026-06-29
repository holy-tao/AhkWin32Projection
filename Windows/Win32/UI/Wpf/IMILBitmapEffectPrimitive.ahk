#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Graphics\Imaging\IWICBitmapSource.ahk" { IWICBitmapSource }
#Import "..\..\Graphics\Dwm\MilMatrix3x2D.ahk" { MilMatrix3x2D }
#Import ".\MilPoint2D.ahk" { MilPoint2D }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MilRectD.ahk" { MilRectD }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IMILBitmapEffectRenderContext.ahk" { IMILBitmapEffectRenderContext }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that create a bitmap effect's output. This interface must be implemented to create third party Windows Presentation Foundation (WPF) bitmap effects.
 * @remarks
 * Effect clients, in general, should interact with the outer <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffect">IMILBitmapEffect</a> object rather than the <b>IMILBitmapEffectPrimitive</b> object.
 *             If the client needs to interact with the <b>IMILBitmapEffectPrimitive</b> directly the client will need to implement <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectconnections">IMILBitmapEffectConnections</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectconnectionsinfo">IMILBitmapEffectConnectionsInfo</a>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectconnectorinfo">IMILBitmapEffectConnectorInfo</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/nn-mileffects-imilbitmapeffectprimitive
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct IMILBitmapEffectPrimitive extends IUnknown {
    /**
     * The interface identifier for IMILBitmapEffectPrimitive
     * @type {Guid}
     */
    static IID := Guid("{67e31025-3091-4dfc-98d6-dd494551461d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMILBitmapEffectPrimitive interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetOutput           : IntPtr
        TransformPoint      : IntPtr
        TransformRect       : IntPtr
        HasAffineTransform  : IntPtr
        HasInverseTransform : IntPtr
        GetAffineMatrix     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMILBitmapEffectPrimitive.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Performs pixel processing for the bitmap effect.
     * @remarks
     * If <i>pfModifyInPlace</i> is VARIANT_TRUE, the input image may be modified and returned.
     *             If the custom effect does not support in place modifications, set <i>pfModifyInPlace</i> to VARIANT_FALSE to indicate a new image was created.
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
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectprimitive-getoutput
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
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectprimitive-transformpoint
     */
    TransformPoint(uiIndex, p, fForwardTransform, pContext) {
        result := ComCall(4, this, "uint", uiIndex, MilPoint2D.Ptr, p, VARIANT_BOOL, fForwardTransform, "ptr", pContext, VARIANT_BOOL.Ptr, &pfPointTransformed := 0, "HRESULT")
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectprimitive-transformrect
     */
    TransformRect(uiIndex, p, fForwardTransform, pContext) {
        result := ComCall(5, this, "uint", uiIndex, MilRectD.Ptr, p, VARIANT_BOOL, fForwardTransform, "ptr", pContext, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectprimitive-hasaffinetransform
     */
    HasAffineTransform(uiIndex) {
        result := ComCall(6, this, "uint", uiIndex, VARIANT_BOOL.Ptr, &pfAffine := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectprimitive-hasinversetransform
     */
    HasInverseTransform(uiIndex) {
        result := ComCall(7, this, "uint", uiIndex, VARIANT_BOOL.Ptr, &pfHasInverse := 0, "HRESULT")
        return pfHasInverse
    }

    /**
     * Retrieves the affine transformation matrix for the effect.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * A zero based index value indicating the output pin through which to retrieve the affine matrix.
     * @param {Pointer<MilMatrix3x2D>} pMatrix Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/ns-mileffects-milmatrix3x2d">MIL_MATRIX3X2D</a>*</b>
     * 
     * When this method returns, contains a pointer to the affine matrix describing the effects transform.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectprimitive-getaffinematrix
     */
    GetAffineMatrix(uiIndex, pMatrix) {
        result := ComCall(8, this, "uint", uiIndex, MilMatrix3x2D.Ptr, pMatrix, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMILBitmapEffectPrimitive.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOutput := CallbackCreate(GetMethod(implObj, "GetOutput"), flags, 5)
        this.vtbl.TransformPoint := CallbackCreate(GetMethod(implObj, "TransformPoint"), flags, 6)
        this.vtbl.TransformRect := CallbackCreate(GetMethod(implObj, "TransformRect"), flags, 5)
        this.vtbl.HasAffineTransform := CallbackCreate(GetMethod(implObj, "HasAffineTransform"), flags, 3)
        this.vtbl.HasInverseTransform := CallbackCreate(GetMethod(implObj, "HasInverseTransform"), flags, 3)
        this.vtbl.GetAffineMatrix := CallbackCreate(GetMethod(implObj, "GetAffineMatrix"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOutput)
        CallbackFree(this.vtbl.TransformPoint)
        CallbackFree(this.vtbl.TransformRect)
        CallbackFree(this.vtbl.HasAffineTransform)
        CallbackFree(this.vtbl.HasInverseTransform)
        CallbackFree(this.vtbl.GetAffineMatrix)
    }
}
