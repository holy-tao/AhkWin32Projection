#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Describes a geometric path that does not contain quadratic bezier curves or arcs.
 * @remarks
 * 
 * A geometry sink consists of one or more figures. Each figure is made up of one or more line or Bezier curve segments. To create a figure, call the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1simplifiedgeometrysink-beginfigure">BeginFigure</a> method and specify the figure's start point, then use <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1simplifiedgeometrysink-addlines">AddLines</a> and <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1simplifiedgeometrysink-addbeziers">AddBeziers</a> to add line and Bezier segments. When you are finished adding segments, call the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1simplifiedgeometrysink-endfigure">EndFigure</a> method. You can repeat this sequence to create additional figures. When you are finished creating figures, call the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1simplifiedgeometrysink-close">Close</a> method.
 * 
 * To create geometry paths that can contain arcs and quadratic Bezier curves, use an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1geometrysink">ID2D1GeometrySink</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1simplifiedgeometrysink
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class ID2D1SimplifiedGeometrySink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1SimplifiedGeometrySink
     * @type {Guid}
     */
    static IID => Guid("{2cd9069e-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFillMode", "SetSegmentFlags", "BeginFigure", "AddLines", "AddBeziers", "EndFigure", "Close"]

    /**
     * Specifies the method used to determine which points are inside the geometry described by this geometry sink and which points are outside.
     * @remarks
     * 
     * The fill mode defaults to D2D1_FILL_MODE_ALTERNATE. To set the fill mode, call <b>SetFillMode</b> before the first call to <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1simplifiedgeometrysink-beginfigure">BeginFigure</a>. Not doing will put the geometry sink in an error state.
     * 
     * 
     * @param {Integer} fillMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_fill_mode">D2D1_FILL_MODE</a></b>
     * 
     * The method used to determine whether a given point is part of the geometry.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1simplifiedgeometrysink-setfillmode
     */
    SetFillMode(fillMode) {
        ComCall(3, this, "int", fillMode)
    }

    /**
     * Specifies stroke and join options to be applied to new segments added to the geometry sink.
     * @remarks
     * 
     * After this method is called, the specified segment flags are applied to each segment subsequently added to the sink. The segment flags are applied to every additional segment until this method is called again and a different set of segment flags is specified.
     * 
     * 
     * @param {Integer} vertexFlags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_path_segment">D2D1_PATH_SEGMENT</a></b>
     * 
     * Stroke and join options to be applied to new segments added to the geometry sink.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1simplifiedgeometrysink-setsegmentflags
     */
    SetSegmentFlags(vertexFlags) {
        ComCall(4, this, "int", vertexFlags)
    }

    /**
     * Starts a new figure at the specified point.
     * @remarks
     * 
     * If this method is called while a figure is currently in progress, the interface is invalidated and all future methods will fail.
     * 
     * 
     * 
     * @param {D2D_POINT_2F} startPoint Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The point at which to begin the new figure.
     * @param {Integer} figureBegin Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_figure_begin">D2D1_FIGURE_BEGIN</a></b>
     * 
     * Whether the new figure should be hollow or filled.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1simplifiedgeometrysink-beginfigure
     */
    BeginFigure(startPoint, figureBegin) {
        ComCall(5, this, "ptr", startPoint, "int", figureBegin)
    }

    /**
     * Creates a sequence of lines using the specified points and adds them to the geometry sink.
     * @param {Pointer<D2D_POINT_2F>} points Type: <b>const <a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * A pointer to an array of one or more points that describe the lines to draw. A line is drawn from the geometry sink's current point (the end point of the last segment drawn or the location specified by <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1simplifiedgeometrysink-beginfigure">BeginFigure</a>) to the first point in the array. if the array contains additional points, a line is drawn from the first point to the second point in the array, from the second point to the third point, and so on.
     * @param {Integer} pointsCount Type: <b>UINT</b>
     * 
     * The number of points in the <i>points</i> array.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1simplifiedgeometrysink-addlines
     */
    AddLines(points, pointsCount) {
        ComCall(6, this, "ptr", points, "uint", pointsCount)
    }

    /**
     * Creates a sequence of cubic Bezier curves and adds them to the geometry sink.
     * @param {Pointer<D2D1_BEZIER_SEGMENT>} beziers Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_bezier_segment">D2D1_BEZIER_SEGMENT</a>*</b>
     * 
     * A pointer to an array of Bezier segments that describes the Bezier curves to create. A curve is drawn from the geometry sink's current point (the end point of the last segment drawn or the location specified by <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1simplifiedgeometrysink-beginfigure">BeginFigure</a>) to the end point of the first Bezier segment in the array. if the array contains additional Bezier segments, each subsequent Bezier segment uses the end point of the preceding Bezier segment as its start point.
     * @param {Integer} beziersCount Type: <b>UINT</b>
     * 
     * The number of Bezier segments in the <i>beziers</i> array.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1simplifiedgeometrysink-addbeziers
     */
    AddBeziers(beziers, beziersCount) {
        ComCall(7, this, "ptr", beziers, "uint", beziersCount)
    }

    /**
     * Ends the current figure; optionally, closes it.
     * @remarks
     * 
     * Calling this method without a matching call to <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1simplifiedgeometrysink-beginfigure">BeginFigure</a>  places the geometry sink in an error state; subsequent calls are ignored, and the overall failure will be returned when the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1simplifiedgeometrysink-close">Close</a> method is called.
     * 
     * 
     * 
     * @param {Integer} figureEnd Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_figure_end">D2D1_FIGURE_END</a></b>
     * 
     * A value that indicates whether the current figure is closed. If the figure is closed, a line is drawn between the current point and the start point specified by <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1simplifiedgeometrysink-beginfigure">BeginFigure</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1simplifiedgeometrysink-endfigure
     */
    EndFigure(figureEnd) {
        ComCall(8, this, "int", figureEnd)
    }

    /**
     * Closes the geometry sink, indicates whether it is in an error state, and resets the sink's error state.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an [**HRESULT**](/windows/desktop/com/structure-of-com-error-codes) error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1simplifiedgeometrysink-close
     */
    Close() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
