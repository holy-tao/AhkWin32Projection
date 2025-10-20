#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Resource.ahk

/**
 * Represents an SVG document.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nn-d2d1svg-id2d1svgdocument
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1SvgDocument extends ID2D1Resource{
    /**
     * The interface identifier for ID2D1SvgDocument
     * @type {Guid}
     */
    static IID => Guid("{86b88e4d-afa4-4d7b-88e4-68a51c4a0aec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {D2D_SIZE_F} viewportSize 
     * @returns {HRESULT} 
     */
    SetViewportSize(viewportSize) {
        result := ComCall(4, this, "ptr", viewportSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {D2D_SIZE_F} 
     */
    GetViewportSize() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1SvgElement>} root 
     * @returns {HRESULT} 
     */
    SetRoot(root) {
        result := ComCall(6, this, "ptr", root, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1SvgElement>} root 
     * @returns {String} Nothing - always returns an empty string
     */
    GetRoot(root) {
        ComCall(7, this, "ptr", root)
        return result
    }

    /**
     * 
     * @param {PWSTR} id 
     * @param {Pointer<ID2D1SvgElement>} svgElement 
     * @returns {HRESULT} 
     */
    FindElementById(id, svgElement) {
        id := id is String ? StrPtr(id) : id

        result := ComCall(8, this, "ptr", id, "ptr", svgElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} outputXmlStream 
     * @param {Pointer<ID2D1SvgElement>} subtree 
     * @returns {HRESULT} 
     */
    Serialize(outputXmlStream, subtree) {
        result := ComCall(9, this, "ptr", outputXmlStream, "ptr", subtree, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} inputXmlStream 
     * @param {Pointer<ID2D1SvgElement>} subtree 
     * @returns {HRESULT} 
     */
    Deserialize(inputXmlStream, subtree) {
        result := ComCall(10, this, "ptr", inputXmlStream, "ptr", subtree, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} paintType 
     * @param {Pointer<D2D1_COLOR_F>} color 
     * @param {PWSTR} id 
     * @param {Pointer<ID2D1SvgPaint>} paint 
     * @returns {HRESULT} 
     */
    CreatePaint(paintType, color, id, paint) {
        id := id is String ? StrPtr(id) : id

        result := ComCall(11, this, "int", paintType, "ptr", color, "ptr", id, "ptr", paint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_SVG_LENGTH>} dashes 
     * @param {Integer} dashesCount 
     * @param {Pointer<ID2D1SvgStrokeDashArray>} strokeDashArray 
     * @returns {HRESULT} 
     */
    CreateStrokeDashArray(dashes, dashesCount, strokeDashArray) {
        result := ComCall(12, this, "ptr", dashes, "uint", dashesCount, "ptr", strokeDashArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D_POINT_2F>} points 
     * @param {Integer} pointsCount 
     * @param {Pointer<ID2D1SvgPointCollection>} pointCollection 
     * @returns {HRESULT} 
     */
    CreatePointCollection(points, pointsCount, pointCollection) {
        result := ComCall(13, this, "ptr", points, "uint", pointsCount, "ptr", pointCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} segmentData 
     * @param {Integer} segmentDataCount 
     * @param {Pointer<Int32>} commands 
     * @param {Integer} commandsCount 
     * @param {Pointer<ID2D1SvgPathData>} pathData 
     * @returns {HRESULT} 
     */
    CreatePathData(segmentData, segmentDataCount, commands, commandsCount, pathData) {
        result := ComCall(14, this, "float*", segmentData, "uint", segmentDataCount, "int*", commands, "uint", commandsCount, "ptr", pathData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
