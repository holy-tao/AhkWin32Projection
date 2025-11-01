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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DrawGlyphRun", "DrawUnderline", "DrawStrikethrough", "DrawInlineObject"]

    /**
     * 
     * @param {Pointer<Void>} clientDrawingContext 
     * @param {Float} baselineOriginX 
     * @param {Float} baselineOriginY 
     * @param {Integer} measuringMode 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {Pointer<DWRITE_GLYPH_RUN_DESCRIPTION>} glyphRunDescription 
     * @param {IUnknown} clientDrawingEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextrenderer-drawglyphrun
     */
    DrawGlyphRun(clientDrawingContext, baselineOriginX, baselineOriginY, measuringMode, glyphRun, glyphRunDescription, clientDrawingEffect) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, clientDrawingContextMarshal, clientDrawingContext, "float", baselineOriginX, "float", baselineOriginY, "int", measuringMode, "ptr", glyphRun, "ptr", glyphRunDescription, "ptr", clientDrawingEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} clientDrawingContext 
     * @param {Float} baselineOriginX 
     * @param {Float} baselineOriginY 
     * @param {Pointer<DWRITE_UNDERLINE>} underline 
     * @param {IUnknown} clientDrawingEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextrenderer-drawunderline
     */
    DrawUnderline(clientDrawingContext, baselineOriginX, baselineOriginY, underline, clientDrawingEffect) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, clientDrawingContextMarshal, clientDrawingContext, "float", baselineOriginX, "float", baselineOriginY, "ptr", underline, "ptr", clientDrawingEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} clientDrawingContext 
     * @param {Float} baselineOriginX 
     * @param {Float} baselineOriginY 
     * @param {Pointer<DWRITE_STRIKETHROUGH>} strikethrough 
     * @param {IUnknown} clientDrawingEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextrenderer-drawstrikethrough
     */
    DrawStrikethrough(clientDrawingContext, baselineOriginX, baselineOriginY, strikethrough, clientDrawingEffect) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, clientDrawingContextMarshal, clientDrawingContext, "float", baselineOriginX, "float", baselineOriginY, "ptr", strikethrough, "ptr", clientDrawingEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} clientDrawingContext 
     * @param {Float} originX 
     * @param {Float} originY 
     * @param {IDWriteInlineObject} inlineObject 
     * @param {BOOL} isSideways 
     * @param {BOOL} isRightToLeft 
     * @param {IUnknown} clientDrawingEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextrenderer-drawinlineobject
     */
    DrawInlineObject(clientDrawingContext, originX, originY, inlineObject, isSideways, isRightToLeft, clientDrawingEffect) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, clientDrawingContextMarshal, clientDrawingContext, "float", originX, "float", originY, "ptr", inlineObject, "int", isSideways, "int", isRightToLeft, "ptr", clientDrawingEffect, "HRESULT")
        return result
    }
}
