#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include Common\ID2D1SimplifiedGeometrySink.ahk

/**
 * Describes a geometric path that can contain lines, arcs, cubic Bezier curves, and quadratic Bezier curves.
 * @remarks
 * 
 * The <b>ID2D1GeometrySink</b> interface extends the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1simplifiedgeometrysink">ID2D1SimplifiedGeometrySink</a> interface to add support for arcs and quadratic beziers, as well as functions for adding single lines and cubic beziers.
 * 
 * A geometry sink consists of one or more figures. Each figure is made up of one or more line, curve, or arc segments. To create a figure, call the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1simplifiedgeometrysink-beginfigure">BeginFigure</a> method, specify the figure's start point, and then use its Add methods (such as AddLine and AddBezier) to add segments. When you are finished adding segments, call the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1simplifiedgeometrysink-endfigure">EndFigure</a> method. You can repeat this sequence to create additional figures. When you are finished creating figures, call the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1simplifiedgeometrysink-close">Close</a> method.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1geometrysink
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1GeometrySink extends ID2D1SimplifiedGeometrySink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1GeometrySink
     * @type {Guid}
     */
    static IID => Guid("{2cd9069f-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddLine", "AddBezier", "AddQuadraticBezier", "AddQuadraticBeziers", "AddArc"]

    /**
     * Creates a line segment between the current point and the specified end point and adds it to the geometry sink.
     * @param {D2D_POINT_2F} point Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The end point of the line to draw.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1geometrysink-addline
     */
    AddLine(point) {
        ComCall(10, this, "ptr", point)
    }

    /**
     * 
     * @param {Pointer<D2D1_BEZIER_SEGMENT>} bezier 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometrysink-addbezier
     */
    AddBezier(bezier) {
        ComCall(11, this, "ptr", bezier)
    }

    /**
     * 
     * @param {Pointer<D2D1_QUADRATIC_BEZIER_SEGMENT>} bezier 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometrysink-addquadraticbezier
     */
    AddQuadraticBezier(bezier) {
        ComCall(12, this, "ptr", bezier)
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
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1geometrysink-addquadraticbeziers
     */
    AddQuadraticBeziers(beziers, beziersCount) {
        ComCall(13, this, "ptr", beziers, "uint", beziersCount)
    }

    /**
     * 
     * @param {Pointer<D2D1_ARC_SEGMENT>} arc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1geometrysink-addarc
     */
    AddArc(arc) {
        ComCall(14, this, "ptr", arc)
    }
}
