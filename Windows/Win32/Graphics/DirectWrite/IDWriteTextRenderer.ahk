#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWritePixelSnapping.ahk

/**
 * Represents a set of application-defined callbacks that perform rendering of text, inline objects, and decorations such as underlines.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritetextrenderer
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextRenderer extends IDWritePixelSnapping{
    /**
     * The interface identifier for IDWriteTextRenderer
     * @type {Guid}
     */
    static IID => Guid("{ef8a8135-5cc6-45fe-8825-c5a0724eb819}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {Pointer<Void>} clientDrawingContext 
     * @param {Float} baselineOriginX 
     * @param {Float} baselineOriginY 
     * @param {Integer} measuringMode 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {Pointer<DWRITE_GLYPH_RUN_DESCRIPTION>} glyphRunDescription 
     * @param {Pointer<IUnknown>} clientDrawingEffect 
     * @returns {HRESULT} 
     */
    DrawGlyphRun(clientDrawingContext, baselineOriginX, baselineOriginY, measuringMode, glyphRun, glyphRunDescription, clientDrawingEffect) {
        result := ComCall(6, this, "ptr", clientDrawingContext, "float", baselineOriginX, "float", baselineOriginY, "int", measuringMode, "ptr", glyphRun, "ptr", glyphRunDescription, "ptr", clientDrawingEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} clientDrawingContext 
     * @param {Float} baselineOriginX 
     * @param {Float} baselineOriginY 
     * @param {Pointer<DWRITE_UNDERLINE>} underline 
     * @param {Pointer<IUnknown>} clientDrawingEffect 
     * @returns {HRESULT} 
     */
    DrawUnderline(clientDrawingContext, baselineOriginX, baselineOriginY, underline, clientDrawingEffect) {
        result := ComCall(7, this, "ptr", clientDrawingContext, "float", baselineOriginX, "float", baselineOriginY, "ptr", underline, "ptr", clientDrawingEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} clientDrawingContext 
     * @param {Float} baselineOriginX 
     * @param {Float} baselineOriginY 
     * @param {Pointer<DWRITE_STRIKETHROUGH>} strikethrough 
     * @param {Pointer<IUnknown>} clientDrawingEffect 
     * @returns {HRESULT} 
     */
    DrawStrikethrough(clientDrawingContext, baselineOriginX, baselineOriginY, strikethrough, clientDrawingEffect) {
        result := ComCall(8, this, "ptr", clientDrawingContext, "float", baselineOriginX, "float", baselineOriginY, "ptr", strikethrough, "ptr", clientDrawingEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} clientDrawingContext 
     * @param {Float} originX 
     * @param {Float} originY 
     * @param {Pointer<IDWriteInlineObject>} inlineObject 
     * @param {BOOL} isSideways 
     * @param {BOOL} isRightToLeft 
     * @param {Pointer<IUnknown>} clientDrawingEffect 
     * @returns {HRESULT} 
     */
    DrawInlineObject(clientDrawingContext, originX, originY, inlineObject, isSideways, isRightToLeft, clientDrawingEffect) {
        result := ComCall(9, this, "ptr", clientDrawingContext, "float", originX, "float", originY, "ptr", inlineObject, "int", isSideways, "int", isRightToLeft, "ptr", clientDrawingEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
