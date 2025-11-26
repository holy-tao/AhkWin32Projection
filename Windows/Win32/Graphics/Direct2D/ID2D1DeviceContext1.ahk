#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1GeometryRealization.ahk
#Include .\ID2D1DeviceContext.ahk

/**
 * Enables creation and drawing of geometry realization objects.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_2/nn-d2d1_2-id2d1devicecontext1
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
     * @param {ID2D1Geometry} geometry Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1geometry">ID2D1Geometry</a>*</b>
     * 
     * The geometry to realize.
     * @param {Float} flatteningTolerance Type: <b>FLOAT</b>
     * 
     * The flattening tolerance to use when converting Beziers to line segments. This parameter shares the same units as the coordinates of the geometry.
     * @returns {ID2D1GeometryRealization} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_2/nn-d2d1_2-id2d1geometryrealization">ID2D1GeometryRealization</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to a new geometry realization object.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_2/nf-d2d1_2-id2d1devicecontext1-createfilledgeometryrealization
     */
    CreateFilledGeometryRealization(geometry, flatteningTolerance) {
        result := ComCall(92, this, "ptr", geometry, "float", flatteningTolerance, "ptr*", &geometryRealization := 0, "HRESULT")
        return ID2D1GeometryRealization(geometryRealization)
    }

    /**
     * Creates a device-dependent representation of the stroke of a geometry that can be subsequently rendered.
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
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_2/nf-d2d1_2-id2d1devicecontext1-createstrokedgeometryrealization
     */
    CreateStrokedGeometryRealization(geometry, flatteningTolerance, strokeWidth, strokeStyle) {
        result := ComCall(93, this, "ptr", geometry, "float", flatteningTolerance, "float", strokeWidth, "ptr", strokeStyle, "ptr*", &geometryRealization := 0, "HRESULT")
        return ID2D1GeometryRealization(geometryRealization)
    }

    /**
     * Renders a given geometry realization to the target with the specified brush.
     * @param {ID2D1GeometryRealization} geometryRealization Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_2/nn-d2d1_2-id2d1geometryrealization">ID2D1GeometryRealization</a>*</b>
     * 
     * The geometry realization to be rendered.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush to render the realization with.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_2/nf-d2d1_2-id2d1devicecontext1-drawgeometryrealization
     */
    DrawGeometryRealization(geometryRealization, brush) {
        ComCall(94, this, "ptr", geometryRealization, "ptr", brush)
    }
}
