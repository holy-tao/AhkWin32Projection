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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFill", "GetFill", "SetStroke", "GetStrokeDashesCount", "GetStroke"]

    /**
     * 
     * @param {ID2D1Brush} brush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1svgglyphstyle-setfill
     */
    SetFill(brush) {
        result := ComCall(4, this, "ptr", brush, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1Brush>} brush 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1svgglyphstyle-getfill
     */
    GetFill(brush) {
        ComCall(5, this, "ptr*", brush)
    }

    /**
     * 
     * @param {ID2D1Brush} brush 
     * @param {Float} strokeWidth 
     * @param {Pointer<Float>} dashes 
     * @param {Integer} dashesCount 
     * @param {Float} dashOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1svgglyphstyle-setstroke
     */
    SetStroke(brush, strokeWidth, dashes, dashesCount, dashOffset) {
        dashesMarshal := dashes is VarRef ? "float*" : "ptr"

        result := ComCall(6, this, "ptr", brush, "float", strokeWidth, dashesMarshal, dashes, "uint", dashesCount, "float", dashOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1svgglyphstyle-getstrokedashescount
     */
    GetStrokeDashesCount() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1Brush>} brush 
     * @param {Pointer<Float>} strokeWidth 
     * @param {Pointer<Float>} dashes 
     * @param {Integer} dashesCount 
     * @param {Pointer<Float>} dashOffset 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1svgglyphstyle-getstroke
     */
    GetStroke(brush, strokeWidth, dashes, dashesCount, dashOffset) {
        strokeWidthMarshal := strokeWidth is VarRef ? "float*" : "ptr"
        dashesMarshal := dashes is VarRef ? "float*" : "ptr"
        dashOffsetMarshal := dashOffset is VarRef ? "float*" : "ptr"

        ComCall(8, this, "ptr*", brush, strokeWidthMarshal, strokeWidth, dashesMarshal, dashes, "uint", dashesCount, dashOffsetMarshal, dashOffset)
    }
}
