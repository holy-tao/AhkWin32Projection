#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Resource.ahk

/**
 * Represents a geometry resource and defines a set of helper methods for manipulating and measuring geometric shapes. Interfaces that inherit from ID2D1Geometry define specific shapes.
 * @remarks
 * 
  * There are several types of Direct2D geometry objects:  a  simple geometry (<a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1rectanglegeometry">ID2D1RectangleGeometry</a>, <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1roundedrectanglegeometry">ID2D1RoundedRectangleGeometry</a>, or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1ellipsegeometry">ID2D1EllipseGeometry</a>), a path geometry (<a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1pathgeometry">ID2D1PathGeometry</a>), or a composite geometry (<a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1geometrygroup">ID2D1GeometryGroup</a> and <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1transformedgeometry">ID2D1TransformedGeometry</a>).
  * 
  *  Direct2D geometries enable you to  describe two-dimensional figures and also offer  many uses, such as defining  hit-test regions,  clip regions, and even   animation paths.
  * 
  * Direct2D geometries are immutable and device-independent resources created by <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a>.  In general, you should create geometries once and retain them for the life of the application, or until they need to be modified. For more information about device-independent and device-dependent resources, see  the <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1geometry
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Geometry extends ID2D1Resource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Geometry
     * @type {Guid}
     */
    static IID => Guid("{2cd906a1-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBounds", "GetWidenedBounds", "StrokeContainsPoint", "FillContainsPoint", "CompareWithGeometry", "Simplify", "Tessellate", "CombineWithGeometry", "Outline", "ComputeArea", "ComputeLength", "ComputePointAtLength", "Widen"]

    /**
     * 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Pointer<D2D_RECT_F>} bounds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-getbounds
     */
    GetBounds(worldTransform, bounds) {
        result := ComCall(4, this, "ptr", worldTransform, "ptr", bounds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} strokeWidth 
     * @param {ID2D1StrokeStyle} strokeStyle 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @param {Pointer<D2D_RECT_F>} bounds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-getwidenedbounds
     */
    GetWidenedBounds(strokeWidth, strokeStyle, worldTransform, flatteningTolerance, bounds) {
        result := ComCall(5, this, "float", strokeWidth, "ptr", strokeStyle, "ptr", worldTransform, "float", flatteningTolerance, "ptr", bounds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {D2D_POINT_2F} point 
     * @param {Float} strokeWidth 
     * @param {ID2D1StrokeStyle} strokeStyle 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @param {Pointer<BOOL>} contains_R 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-strokecontainspoint
     */
    StrokeContainsPoint(point, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, contains_R) {
        result := ComCall(6, this, "ptr", point, "float", strokeWidth, "ptr", strokeStyle, "ptr", worldTransform, "float", flatteningTolerance, "ptr", contains_R, "HRESULT")
        return result
    }

    /**
     * 
     * @param {D2D_POINT_2F} point 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @param {Pointer<BOOL>} contains_R 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-fillcontainspoint
     */
    FillContainsPoint(point, worldTransform, flatteningTolerance, contains_R) {
        result := ComCall(7, this, "ptr", point, "ptr", worldTransform, "float", flatteningTolerance, "ptr", contains_R, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1Geometry} inputGeometry 
     * @param {Pointer<D2D_MATRIX_3X2_F>} inputGeometryTransform 
     * @param {Float} flatteningTolerance 
     * @param {Pointer<Integer>} relation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-comparewithgeometry
     */
    CompareWithGeometry(inputGeometry, inputGeometryTransform, flatteningTolerance, relation) {
        relationMarshal := relation is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "ptr", inputGeometry, "ptr", inputGeometryTransform, "float", flatteningTolerance, relationMarshal, relation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} simplificationOption 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @param {ID2D1SimplifiedGeometrySink} geometrySink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-simplify
     */
    Simplify(simplificationOption, worldTransform, flatteningTolerance, geometrySink) {
        result := ComCall(9, this, "int", simplificationOption, "ptr", worldTransform, "float", flatteningTolerance, "ptr", geometrySink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @param {ID2D1TessellationSink} tessellationSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-tessellate
     */
    Tessellate(worldTransform, flatteningTolerance, tessellationSink) {
        result := ComCall(10, this, "ptr", worldTransform, "float", flatteningTolerance, "ptr", tessellationSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1Geometry} inputGeometry 
     * @param {Integer} combineMode 
     * @param {Pointer<D2D_MATRIX_3X2_F>} inputGeometryTransform 
     * @param {Float} flatteningTolerance 
     * @param {ID2D1SimplifiedGeometrySink} geometrySink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-combinewithgeometry
     */
    CombineWithGeometry(inputGeometry, combineMode, inputGeometryTransform, flatteningTolerance, geometrySink) {
        result := ComCall(11, this, "ptr", inputGeometry, "int", combineMode, "ptr", inputGeometryTransform, "float", flatteningTolerance, "ptr", geometrySink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @param {ID2D1SimplifiedGeometrySink} geometrySink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-outline
     */
    Outline(worldTransform, flatteningTolerance, geometrySink) {
        result := ComCall(12, this, "ptr", worldTransform, "float", flatteningTolerance, "ptr", geometrySink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @param {Pointer<Float>} area 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-computearea
     */
    ComputeArea(worldTransform, flatteningTolerance, area) {
        areaMarshal := area is VarRef ? "float*" : "ptr"

        result := ComCall(13, this, "ptr", worldTransform, "float", flatteningTolerance, areaMarshal, area, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @param {Pointer<Float>} length 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-computelength
     */
    ComputeLength(worldTransform, flatteningTolerance, length) {
        lengthMarshal := length is VarRef ? "float*" : "ptr"

        result := ComCall(14, this, "ptr", worldTransform, "float", flatteningTolerance, lengthMarshal, length, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} length 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @param {Pointer<D2D_POINT_2F>} point 
     * @param {Pointer<D2D_POINT_2F>} unitTangentVector 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-computepointatlength
     */
    ComputePointAtLength(length, worldTransform, flatteningTolerance, point, unitTangentVector) {
        result := ComCall(15, this, "float", length, "ptr", worldTransform, "float", flatteningTolerance, "ptr", point, "ptr", unitTangentVector, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} strokeWidth 
     * @param {ID2D1StrokeStyle} strokeStyle 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @param {ID2D1SimplifiedGeometrySink} geometrySink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-widen
     */
    Widen(strokeWidth, strokeStyle, worldTransform, flatteningTolerance, geometrySink) {
        result := ComCall(16, this, "float", strokeWidth, "ptr", strokeStyle, "ptr", worldTransform, "float", flatteningTolerance, "ptr", geometrySink, "HRESULT")
        return result
    }
}
