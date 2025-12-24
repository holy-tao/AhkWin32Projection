#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include Common\D2D_POINT_2F.ahk
#Include .\ID2D1SvgAttribute.ahk

/**
 * Interface describing an SVG points value in a polyline or polygon element.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nn-d2d1svg-id2d1svgpointcollection
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1SvgPointCollection extends ID2D1SvgAttribute{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1SvgPointCollection
     * @type {Guid}
     */
    static IID => Guid("{9dbe4c0d-3572-4dd9-9825-5530813bb712}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RemovePointsAtEnd", "UpdatePoints", "GetPoints", "GetPointsCount"]

    /**
     * Removes points from the end of the array.
     * @param {Integer} pointsCount Type: <b>UINT32</b>
     * 
     * Specifies how many points to remove.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgpointcollection-removepointsatend
     */
    RemovePointsAtEnd(pointsCount) {
        result := ComCall(6, this, "uint", pointsCount, "HRESULT")
        return result
    }

    /**
     * Updates the points array. Existing points not updated by this method are preserved. The array is resized larger if necessary to accomodate the new points.
     * @param {Pointer<D2D_POINT_2F>} points Type: <b>const D2D1_POINT_2F*</b>
     * 
     * The points array.
     * @param {Integer} pointsCount Type: <b>UINT32</b>
     * 
     * The number of points to update.
     * @param {Integer} startIndex Type: <b>UINT32</b>
     * 
     * The index at which to begin updating points. Must be less than or equal to the size of the array.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgpointcollection-updatepoints
     */
    UpdatePoints(points, pointsCount, startIndex) {
        result := ComCall(7, this, "ptr", points, "uint", pointsCount, "uint", startIndex, "HRESULT")
        return result
    }

    /**
     * Gets points from the points array.
     * @param {Integer} pointsCount Type: <b>UINT32</b>
     * 
     * The element count of the buffer.
     * @param {Integer} startIndex Type: <b>UINT32</b>
     * 
     * The index of the first point to retrieve.
     * @returns {D2D_POINT_2F} Type: <b>D2D1_POINT_2F*</b>
     * 
     * Buffer to contain the points.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgpointcollection-getpoints
     */
    GetPoints(pointsCount, startIndex) {
        points := D2D_POINT_2F()
        result := ComCall(8, this, "ptr", points, "uint", pointsCount, "uint", startIndex, "HRESULT")
        return points
    }

    /**
     * Gets the number of points in the array.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * Returns the number of points in the array.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgpointcollection-getpointscount
     */
    GetPointsCount() {
        result := ComCall(9, this, "uint")
        return result
    }
}
