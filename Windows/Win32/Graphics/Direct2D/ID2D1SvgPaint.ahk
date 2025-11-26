#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1SvgAttribute.ahk

/**
 * Interface describing an SVG fill or stroke value.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nn-d2d1svg-id2d1svgpaint
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1SvgPaint extends ID2D1SvgAttribute{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1SvgPaint
     * @type {Guid}
     */
    static IID => Guid("{d59bab0a-68a2-455b-a5dc-9eb2854e2490}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPaintType", "GetPaintType", "SetColor", "GetColor", "SetId", "GetId", "GetIdLength"]

    /**
     * Sets the paint type.
     * @param {Integer} paintType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1svg/ne-d2d1svg-d2d1_svg_paint_type">D2D1_SVG_PAINT_TYPE</a></b>
     * 
     * The new paint type.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgpaint-setpainttype
     */
    SetPaintType(paintType) {
        result := ComCall(6, this, "int", paintType, "HRESULT")
        return result
    }

    /**
     * Gets the paint type.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d2d1svg/ne-d2d1svg-d2d1_svg_paint_type">D2D1_SVG_PAINT_TYPE</a></b>
     * 
     * Returns the paint type.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgpaint-getpainttype
     */
    GetPaintType() {
        result := ComCall(7, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_COLOR_F>} color 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1svgpaint-setcolor-overload
     */
    SetColor(color) {
        result := ComCall(8, this, "ptr", color, "HRESULT")
        return result
    }

    /**
     * Gets the paint color that is used if the paint type is D2D1_SVG_PAINT_TYPE_COLOR.
     * @param {Pointer<D2D1_COLOR_F>} color Type: <b>D2D1_COLOR_F*</b>
     * 
     * The paint color that is used if the paint type is D2D1_SVG_PAINT_TYPE_COLOR.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgpaint-getcolor
     */
    GetColor(color) {
        ComCall(9, this, "ptr", color)
    }

    /**
     * Sets the element id which acts as the paint server. This id is used if the paint type is D2D1_SVG_PAINT_TYPE_URI.
     * @param {PWSTR} id Type: <b>PCWSTR</b>
     * 
     * The element id which acts as the paint server. This id is used if the paint type is D2D1_SVG_PAINT_TYPE_URI.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgpaint-setid
     */
    SetId(id) {
        id := id is String ? StrPtr(id) : id

        result := ComCall(10, this, "ptr", id, "HRESULT")
        return result
    }

    /**
     * Gets the element id which acts as the paint server. This id is used if the paint type is D2D1_SVG_PAINT_TYPE_URI.
     * @param {PWSTR} id Type: <b>PWSTR</b>
     * 
     * The element id which acts as the paint server.
     * @param {Integer} idCount Type: <b>UINT32</b>
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgpaint-getid
     */
    GetId(id, idCount) {
        id := id is String ? StrPtr(id) : id

        result := ComCall(11, this, "ptr", id, "uint", idCount, "HRESULT")
        return result
    }

    /**
     * Gets the string length of the element id which acts as the paint server. This id is used if the paint type is D2D1_SVG_PAINT_TYPE_URI.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * the string length of the element id which acts as the paint server. The returned string length does not include room for the null terminator.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgpaint-getidlength
     */
    GetIdLength() {
        result := ComCall(12, this, "uint")
        return result
    }
}
