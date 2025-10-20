#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Resource.ahk

/**
 * This object supplies the values for context-fill, context-stroke, and context-value that are used when rendering SVG glyphs.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1svgglyphstyle
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1SvgGlyphStyle extends ID2D1Resource{
    /**
     * The interface identifier for ID2D1SvgGlyphStyle
     * @type {Guid}
     */
    static IID => Guid("{af671749-d241-4db8-8e41-dcc2e5c1a438}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Pointer<ID2D1Brush>} brush 
     * @returns {HRESULT} 
     */
    SetFill(brush) {
        result := ComCall(4, this, "ptr", brush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1Brush>} brush 
     * @returns {String} Nothing - always returns an empty string
     */
    GetFill(brush) {
        ComCall(5, this, "ptr", brush)
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1Brush>} brush 
     * @param {Float} strokeWidth 
     * @param {Pointer<Single>} dashes 
     * @param {Integer} dashesCount 
     * @param {Float} dashOffset 
     * @returns {HRESULT} 
     */
    SetStroke(brush, strokeWidth, dashes, dashesCount, dashOffset) {
        result := ComCall(6, this, "ptr", brush, "float", strokeWidth, "float*", dashes, "uint", dashesCount, "float", dashOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetStrokeDashesCount() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1Brush>} brush 
     * @param {Pointer<Single>} strokeWidth 
     * @param {Pointer<Single>} dashes 
     * @param {Integer} dashesCount 
     * @param {Pointer<Single>} dashOffset 
     * @returns {String} Nothing - always returns an empty string
     */
    GetStroke(brush, strokeWidth, dashes, dashesCount, dashOffset) {
        ComCall(8, this, "ptr", brush, "float*", strokeWidth, "float*", dashes, "uint", dashesCount, "float*", dashOffset)
        return result
    }
}
