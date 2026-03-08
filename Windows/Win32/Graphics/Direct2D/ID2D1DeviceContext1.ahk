#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1GeometryRealization.ahk
#Include .\ID2D1DeviceContext.ahk

/**
 * Enables creation and drawing of geometry realization objects.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_2/nn-d2d1_2-id2d1devicecontext1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1DeviceContext1 extends ID2D1DeviceContext{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1DeviceContext1
     * @type {Guid}
     */
    static IID => Guid("{d37f57e4-6908-459f-a199-e72f24f79987}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 92

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFilledGeometryRealization", "CreateStrokedGeometryRealization", "DrawGeometryRealization"]

    /**
     * Creates a device-dependent representation of the fill of the geometry that can be subsequently rendered.
     * @remarks
     * This method is used in conjunction with <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_2/nf-d2d1_2-id2d1devicecontext1-drawgeometryrealization">ID2D1DeviceContext1::DrawGeometryRealization</a>. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dn280327(v=vs.85)">D2D1::ComputeFlatteningTolerance</a> helper API may be used to determine the proper flattening tolerance.
     * 
     * If the provided stroke style specifies a stroke transform type other than <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_stroke_transform_type">D2D1_STROKE_TRANSFORM_TYPE_NORMAL</a>, then the stroke will be realized assuming the identity transform and a DPI of 96.
     * @param {ID2D1Geometry} geometry Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1geometry">ID2D1Geometry</a>*</b>
     * 
     * The geometry to realize.
     * @param {Float} flatteningTolerance Type: <b>FLOAT</b>
     * 
     * The flattening tolerance to use when converting Beziers to line segments. This parameter shares the same units as the coordinates of the geometry.
     * @returns {ID2D1GeometryRealization} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_2/nn-d2d1_2-id2d1geometryrealization">ID2D1GeometryRealization</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to a new geometry realization object.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_2/nf-d2d1_2-id2d1devicecontext1-createfilledgeometryrealization
     */
    CreateFilledGeometryRealization(geometry, flatteningTolerance) {
        result := ComCall(92, this, "ptr", geometry, "float", flatteningTolerance, "ptr*", &geometryRealization := 0, "HRESULT")
        return ID2D1GeometryRealization(geometryRealization)
    }

    /**
     * Creates a device-dependent representation of the stroke of a geometry that can be subsequently rendered.
     * @remarks
     * This method is used in conjunction with <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_2/nf-d2d1_2-id2d1devicecontext1-drawgeometryrealization">ID2D1DeviceContext1::DrawGeometryRealization</a>. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dn280327(v=vs.85)">D2D1::ComputeFlatteningTolerance</a> helper API may be used to determine the proper flattening tolerance.
     * 
     * If the provided stroke style specifies a stroke transform type other than <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_stroke_transform_type">D2D1_STROKE_TRANSFORM_TYPE_NORMAL</a>, then the stroke will be realized assuming the identity transform and a DPI of 96.
     * @param {ID2D1Geometry} geometry Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1geometry">ID2D1Geometry</a>*</b>
     * 
     * The geometry to realize.
     * @param {Float} flatteningTolerance Type: <b>FLOAT </b>
     * 
     * The flattening tolerance to use when converting Beziers to line segments. This parameter shares the same units as the coordinates of the geometry.
     * @param {Float} strokeWidth Type: <b>FLOAT </b>
     * 
     * The width of the stroke. This parameter shares the same units as the coordinates of the geometry.
     * @param {ID2D1StrokeStyle} strokeStyle Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1strokestyle">ID2D1StrokeStyle</a>*</b>
     * 
     * The stroke style (optional).
     * @returns {ID2D1GeometryRealization} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_2/nn-d2d1_2-id2d1geometryrealization">ID2D1GeometryRealization</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to a new geometry realization object.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_2/nf-d2d1_2-id2d1devicecontext1-createstrokedgeometryrealization
     */
    CreateStrokedGeometryRealization(geometry, flatteningTolerance, strokeWidth, strokeStyle) {
        result := ComCall(93, this, "ptr", geometry, "float", flatteningTolerance, "float", strokeWidth, "ptr", strokeStyle, "ptr*", &geometryRealization := 0, "HRESULT")
        return ID2D1GeometryRealization(geometryRealization)
    }

    /**
     * Renders a given geometry realization to the target with the specified brush.
     * @remarks
     * This method respects all currently set state (transform, DPI, unit mode, target image, clips, layers); 
     *         however, artifacts such as faceting may appear when rendering the realizations with a large effective scale (either via the transform or the DPI). 
     *         Callers should create their realizations with an appropriate flattening tolerance using either <a href="https://docs.microsoft.com/windows/desktop/Direct2D/direct2d-constants">D2D1_DEFAULT_FLATTENING_TOLERANCE</a> 
     *         or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dn280327(v=vs.85)">ComputeFlatteningTolerance</a> to compensate for this.
     *       
     * 
     * Additionally, callers should be aware of the safe render bounds when creating geometry realizations. 
     *       If a geometry extends outside of [-524,287, 524,287] DIPs in either the X- or the Y- direction in its original (pre-transform) coordinate space, 
     *       then it may be clipped to those bounds when it is realized. This clipping will be visible even if the realization is subsequently transformed to fit within the safe render bounds.
     * @param {ID2D1GeometryRealization} geometryRealization Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_2/nn-d2d1_2-id2d1geometryrealization">ID2D1GeometryRealization</a>*</b>
     * 
     * The geometry realization to be rendered.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush to render the realization with.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_2/nf-d2d1_2-id2d1devicecontext1-drawgeometryrealization
     */
    DrawGeometryRealization(geometryRealization, brush) {
        ComCall(94, this, "ptr", geometryRealization, "ptr", brush)
    }
}
