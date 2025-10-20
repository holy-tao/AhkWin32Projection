#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} pointsCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpointcollection-removepointsatend
     */
    RemovePointsAtEnd(pointsCount) {
        result := ComCall(6, this, "uint", pointsCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_POINT_2F>} points 
     * @param {Integer} pointsCount 
     * @param {Integer} startIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpointcollection-updatepoints
     */
    UpdatePoints(points, pointsCount, startIndex) {
        result := ComCall(7, this, "ptr", points, "uint", pointsCount, "uint", startIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_POINT_2F>} points 
     * @param {Integer} pointsCount 
     * @param {Integer} startIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpointcollection-getpoints
     */
    GetPoints(points, pointsCount, startIndex) {
        result := ComCall(8, this, "ptr", points, "uint", pointsCount, "uint", startIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpointcollection-getpointscount
     */
    GetPointsCount() {
        result := ComCall(9, this, "uint")
        return result
    }
}
