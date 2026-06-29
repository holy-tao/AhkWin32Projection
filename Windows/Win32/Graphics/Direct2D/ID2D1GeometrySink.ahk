#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_QUADRATIC_BEZIER_SEGMENT.ahk" { D2D1_QUADRATIC_BEZIER_SEGMENT }
#Import ".\D2D1_ARC_SEGMENT.ahk" { D2D1_ARC_SEGMENT }
#Import "Common\ID2D1SimplifiedGeometrySink.ahk" { ID2D1SimplifiedGeometrySink }
#Import "Common\D2D1_BEZIER_SEGMENT.ahk" { D2D1_BEZIER_SEGMENT }
#Import "Common\D2D_POINT_2F.ahk" { D2D_POINT_2F }

/**
 * Describes a geometric path that can contain lines, arcs, cubic Bezier curves, and quadratic Bezier curves.
 * @remarks
 * The <b>ID2D1GeometrySink</b> interface extends the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1simplifiedgeometrysink">ID2D1SimplifiedGeometrySink</a> interface to add support for arcs and quadratic beziers, as well as functions for adding single lines and cubic beziers.
 * 
 * A geometry sink consists of one or more figures. Each figure is made up of one or more line, curve, or arc segments. To create a figure, call the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1simplifiedgeometrysink-beginfigure">BeginFigure</a> method, specify the figure's start point, and then use its Add methods (such as AddLine and AddBezier) to add segments. When you are finished adding segments, call the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1simplifiedgeometrysink-endfigure">EndFigure</a> method. You can repeat this sequence to create additional figures. When you are finished creating figures, call the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1simplifiedgeometrysink-close">Close</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1geometrysink
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1GeometrySink extends ID2D1SimplifiedGeometrySink {
    /**
     * The interface identifier for ID2D1GeometrySink
     * @type {Guid}
     */
    static IID := Guid("{2cd9069f-12e2-11dc-9fed-001143a055f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1GeometrySink interfaces
    */
    struct Vtbl extends ID2D1SimplifiedGeometrySink.Vtbl {
        AddLine             : IntPtr
        AddBezier           : IntPtr
        AddQuadraticBezier  : IntPtr
        AddQuadraticBeziers : IntPtr
        AddArc              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1GeometrySink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a line segment between the current point and the specified end point and adds it to the geometry sink.
     * @param {D2D_POINT_2F} _point Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The end point of the line to draw.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1geometrysink-addline
     */
    AddLine(_point) {
        ComCall(10, this, D2D_POINT_2F, _point)
    }

    /**
     * Creates a cubic Bezier curve between the current point and the specified end point and adds it to the geometry sink.
     * @param {Pointer<D2D1_BEZIER_SEGMENT>} bezier 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometrysink-addbezier
     */
    AddBezier(bezier) {
        ComCall(11, this, D2D1_BEZIER_SEGMENT.Ptr, bezier)
    }

    /**
     * Creates a quadratic Bezier curve between the current point and the specified end point and adds it to the geometry sink.
     * @param {Pointer<D2D1_QUADRATIC_BEZIER_SEGMENT>} bezier 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometrysink-addquadraticbezier
     */
    AddQuadraticBezier(bezier) {
        ComCall(12, this, D2D1_QUADRATIC_BEZIER_SEGMENT.Ptr, bezier)
    }

    /**
     * Adds a sequence of quadratic Bezier segments as an array in a single call.
     * @param {Pointer<D2D1_QUADRATIC_BEZIER_SEGMENT>} beziers Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_quadratic_bezier_segment">D2D1_QUADRATIC_BEZIER_SEGMENT</a>*</b>
     * 
     * An array of a sequence of quadratic Bezier segments.
     * @param {Integer} beziersCount Type: <b>UINT</b>
     * 
     * A value indicating the number of quadratic Bezier segments in <i>beziers</i>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1geometrysink-addquadraticbeziers
     */
    AddQuadraticBeziers(beziers, beziersCount) {
        ComCall(13, this, D2D1_QUADRATIC_BEZIER_SEGMENT.Ptr, beziers, "uint", beziersCount)
    }

    /**
     * Creates a single arc and adds it to the path geometry.
     * @param {Pointer<D2D1_ARC_SEGMENT>} arc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometrysink-addarc
     */
    AddArc(arc) {
        ComCall(14, this, D2D1_ARC_SEGMENT.Ptr, arc)
    }

    Query(iid) {
        if (ID2D1GeometrySink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddLine := CallbackCreate(GetMethod(implObj, "AddLine"), flags, 2)
        this.vtbl.AddBezier := CallbackCreate(GetMethod(implObj, "AddBezier"), flags, 2)
        this.vtbl.AddQuadraticBezier := CallbackCreate(GetMethod(implObj, "AddQuadraticBezier"), flags, 2)
        this.vtbl.AddQuadraticBeziers := CallbackCreate(GetMethod(implObj, "AddQuadraticBeziers"), flags, 3)
        this.vtbl.AddArc := CallbackCreate(GetMethod(implObj, "AddArc"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddLine)
        CallbackFree(this.vtbl.AddBezier)
        CallbackFree(this.vtbl.AddQuadraticBezier)
        CallbackFree(this.vtbl.AddQuadraticBeziers)
        CallbackFree(this.vtbl.AddArc)
    }
}
