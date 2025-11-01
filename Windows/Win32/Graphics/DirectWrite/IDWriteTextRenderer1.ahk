#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteTextRenderer.ahk

/**
 * Represents a set of application-defined callbacks that perform rendering of text, inline objects, and decorations such as underlines.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nn-dwrite_2-idwritetextrenderer1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextRenderer1 extends IDWriteTextRenderer{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteTextRenderer1
     * @type {Guid}
     */
    static IID => Guid("{d3e0e934-22a0-427e-aae4-7d9574b59db1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

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
     * @param {Integer} orientationAngle 
     * @param {Integer} measuringMode 
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun 
     * @param {Pointer<DWRITE_GLYPH_RUN_DESCRIPTION>} glyphRunDescription 
     * @param {IUnknown} clientDrawingEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextrenderer1-drawglyphrun
     */
    DrawGlyphRun(clientDrawingContext, baselineOriginX, baselineOriginY, orientationAngle, measuringMode, glyphRun, glyphRunDescription, clientDrawingEffect) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, clientDrawingContextMarshal, clientDrawingContext, "float", baselineOriginX, "float", baselineOriginY, "int", orientationAngle, "int", measuringMode, "ptr", glyphRun, "ptr", glyphRunDescription, "ptr", clientDrawingEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} clientDrawingContext 
     * @param {Float} baselineOriginX 
     * @param {Float} baselineOriginY 
     * @param {Integer} orientationAngle 
     * @param {Pointer<DWRITE_UNDERLINE>} underline 
     * @param {IUnknown} clientDrawingEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextrenderer1-drawunderline
     */
    DrawUnderline(clientDrawingContext, baselineOriginX, baselineOriginY, orientationAngle, underline, clientDrawingEffect) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, clientDrawingContextMarshal, clientDrawingContext, "float", baselineOriginX, "float", baselineOriginY, "int", orientationAngle, "ptr", underline, "ptr", clientDrawingEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} clientDrawingContext 
     * @param {Float} baselineOriginX 
     * @param {Float} baselineOriginY 
     * @param {Integer} orientationAngle 
     * @param {Pointer<DWRITE_STRIKETHROUGH>} strikethrough 
     * @param {IUnknown} clientDrawingEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextrenderer1-drawstrikethrough
     */
    DrawStrikethrough(clientDrawingContext, baselineOriginX, baselineOriginY, orientationAngle, strikethrough, clientDrawingEffect) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        result := ComCall(12, this, clientDrawingContextMarshal, clientDrawingContext, "float", baselineOriginX, "float", baselineOriginY, "int", orientationAngle, "ptr", strikethrough, "ptr", clientDrawingEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} clientDrawingContext 
     * @param {Float} originX 
     * @param {Float} originY 
     * @param {Integer} orientationAngle 
     * @param {IDWriteInlineObject} inlineObject 
     * @param {BOOL} isSideways 
     * @param {BOOL} isRightToLeft 
     * @param {IUnknown} clientDrawingEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextrenderer1-drawinlineobject
     */
    DrawInlineObject(clientDrawingContext, originX, originY, orientationAngle, inlineObject, isSideways, isRightToLeft, clientDrawingEffect) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        result := ComCall(13, this, clientDrawingContextMarshal, clientDrawingContext, "float", originX, "float", originY, "int", orientationAngle, "ptr", inlineObject, "int", isSideways, "int", isRightToLeft, "ptr", clientDrawingEffect, "HRESULT")
        return result
    }
}
