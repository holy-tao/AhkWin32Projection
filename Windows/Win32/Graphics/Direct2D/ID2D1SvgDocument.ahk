#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_SVG_LENGTH.ahk" { D2D1_SVG_LENGTH }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D2D1_SVG_PAINT_TYPE.ahk" { D2D1_SVG_PAINT_TYPE }
#Import "Common\D2D1_COLOR_F.ahk" { D2D1_COLOR_F }
#Import ".\ID2D1SvgPointCollection.ahk" { ID2D1SvgPointCollection }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }
#Import "Common\D2D_POINT_2F.ahk" { D2D_POINT_2F }
#Import "Common\D2D_SIZE_F.ahk" { D2D_SIZE_F }
#Import ".\ID2D1SvgPaint.ahk" { ID2D1SvgPaint }
#Import ".\ID2D1SvgElement.ahk" { ID2D1SvgElement }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\D2D1_SVG_PATH_COMMAND.ahk" { D2D1_SVG_PATH_COMMAND }
#Import ".\ID2D1SvgStrokeDashArray.ahk" { ID2D1SvgStrokeDashArray }
#Import ".\ID2D1SvgPathData.ahk" { ID2D1SvgPathData }

/**
 * Represents an SVG document.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nn-d2d1svg-id2d1svgdocument
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1SvgDocument extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1SvgDocument
     * @type {Guid}
     */
    static IID := Guid("{86b88e4d-afa4-4d7b-88e4-68a51c4a0aec}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1SvgDocument interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
        SetViewportSize       : IntPtr
        GetViewportSize       : IntPtr
        SetRoot               : IntPtr
        GetRoot               : IntPtr
        FindElementById       : IntPtr
        Serialize             : IntPtr
        Deserialize           : IntPtr
        CreatePaint           : IntPtr
        CreateStrokeDashArray : IntPtr
        CreatePointCollection : IntPtr
        CreatePathData        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1SvgDocument.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the size of the initial viewport.
     * @param {D2D_SIZE_F} viewportSize Type: <b>D2D1_SIZE_F</b>
     * 
     * The size of the viewport.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgdocument-setviewportsize
     */
    SetViewportSize(viewportSize) {
        result := ComCall(4, this, D2D_SIZE_F, viewportSize, "HRESULT")
        return result
    }

    /**
     * Returns the size of the initial viewport.
     * @returns {D2D_SIZE_F} Type: <b>D2D1_SIZE_F</b>
     * 
     * Returns the size of the initial viewport
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgdocument-getviewportsize
     */
    GetViewportSize() {
        result := ComCall(5, this, D2D_SIZE_F)
        return result
    }

    /**
     * Sets the root element of the document.
     * @param {ID2D1SvgElement} root Type: <b>ID2D1SvgElement*</b>
     * 
     * The new root element of the document.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgdocument-setroot
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgdocument-getroot
     */
    GetRoot(root) {
        ComCall(7, this, ID2D1SvgElement.Ptr, root)
    }

    /**
     * Gets the SVG element with the specified ID.
     * @param {PWSTR} id Type: <b>PCWSTR</b>
     * 
     * ID of the element to retrieve.
     * @returns {ID2D1SvgElement} Type: <b>ID2D1SvgElement**</b>
     * 
     * The element matching the specified ID. If the element cannot be found, the returned element will be null.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgdocument-findelementbyid
     */
    FindElementById(id) {
        id := id is String ? StrPtr(id) : id

        result := ComCall(8, this, "ptr", id, "ptr*", &_svgElement := 0, "HRESULT")
        return ID2D1SvgElement(_svgElement)
    }

    /**
     * Serializes an element and its subtree to XML. The output XML is encoded as UTF-8.
     * @param {IStream} outputXmlStream Type: <b>IStream*</b>
     * 
     * An output stream to contain the SVG XML subtree.
     * @param {ID2D1SvgElement} subtree Type: <b>ID2D1SvgElement*</b>
     * 
     * The root of the subtree. If null, the entire document is serialized.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgdocument-serialize
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgdocument-deserialize
     */
    Deserialize(inputXmlStream) {
        result := ComCall(10, this, "ptr", inputXmlStream, "ptr*", &subtree := 0, "HRESULT")
        return ID2D1SvgElement(subtree)
    }

    /**
     * Creates a paint object which can be used to set the 'fill' or 'stroke' properties.
     * @param {D2D1_SVG_PAINT_TYPE} paintType 
     * @param {Pointer<D2D1_COLOR_F>} _color 
     * @param {PWSTR} id 
     * @returns {ID2D1SvgPaint} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1svgdocument-createpaint-overload
     */
    CreatePaint(paintType, _color, id) {
        id := id is String ? StrPtr(id) : id

        result := ComCall(11, this, D2D1_SVG_PAINT_TYPE, paintType, D2D1_COLOR_F.Ptr, _color, "ptr", id, "ptr*", &paint := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgdocument-createstrokedasharray
     */
    CreateStrokeDashArray(dashes, dashesCount) {
        result := ComCall(12, this, D2D1_SVG_LENGTH.Ptr, dashes, "uint", dashesCount, "ptr*", &strokeDashArray := 0, "HRESULT")
        return ID2D1SvgStrokeDashArray(strokeDashArray)
    }

    /**
     * Creates a points object which can be used to set a points attribute on a polygon or polyline element.
     * @param {Pointer<D2D_POINT_2F>} _points Type: <b>const D2D1_POINT_2F*</b>
     * 
     * The points in the point collection.
     * @param {Integer} pointsCount Type: <b>UINT32</b>
     * 
     * The number of points in the points argument.
     * @returns {ID2D1SvgPointCollection} Type: <b>ID2D1SvgPointCollection**</b>
     * 
     * The created <a href="https://docs.microsoft.com/windows/desktop/api/d2d1svg/nn-d2d1svg-id2d1svgpointcollection">ID2D1SvgPointCollection</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgdocument-createpointcollection
     */
    CreatePointCollection(_points, pointsCount) {
        result := ComCall(13, this, D2D_POINT_2F.Ptr, _points, "uint", pointsCount, "ptr*", &pointCollection := 0, "HRESULT")
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
     * @param {Pointer<D2D1_SVG_PATH_COMMAND>} commands Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1svg/ne-d2d1svg-d2d1_svg_path_command">D2D1_SVG_PATH_COMMAND</a>*</b>
     * 
     * An array of path commands.
     * @param {Integer} commandsCount Type: <b>UINT32</b>
     * 
     * The number of items in commands.
     * @returns {ID2D1SvgPathData} Type: <b>ID2D1SvgPathData**</b>
     * 
     * When this method completes, this points to the created path data.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgdocument-createpathdata
     */
    CreatePathData(segmentData, segmentDataCount, commands, commandsCount) {
        segmentDataMarshal := segmentData is VarRef ? "float*" : "ptr"
        commandsMarshal := commands is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, segmentDataMarshal, segmentData, "uint", segmentDataCount, commandsMarshal, commands, "uint", commandsCount, "ptr*", &_pathData := 0, "HRESULT")
        return ID2D1SvgPathData(_pathData)
    }

    Query(iid) {
        if (ID2D1SvgDocument.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetViewportSize := CallbackCreate(GetMethod(implObj, "SetViewportSize"), flags, 2)
        this.vtbl.GetViewportSize := CallbackCreate(GetMethod(implObj, "GetViewportSize"), flags, 1)
        this.vtbl.SetRoot := CallbackCreate(GetMethod(implObj, "SetRoot"), flags, 2)
        this.vtbl.GetRoot := CallbackCreate(GetMethod(implObj, "GetRoot"), flags, 2)
        this.vtbl.FindElementById := CallbackCreate(GetMethod(implObj, "FindElementById"), flags, 3)
        this.vtbl.Serialize := CallbackCreate(GetMethod(implObj, "Serialize"), flags, 3)
        this.vtbl.Deserialize := CallbackCreate(GetMethod(implObj, "Deserialize"), flags, 3)
        this.vtbl.CreatePaint := CallbackCreate(GetMethod(implObj, "CreatePaint"), flags, 5)
        this.vtbl.CreateStrokeDashArray := CallbackCreate(GetMethod(implObj, "CreateStrokeDashArray"), flags, 4)
        this.vtbl.CreatePointCollection := CallbackCreate(GetMethod(implObj, "CreatePointCollection"), flags, 4)
        this.vtbl.CreatePathData := CallbackCreate(GetMethod(implObj, "CreatePathData"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetViewportSize)
        CallbackFree(this.vtbl.GetViewportSize)
        CallbackFree(this.vtbl.SetRoot)
        CallbackFree(this.vtbl.GetRoot)
        CallbackFree(this.vtbl.FindElementById)
        CallbackFree(this.vtbl.Serialize)
        CallbackFree(this.vtbl.Deserialize)
        CallbackFree(this.vtbl.CreatePaint)
        CallbackFree(this.vtbl.CreateStrokeDashArray)
        CallbackFree(this.vtbl.CreatePointCollection)
        CallbackFree(this.vtbl.CreatePathData)
    }
}
