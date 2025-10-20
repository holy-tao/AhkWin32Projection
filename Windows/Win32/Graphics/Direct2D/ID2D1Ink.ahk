#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Resource.ahk

/**
 * Represents a single continuous stroke of variable-width ink, as defined by a series of Bezier segments and widths.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1ink
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Ink extends ID2D1Resource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Ink
     * @type {Guid}
     */
    static IID => Guid("{b499923b-7029-478f-a8b3-432c7c5f5312}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetStartPoint", "GetStartPoint", "AddSegments", "RemoveSegmentsAtEnd", "SetSegments", "SetSegmentAtEnd", "GetSegmentCount", "GetSegments", "StreamAsGeometry", "GetBounds"]

    /**
     * 
     * @param {Pointer<D2D1_INK_POINT>} startPoint 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1ink-setstartpoint(constd2d1_ink_point)
     */
    SetStartPoint(startPoint) {
        ComCall(4, this, "ptr", startPoint)
    }

    /**
     * 
     * @returns {D2D1_INK_POINT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1ink-getstartpoint
     */
    GetStartPoint() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_INK_BEZIER_SEGMENT>} segments 
     * @param {Integer} segmentsCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1ink-addsegments
     */
    AddSegments(segments, segmentsCount) {
        result := ComCall(6, this, "ptr", segments, "uint", segmentsCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} segmentsCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1ink-removesegmentsatend
     */
    RemoveSegmentsAtEnd(segmentsCount) {
        result := ComCall(7, this, "uint", segmentsCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} startSegment 
     * @param {Pointer<D2D1_INK_BEZIER_SEGMENT>} segments 
     * @param {Integer} segmentsCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1ink-setsegments
     */
    SetSegments(startSegment, segments, segmentsCount) {
        result := ComCall(8, this, "uint", startSegment, "ptr", segments, "uint", segmentsCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_INK_BEZIER_SEGMENT>} segment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1ink-setsegmentatend(constd2d1_ink_bezier_segment)
     */
    SetSegmentAtEnd(segment) {
        result := ComCall(9, this, "ptr", segment, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1ink-getsegmentcount
     */
    GetSegmentCount() {
        result := ComCall(10, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} startSegment 
     * @param {Pointer<D2D1_INK_BEZIER_SEGMENT>} segments 
     * @param {Integer} segmentsCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1ink-getsegments
     */
    GetSegments(startSegment, segments, segmentsCount) {
        result := ComCall(11, this, "uint", startSegment, "ptr", segments, "uint", segmentsCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1InkStyle} inkStyle 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @param {ID2D1SimplifiedGeometrySink} geometrySink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1ink-streamasgeometry(id2d1inkstyle_constd2d1_matrix_3x2_f__float_id2d1simplifiedgeometrysink)
     */
    StreamAsGeometry(inkStyle, worldTransform, flatteningTolerance, geometrySink) {
        result := ComCall(12, this, "ptr", inkStyle, "ptr", worldTransform, "float", flatteningTolerance, "ptr", geometrySink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1InkStyle} inkStyle 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Pointer<D2D_RECT_F>} bounds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1ink-getbounds
     */
    GetBounds(inkStyle, worldTransform, bounds) {
        result := ComCall(13, this, "ptr", inkStyle, "ptr", worldTransform, "ptr", bounds, "HRESULT")
        return result
    }
}
