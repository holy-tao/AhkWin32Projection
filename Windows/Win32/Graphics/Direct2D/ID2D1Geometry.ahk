#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D2D1_GEOMETRY_SIMPLIFICATION_OPTION.ahk" { D2D1_GEOMETRY_SIMPLIFICATION_OPTION }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }
#Import "Common\D2D_RECT_F.ahk" { D2D_RECT_F }
#Import "Common\D2D_POINT_2F.ahk" { D2D_POINT_2F }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D2D1_COMBINE_MODE.ahk" { D2D1_COMBINE_MODE }
#Import ".\D2D1_GEOMETRY_RELATION.ahk" { D2D1_GEOMETRY_RELATION }
#Import "Common\ID2D1SimplifiedGeometrySink.ahk" { ID2D1SimplifiedGeometrySink }
#Import ".\ID2D1TessellationSink.ahk" { ID2D1TessellationSink }
#Import "Common\D2D_MATRIX_3X2_F.ahk" { D2D_MATRIX_3X2_F }
#Import ".\ID2D1StrokeStyle.ahk" { ID2D1StrokeStyle }

/**
 * Represents a geometry resource and defines a set of helper methods for manipulating and measuring geometric shapes. Interfaces that inherit from ID2D1Geometry define specific shapes.
 * @remarks
 * There are several types of Direct2D geometry objects:  a  simple geometry (<a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1rectanglegeometry">ID2D1RectangleGeometry</a>, <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1roundedrectanglegeometry">ID2D1RoundedRectangleGeometry</a>, or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1ellipsegeometry">ID2D1EllipseGeometry</a>), a path geometry (<a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1pathgeometry">ID2D1PathGeometry</a>), or a composite geometry (<a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1geometrygroup">ID2D1GeometryGroup</a> and <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1transformedgeometry">ID2D1TransformedGeometry</a>).
 * 
 *  Direct2D geometries enable you to  describe two-dimensional figures and also offer  many uses, such as defining  hit-test regions,  clip regions, and even   animation paths.
 * 
 * Direct2D geometries are immutable and device-independent resources created by <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a>.  In general, you should create geometries once and retain them for the life of the application, or until they need to be modified. For more information about device-independent and device-dependent resources, see  the <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1geometry
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1Geometry extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1Geometry
     * @type {Guid}
     */
    static IID := Guid("{2cd906a1-12e2-11dc-9fed-001143a055f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1Geometry interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
        GetBounds            : IntPtr
        GetWidenedBounds     : IntPtr
        StrokeContainsPoint  : IntPtr
        FillContainsPoint    : IntPtr
        CompareWithGeometry  : IntPtr
        Simplify             : IntPtr
        Tessellate           : IntPtr
        CombineWithGeometry  : IntPtr
        Outline              : IntPtr
        ComputeArea          : IntPtr
        ComputeLength        : IntPtr
        ComputePointAtLength : IntPtr
        Widen                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1Geometry.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the bounds of the geometry.
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @returns {D2D_RECT_F} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-getbounds
     */
    GetBounds(worldTransform) {
        bounds := D2D_RECT_F()
        result := ComCall(4, this, D2D_MATRIX_3X2_F.Ptr, worldTransform, D2D_RECT_F.Ptr, bounds, "HRESULT")
        return bounds
    }

    /**
     * Gets the bounds of the geometry after it has been widened by the specified stroke width and style and transformed by the specified matrix.
     * @param {Float} strokeWidth 
     * @param {ID2D1StrokeStyle} strokeStyle 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @returns {D2D_RECT_F} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-getwidenedbounds
     */
    GetWidenedBounds(strokeWidth, strokeStyle, worldTransform, flatteningTolerance) {
        bounds := D2D_RECT_F()
        result := ComCall(5, this, "float", strokeWidth, "ptr", strokeStyle, D2D_MATRIX_3X2_F.Ptr, worldTransform, "float", flatteningTolerance, D2D_RECT_F.Ptr, bounds, "HRESULT")
        return bounds
    }

    /**
     * Determines whether the geometry's stroke contains the specified point.
     * @param {D2D_POINT_2F} _point 
     * @param {Float} strokeWidth 
     * @param {ID2D1StrokeStyle} strokeStyle 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-strokecontainspoint
     */
    StrokeContainsPoint(_point, strokeWidth, strokeStyle, worldTransform, flatteningTolerance) {
        result := ComCall(6, this, D2D_POINT_2F, _point, "float", strokeWidth, "ptr", strokeStyle, D2D_MATRIX_3X2_F.Ptr, worldTransform, "float", flatteningTolerance, BOOL.Ptr, &_contains := 0, "HRESULT")
        return _contains
    }

    /**
     * Indicates whether the area filled by the geometry would contain the specified point.
     * @param {D2D_POINT_2F} _point 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-fillcontainspoint
     */
    FillContainsPoint(_point, worldTransform, flatteningTolerance) {
        result := ComCall(7, this, D2D_POINT_2F, _point, D2D_MATRIX_3X2_F.Ptr, worldTransform, "float", flatteningTolerance, BOOL.Ptr, &_contains := 0, "HRESULT")
        return _contains
    }

    /**
     * Describes the intersection between this geometry and the specified geometry.
     * @remarks
     * When interpreting the returned *relation* value, it is important to remember that the member [**D2D1\_GEOMETRY\_RELATION\_IS\_CONTAINED**](/windows/desktop/api/d2d1/ne-d2d1-d2d1_geometry_relation) of the **D2D1\_GEOMETRY\_RELATION** enumeration type means that this geometry is contained inside *inputGeometry*, not that this geometry contains *inputGeometry*.
     * 
     * For more information about how to interpret other possible return values, see [**D2D1\_GEOMETRY\_RELATION**](/windows/desktop/api/d2d1/ne-d2d1-d2d1_geometry_relation).
     * @param {ID2D1Geometry} inputGeometry 
     * @param {Pointer<D2D_MATRIX_3X2_F>} inputGeometryTransform 
     * @param {Float} flatteningTolerance 
     * @returns {D2D1_GEOMETRY_RELATION} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-comparewithgeometry
     */
    CompareWithGeometry(inputGeometry, inputGeometryTransform, flatteningTolerance) {
        result := ComCall(8, this, "ptr", inputGeometry, D2D_MATRIX_3X2_F.Ptr, inputGeometryTransform, "float", flatteningTolerance, "int*", &relation := 0, "HRESULT")
        return relation
    }

    /**
     * Creates a simplified version of the geometry that contains only lines and (optionally) cubic Bezier curves and writes the result to an ID2D1SimplifiedGeometrySink.
     * @param {D2D1_GEOMETRY_SIMPLIFICATION_OPTION} simplificationOption 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @param {ID2D1SimplifiedGeometrySink} geometrySink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-simplify
     */
    Simplify(simplificationOption, worldTransform, flatteningTolerance, geometrySink) {
        result := ComCall(9, this, D2D1_GEOMETRY_SIMPLIFICATION_OPTION, simplificationOption, D2D_MATRIX_3X2_F.Ptr, worldTransform, "float", flatteningTolerance, "ptr", geometrySink, "HRESULT")
        return result
    }

    /**
     * Creates a set of clockwise-wound triangles that cover the geometry after it has been transformed using the specified matrix and flattened using the specified tolerance.
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @param {ID2D1TessellationSink} tessellationSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-tessellate
     */
    Tessellate(worldTransform, flatteningTolerance, tessellationSink) {
        result := ComCall(10, this, D2D_MATRIX_3X2_F.Ptr, worldTransform, "float", flatteningTolerance, "ptr", tessellationSink, "HRESULT")
        return result
    }

    /**
     * Combines this geometry with the specified geometry and stores the result in an ID2D1SimplifiedGeometrySink.
     * @param {ID2D1Geometry} inputGeometry 
     * @param {D2D1_COMBINE_MODE} _combineMode 
     * @param {Pointer<D2D_MATRIX_3X2_F>} inputGeometryTransform 
     * @param {Float} flatteningTolerance 
     * @param {ID2D1SimplifiedGeometrySink} geometrySink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-combinewithgeometry
     */
    CombineWithGeometry(inputGeometry, _combineMode, inputGeometryTransform, flatteningTolerance, geometrySink) {
        result := ComCall(11, this, "ptr", inputGeometry, D2D1_COMBINE_MODE, _combineMode, D2D_MATRIX_3X2_F.Ptr, inputGeometryTransform, "float", flatteningTolerance, "ptr", geometrySink, "HRESULT")
        return result
    }

    /**
     * Computes the outline of the geometry and writes the result to an ID2D1SimplifiedGeometrySink.
     * @remarks
     * The [**Outline**](/windows/win32/api/d2d1/nf-d2d1-id2d1geometry-outline(constd2d1_matrix_3x2_f__id2d1simplifiedgeometrysink)) method allows the caller to produce a geometry with an equivalent fill to the input geometry, with the following additional properties:
     * 
     * -   The output geometry contains no transverse intersections; that is, segments may touch, but they never cross.
     * -   The outermost figures in the output geometry are all oriented counterclockwise.
     * -   The output geometry is fill-mode invariant; that is, the fill of the geometry does not depend on the choice of the fill mode. For more information about the fill mode, see [**D2D1\_FILL\_MODE**](/windows/desktop/api/d2d1/ne-d2d1-d2d1_fill_mode).
     * 
     * Additionally, the [**Outline**](/windows/win32/api/d2d1/nf-d2d1-id2d1geometry-outline(constd2d1_matrix_3x2_f__id2d1simplifiedgeometrysink)) method can be useful in removing redundant portions of said geometries to simplify complex geometries. It can also be useful in combination with [**ID2D1GeometryGroup**](/windows/win32/api/d2d1/nn-d2d1-id2d1geometrygroup) to create unions among several geometries simultaneously.
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @param {ID2D1SimplifiedGeometrySink} geometrySink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-outline
     */
    Outline(worldTransform, flatteningTolerance, geometrySink) {
        result := ComCall(12, this, D2D_MATRIX_3X2_F.Ptr, worldTransform, "float", flatteningTolerance, "ptr", geometrySink, "HRESULT")
        return result
    }

    /**
     * Computes the area of the geometry.
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-computearea
     */
    ComputeArea(worldTransform, flatteningTolerance) {
        result := ComCall(13, this, D2D_MATRIX_3X2_F.Ptr, worldTransform, "float", flatteningTolerance, "float*", &area := 0, "HRESULT")
        return area
    }

    /**
     * Calculates the length of the geometry as though each segment were unrolled into a line.
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-computelength
     */
    ComputeLength(worldTransform, flatteningTolerance) {
        result := ComCall(14, this, D2D_MATRIX_3X2_F.Ptr, worldTransform, "float", flatteningTolerance, "float*", &length := 0, "HRESULT")
        return length
    }

    /**
     * Calculates the point and tangent vector at the specified distance along the \ 160;geometry.
     * @param {Float} length 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @param {Pointer<D2D_POINT_2F>} _point 
     * @param {Pointer<D2D_POINT_2F>} unitTangentVector 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-computepointatlength
     */
    ComputePointAtLength(length, worldTransform, flatteningTolerance, _point, unitTangentVector) {
        result := ComCall(15, this, "float", length, D2D_MATRIX_3X2_F.Ptr, worldTransform, "float", flatteningTolerance, D2D_POINT_2F.Ptr, _point, D2D_POINT_2F.Ptr, unitTangentVector, "HRESULT")
        return result
    }

    /**
     * Widens the geometry by the specified stroke and writes the result to an ID2D1SimplifiedGeometrySink.
     * @param {Float} strokeWidth 
     * @param {ID2D1StrokeStyle} strokeStyle 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @param {ID2D1SimplifiedGeometrySink} geometrySink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometry-widen
     */
    Widen(strokeWidth, strokeStyle, worldTransform, flatteningTolerance, geometrySink) {
        result := ComCall(16, this, "float", strokeWidth, "ptr", strokeStyle, D2D_MATRIX_3X2_F.Ptr, worldTransform, "float", flatteningTolerance, "ptr", geometrySink, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID2D1Geometry.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBounds := CallbackCreate(GetMethod(implObj, "GetBounds"), flags, 3)
        this.vtbl.GetWidenedBounds := CallbackCreate(GetMethod(implObj, "GetWidenedBounds"), flags, 6)
        this.vtbl.StrokeContainsPoint := CallbackCreate(GetMethod(implObj, "StrokeContainsPoint"), flags, 7)
        this.vtbl.FillContainsPoint := CallbackCreate(GetMethod(implObj, "FillContainsPoint"), flags, 5)
        this.vtbl.CompareWithGeometry := CallbackCreate(GetMethod(implObj, "CompareWithGeometry"), flags, 5)
        this.vtbl.Simplify := CallbackCreate(GetMethod(implObj, "Simplify"), flags, 5)
        this.vtbl.Tessellate := CallbackCreate(GetMethod(implObj, "Tessellate"), flags, 4)
        this.vtbl.CombineWithGeometry := CallbackCreate(GetMethod(implObj, "CombineWithGeometry"), flags, 6)
        this.vtbl.Outline := CallbackCreate(GetMethod(implObj, "Outline"), flags, 4)
        this.vtbl.ComputeArea := CallbackCreate(GetMethod(implObj, "ComputeArea"), flags, 4)
        this.vtbl.ComputeLength := CallbackCreate(GetMethod(implObj, "ComputeLength"), flags, 4)
        this.vtbl.ComputePointAtLength := CallbackCreate(GetMethod(implObj, "ComputePointAtLength"), flags, 6)
        this.vtbl.Widen := CallbackCreate(GetMethod(implObj, "Widen"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBounds)
        CallbackFree(this.vtbl.GetWidenedBounds)
        CallbackFree(this.vtbl.StrokeContainsPoint)
        CallbackFree(this.vtbl.FillContainsPoint)
        CallbackFree(this.vtbl.CompareWithGeometry)
        CallbackFree(this.vtbl.Simplify)
        CallbackFree(this.vtbl.Tessellate)
        CallbackFree(this.vtbl.CombineWithGeometry)
        CallbackFree(this.vtbl.Outline)
        CallbackFree(this.vtbl.ComputeArea)
        CallbackFree(this.vtbl.ComputeLength)
        CallbackFree(this.vtbl.ComputePointAtLength)
        CallbackFree(this.vtbl.Widen)
    }
}
