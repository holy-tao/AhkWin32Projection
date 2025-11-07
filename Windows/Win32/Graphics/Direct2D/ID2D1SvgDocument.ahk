#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1SvgElement.ahk
#Include .\ID2D1SvgPaint.ahk
#Include .\ID2D1SvgStrokeDashArray.ahk
#Include .\ID2D1SvgPointCollection.ahk
#Include .\ID2D1SvgPathData.ahk
#Include .\ID2D1Resource.ahk

/**
 * Represents an SVG document.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nn-d2d1svg-id2d1svgdocument
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1SvgDocument extends ID2D1Resource{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetViewportSize", "GetViewportSize", "SetRoot", "GetRoot", "FindElementById", "Serialize", "Deserialize", "CreatePaint", "CreateStrokeDashArray", "CreatePointCollection", "CreatePathData"]

    /**
     * 
     * @param {D2D_SIZE_F} viewportSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgdocument-setviewportsize
     */
    SetViewportSize(viewportSize) {
        result := ComCall(4, this, "ptr", viewportSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {D2D_SIZE_F} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgdocument-getviewportsize
     */
    GetViewportSize() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * 
     * @param {ID2D1SvgElement} root 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgdocument-setroot
     */
    SetRoot(root) {
        result := ComCall(6, this, "ptr", root, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1SvgElement>} root 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgdocument-getroot
     */
    GetRoot(root) {
        ComCall(7, this, "ptr*", root)
    }

    /**
     * 
     * @param {PWSTR} id 
     * @returns {ID2D1SvgElement} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgdocument-findelementbyid
     */
    FindElementById(id) {
        id := id is String ? StrPtr(id) : id

        result := ComCall(8, this, "ptr", id, "ptr*", &svgElement := 0, "HRESULT")
        return ID2D1SvgElement(svgElement)
    }

    /**
     * 
     * @param {IStream} outputXmlStream 
     * @param {ID2D1SvgElement} subtree 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgdocument-serialize
     */
    Serialize(outputXmlStream, subtree) {
        result := ComCall(9, this, "ptr", outputXmlStream, "ptr", subtree, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} inputXmlStream 
     * @returns {ID2D1SvgElement} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgdocument-deserialize
     */
    Deserialize(inputXmlStream) {
        result := ComCall(10, this, "ptr", inputXmlStream, "ptr*", &subtree := 0, "HRESULT")
        return ID2D1SvgElement(subtree)
    }

    /**
     * 
     * @param {Integer} paintType 
     * @param {Pointer<D2D1_COLOR_F>} color 
     * @param {PWSTR} id 
     * @returns {ID2D1SvgPaint} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1svgdocument-createpaint-overload
     */
    CreatePaint(paintType, color, id) {
        id := id is String ? StrPtr(id) : id

        result := ComCall(11, this, "int", paintType, "ptr", color, "ptr", id, "ptr*", &paint := 0, "HRESULT")
        return ID2D1SvgPaint(paint)
    }

    /**
     * 
     * @param {Pointer<D2D1_SVG_LENGTH>} dashes 
     * @param {Integer} dashesCount 
     * @returns {ID2D1SvgStrokeDashArray} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgdocument-createstrokedasharray
     */
    CreateStrokeDashArray(dashes, dashesCount) {
        result := ComCall(12, this, "ptr", dashes, "uint", dashesCount, "ptr*", &strokeDashArray := 0, "HRESULT")
        return ID2D1SvgStrokeDashArray(strokeDashArray)
    }

    /**
     * 
     * @param {Pointer<D2D_POINT_2F>} points 
     * @param {Integer} pointsCount 
     * @returns {ID2D1SvgPointCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgdocument-createpointcollection
     */
    CreatePointCollection(points, pointsCount) {
        result := ComCall(13, this, "ptr", points, "uint", pointsCount, "ptr*", &pointCollection := 0, "HRESULT")
        return ID2D1SvgPointCollection(pointCollection)
    }

    /**
     * 
     * @param {Pointer<Float>} segmentData 
     * @param {Integer} segmentDataCount 
     * @param {Pointer<Integer>} commands 
     * @param {Integer} commandsCount 
     * @returns {ID2D1SvgPathData} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgdocument-createpathdata
     */
    CreatePathData(segmentData, segmentDataCount, commands, commandsCount) {
        segmentDataMarshal := segmentData is VarRef ? "float*" : "ptr"
        commandsMarshal := commands is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, segmentDataMarshal, segmentData, "uint", segmentDataCount, commandsMarshal, commands, "uint", commandsCount, "ptr*", &pathData := 0, "HRESULT")
        return ID2D1SvgPathData(pathData)
    }
}
