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
     * 
     * @param {Pointer<D2D1_INK_POINT>} startPoint 
     * @returns {String} Nothing - always returns an empty string
     */
    SetStartPoint(startPoint) {
        ComCall(4, this, "ptr", startPoint)
        return result
    }

    /**
     * 
     * @returns {D2D1_INK_POINT} 
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
     */
    AddSegments(segments, segmentsCount) {
        result := ComCall(6, this, "ptr", segments, "uint", segmentsCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} segmentsCount 
     * @returns {HRESULT} 
     */
    RemoveSegmentsAtEnd(segmentsCount) {
        result := ComCall(7, this, "uint", segmentsCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} startSegment 
     * @param {Pointer<D2D1_INK_BEZIER_SEGMENT>} segments 
     * @param {Integer} segmentsCount 
     * @returns {HRESULT} 
     */
    SetSegments(startSegment, segments, segmentsCount) {
        result := ComCall(8, this, "uint", startSegment, "ptr", segments, "uint", segmentsCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_INK_BEZIER_SEGMENT>} segment 
     * @returns {HRESULT} 
     */
    SetSegmentAtEnd(segment) {
        result := ComCall(9, this, "ptr", segment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
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
     */
    GetSegments(startSegment, segments, segmentsCount) {
        result := ComCall(11, this, "uint", startSegment, "ptr", segments, "uint", segmentsCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1InkStyle>} inkStyle 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @param {Pointer<ID2D1SimplifiedGeometrySink>} geometrySink 
     * @returns {HRESULT} 
     */
    StreamAsGeometry(inkStyle, worldTransform, flatteningTolerance, geometrySink) {
        result := ComCall(12, this, "ptr", inkStyle, "ptr", worldTransform, "float", flatteningTolerance, "ptr", geometrySink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1InkStyle>} inkStyle 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Pointer<D2D_RECT_F>} bounds 
     * @returns {HRESULT} 
     */
    GetBounds(inkStyle, worldTransform, bounds) {
        result := ComCall(13, this, "ptr", inkStyle, "ptr", worldTransform, "ptr", bounds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
