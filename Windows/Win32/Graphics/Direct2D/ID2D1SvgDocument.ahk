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
     * Sets the size of the initial viewport.
     * @param {D2D_SIZE_F} viewportSize Type: <b>D2D1_SIZE_F</b>
     * 
     * The size of the viewport.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgdocument-setviewportsize
     */
    SetViewportSize(viewportSize) {
        result := ComCall(4, this, "ptr", viewportSize, "HRESULT")
        return result
    }

    /**
     * Returns the size of the initial viewport.
     * @returns {D2D_SIZE_F} Type: <b>D2D1_SIZE_F</b>
     * 
     * Returns the size of the initial viewport
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgdocument-getviewportsize
     */
    GetViewportSize() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * Sets the root element of the document.
     * @param {ID2D1SvgElement} root Type: <b>ID2D1SvgElement*</b>
     * 
     * The new root element of the document.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgdocument-setroot
     */
    SetRoot(root) {
        result := ComCall(6, this, "ptr", root, "HRESULT")
        return result
    }

    /**
     * Gets the root element of the document.
     * @param {Pointer<ID2D1SvgElement>} root Type: <b>ID2D1SvgElement**</b>
     * 
     * Outputs the root element of the document.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgdocument-getroot
     */
    GetRoot(root) {
        ComCall(7, this, "ptr*", root)
    }

    /**
     * Gets the SVG element with the specified ID.
     * @param {PWSTR} id Type: <b>PCWSTR</b>
     * 
     * ID of the element to retrieve.
     * @returns {ID2D1SvgElement} Type: <b>ID2D1SvgElement**</b>
     * 
     * The element matching the specified ID. If the element cannot be found, the returned element will be null.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgdocument-findelementbyid
     */
    FindElementById(id) {
        id := id is String ? StrPtr(id) : id

        result := ComCall(8, this, "ptr", id, "ptr*", &svgElement := 0, "HRESULT")
        return ID2D1SvgElement(svgElement)
    }

    /**
     * Serializes an element and its subtree to XML. The output XML is encoded as UTF-8.
     * @param {IStream} outputXmlStream Type: <b>IStream*</b>
     * 
     * An output stream to contain the SVG XML subtree.
     * @param {ID2D1SvgElement} subtree Type: <b>ID2D1SvgElement*</b>
     * 
     * The root of the subtree. If null, the entire document is serialized.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgdocument-serialize
     */
    Serialize(outputXmlStream, subtree) {
        result := ComCall(9, this, "ptr", outputXmlStream, "ptr", subtree, "HRESULT")
        return result
    }

    /**
     * Deserializes a subtree from the stream. The stream must have only one root element, but that root element need not be an 'svg' element. The output element is not inserted into this document tree.
     * @param {IStream} inputXmlStream Type: <b>IStream*</b>
     * 
     * An input stream containing the SVG XML subtree.
     * @returns {ID2D1SvgElement} Type: <b>ID2D1SvgElement**</b>
     * 
     * The root of the subtree.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgdocument-deserialize
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
     * Creates a dash array object which can be used to set the stroke-dasharray property.
     * @param {Pointer<D2D1_SVG_LENGTH>} dashes Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1svg/ns-d2d1svg-d2d1_svg_length">D2D1_SVG_LENGTH</a>*</b>
     * 
     * An array of dashes.
     * @param {Integer} dashesCount Type: <b>UINT32</b>
     * 
     * Size of the array in th dashes argument.
     * @returns {ID2D1SvgStrokeDashArray} Type: <b>ID2D1SvgStrokeDashArray**</b>
     * 
     * The created <a href="https://docs.microsoft.com/windows/desktop/api/d2d1svg/nn-d2d1svg-id2d1svgstrokedasharray">ID2D1SvgStrokeDashArray</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgdocument-createstrokedasharray
     */
    CreateStrokeDashArray(dashes, dashesCount) {
        result := ComCall(12, this, "ptr", dashes, "uint", dashesCount, "ptr*", &strokeDashArray := 0, "HRESULT")
        return ID2D1SvgStrokeDashArray(strokeDashArray)
    }

    /**
     * Creates a points object which can be used to set a points attribute on a polygon or polyline element.
     * @param {Pointer<D2D_POINT_2F>} points Type: <b>const D2D1_POINT_2F*</b>
     * 
     * The points in the point collection.
     * @param {Integer} pointsCount Type: <b>UINT32</b>
     * 
     * The number of points in the points argument.
     * @returns {ID2D1SvgPointCollection} Type: <b>ID2D1SvgPointCollection**</b>
     * 
     * The created <a href="https://docs.microsoft.com/windows/desktop/api/d2d1svg/nn-d2d1svg-id2d1svgpointcollection">ID2D1SvgPointCollection</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgdocument-createpointcollection
     */
    CreatePointCollection(points, pointsCount) {
        result := ComCall(13, this, "ptr", points, "uint", pointsCount, "ptr*", &pointCollection := 0, "HRESULT")
        return ID2D1SvgPointCollection(pointCollection)
    }

    /**
     * Creates a path data object which can be used to set a 'd' attribute on a 'path' element.
     * @param {Pointer<Float>} segmentData Type: <b>const FLOAT*</b>
     * 
     * An array of segment data.
     * @param {Integer} segmentDataCount Type: <b>UINT32</b>
     * 
     * Number of items in segmentData.
     * @param {Pointer<Integer>} commands Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1svg/ne-d2d1svg-d2d1_svg_path_command">D2D1_SVG_PATH_COMMAND</a>*</b>
     * 
     * An array of path commands.
     * @param {Integer} commandsCount Type: <b>UINT32</b>
     * 
     * The number of items in commands.
     * @returns {ID2D1SvgPathData} Type: <b>ID2D1SvgPathData**</b>
     * 
     * When this method completes, this points to the created path data.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgdocument-createpathdata
     */
    CreatePathData(segmentData, segmentDataCount, commands, commandsCount) {
        segmentDataMarshal := segmentData is VarRef ? "float*" : "ptr"
        commandsMarshal := commands is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, segmentDataMarshal, segmentData, "uint", segmentDataCount, commandsMarshal, commands, "uint", commandsCount, "ptr*", &pathData := 0, "HRESULT")
        return ID2D1SvgPathData(pathData)
    }
}
