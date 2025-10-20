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
     * 
     * @param {Integer} paintType 
     * @returns {HRESULT} 
     */
    SetPaintType(paintType) {
        result := ComCall(6, this, "int", paintType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPaintType() {
        result := ComCall(7, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_COLOR_F>} color 
     * @returns {HRESULT} 
     */
    SetColor(color) {
        result := ComCall(8, this, "ptr", color, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_COLOR_F>} color 
     * @returns {String} Nothing - always returns an empty string
     */
    GetColor(color) {
        ComCall(9, this, "ptr", color)
        return result
    }

    /**
     * 
     * @param {PWSTR} id 
     * @returns {HRESULT} 
     */
    SetId(id) {
        id := id is String ? StrPtr(id) : id

        result := ComCall(10, this, "ptr", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} id 
     * @param {Integer} idCount 
     * @returns {HRESULT} 
     */
    GetId(id, idCount) {
        id := id is String ? StrPtr(id) : id

        result := ComCall(11, this, "ptr", id, "uint", idCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetIdLength() {
        result := ComCall(12, this, "uint")
        return result
    }
}
