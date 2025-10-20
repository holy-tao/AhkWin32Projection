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
     * 
     * @param {Integer} fillMode 
     * @returns {String} Nothing - always returns an empty string
     */
    SetFillMode(fillMode) {
        ComCall(3, this, "int", fillMode)
        return result
    }

    /**
     * 
     * @param {Integer} vertexFlags 
     * @returns {String} Nothing - always returns an empty string
     */
    SetSegmentFlags(vertexFlags) {
        ComCall(4, this, "int", vertexFlags)
        return result
    }

    /**
     * 
     * @param {D2D_POINT_2F} startPoint 
     * @param {Integer} figureBegin 
     * @returns {String} Nothing - always returns an empty string
     */
    BeginFigure(startPoint, figureBegin) {
        ComCall(5, this, "ptr", startPoint, "int", figureBegin)
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_POINT_2F>} points 
     * @param {Integer} pointsCount 
     * @returns {String} Nothing - always returns an empty string
     */
    AddLines(points, pointsCount) {
        ComCall(6, this, "ptr", points, "uint", pointsCount)
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_BEZIER_SEGMENT>} beziers 
     * @param {Integer} beziersCount 
     * @returns {String} Nothing - always returns an empty string
     */
    AddBeziers(beziers, beziersCount) {
        ComCall(7, this, "ptr", beziers, "uint", beziersCount)
        return result
    }

    /**
     * 
     * @param {Integer} figureEnd 
     * @returns {String} Nothing - always returns an empty string
     */
    EndFigure(figureEnd) {
        ComCall(8, this, "int", figureEnd)
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
