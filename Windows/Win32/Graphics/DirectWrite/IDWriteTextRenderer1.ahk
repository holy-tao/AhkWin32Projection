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
     * IDWriteTextLayout::Draw calls this function to instruct the client to render a run of glyphs.
     * @param {Pointer<Void>} clientDrawingContext Type: <b>void*</b>
     * 
     * The application-defined drawing context passed to 
     *      <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-draw">IDWriteTextLayout::Draw</a>.
     * @param {Float} baselineOriginX Type: <b>FLOAT</b>
     * 
     * The pixel location (X-coordinate) at the baseline origin of the glyph run.
     * @param {Float} baselineOriginY Type: <b>FLOAT</b>
     * 
     * The pixel location (Y-coordinate) at the baseline origin of the glyph run.
     * @param {Integer} orientationAngle Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_glyph_orientation_angle">DWRITE_GLYPH_ORIENTATION_ANGLE</a></b>
     * 
     * Orientation of the glyph run.
     * @param {Integer} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * The measuring method for glyphs in the run, used with the other properties to determine the rendering mode.
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a>*</b>
     * 
     * Pointer to the glyph run instance to render.
     * @param {Pointer<DWRITE_GLYPH_RUN_DESCRIPTION>} glyphRunDescription Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run_description">DWRITE_GLYPH_RUN_DESCRIPTION</a>*</b>
     * 
     * A pointer to the glyph run description instance which contains properties of the characters 
     *      associated with this run.
     * @param {IUnknown} clientDrawingEffect Type: <b>IUnknown*</b>
     * 
     * Application-defined drawing effects for the glyphs to render. Usually this argument represents effects such as the foreground brush filling the interior of text.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextrenderer1-drawglyphrun
     */
    DrawGlyphRun(clientDrawingContext, baselineOriginX, baselineOriginY, orientationAngle, measuringMode, glyphRun, glyphRunDescription, clientDrawingEffect) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, clientDrawingContextMarshal, clientDrawingContext, "float", baselineOriginX, "float", baselineOriginY, "int", orientationAngle, "int", measuringMode, "ptr", glyphRun, "ptr", glyphRunDescription, "ptr", clientDrawingEffect, "HRESULT")
        return result
    }

    /**
     * IDWriteTextLayout::Draw calls this function to instruct the client to draw an underline.
     * @param {Pointer<Void>} clientDrawingContext Type: <b>void*</b>
     * 
     * The application-defined drawing context passed to 
     *      IDWriteTextLayout::<a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriteinlineobject-draw">Draw</a>.
     * @param {Float} baselineOriginX Type: <b>FLOAT</b>
     * 
     * The pixel location (X-coordinate) at the baseline origin of the run where underline applies.
     * @param {Float} baselineOriginY Type: <b>FLOAT</b>
     * 
     * The pixel location (Y-coordinate) at the baseline origin of the run where underline applies.
     * @param {Integer} orientationAngle Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_glyph_orientation_angle">DWRITE_GLYPH_ORIENTATION_ANGLE</a></b>
     * 
     * Orientation of the underline.
     * @param {Pointer<DWRITE_UNDERLINE>} underline Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_underline">DWRITE_UNDERLINE</a>*</b>
     * 
     * Pointer to  a structure containing underline logical information.
     * @param {IUnknown} clientDrawingEffect Type: <b>IUnknown*</b>
     * 
     *  Application-defined effect to apply to the underline. Usually this argument represents effects such as the foreground brush filling the interior of a line.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextrenderer1-drawunderline
     */
    DrawUnderline(clientDrawingContext, baselineOriginX, baselineOriginY, orientationAngle, underline, clientDrawingEffect) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, clientDrawingContextMarshal, clientDrawingContext, "float", baselineOriginX, "float", baselineOriginY, "int", orientationAngle, "ptr", underline, "ptr", clientDrawingEffect, "HRESULT")
        return result
    }

    /**
     * IDWriteTextLayout::Draw calls this function to instruct the client to draw a strikethrough.
     * @param {Pointer<Void>} clientDrawingContext Type: <b>void*</b>
     * 
     * The application-defined drawing context passed to 
     *      IDWriteTextLayout::<a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriteinlineobject-draw">Draw</a>.
     * @param {Float} baselineOriginX Type: <b>FLOAT</b>
     * 
     * The pixel location (X-coordinate) at the baseline origin of the run where strikethrough applies.
     * @param {Float} baselineOriginY Type: <b>FLOAT</b>
     * 
     * The pixel location (Y-coordinate) at the baseline origin of the run where strikethrough applies.
     * @param {Integer} orientationAngle Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_glyph_orientation_angle">DWRITE_GLYPH_ORIENTATION_ANGLE</a></b>
     * 
     * Orientation of the strikethrough.
     * @param {Pointer<DWRITE_STRIKETHROUGH>} strikethrough Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_strikethrough">DWRITE_STRIKETHROUGH</a>*</b>
     * 
     * Pointer to  a structure containing strikethrough logical information.
     * @param {IUnknown} clientDrawingEffect Type: <b>IUnknown*</b>
     * 
     * Application-defined effect to apply to the strikethrough.  Usually this argument represents effects such as the foreground brush filling the interior of a line.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextrenderer1-drawstrikethrough
     */
    DrawStrikethrough(clientDrawingContext, baselineOriginX, baselineOriginY, orientationAngle, strikethrough, clientDrawingEffect) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        result := ComCall(12, this, clientDrawingContextMarshal, clientDrawingContext, "float", baselineOriginX, "float", baselineOriginY, "int", orientationAngle, "ptr", strikethrough, "ptr", clientDrawingEffect, "HRESULT")
        return result
    }

    /**
     * IDWriteTextLayout::Draw calls this application callback when it needs to draw an inline object.
     * @param {Pointer<Void>} clientDrawingContext Type: <b>void*</b>
     * 
     * The application-defined drawing context passed to IDWriteTextLayout::<a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriteinlineobject-draw">Draw</a>.
     * @param {Float} originX Type: <b>FLOAT</b>
     * 
     * X-coordinate at the top-left corner of the inline object.
     * @param {Float} originY Type: <b>FLOAT</b>
     * 
     * Y-coordinate at the top-left corner of the inline object.
     * @param {Integer} orientationAngle Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_glyph_orientation_angle">DWRITE_GLYPH_ORIENTATION_ANGLE</a></b>
     * 
     * Orientation of the inline object.
     * @param {IDWriteInlineObject} inlineObject Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriteinlineobject">IDWriteInlineObject</a>*</b>
     * 
     * The application-defined inline object set using <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextformat">IDWriteTextFormat</a>::<a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-setinlineobject">SetInlineObject</a>.
     * @param {BOOL} isSideways Type: <b>BOOL</b>
     * 
     * A Boolean flag that indicates whether the object's baseline runs alongside the baseline axis of the line.
     * @param {BOOL} isRightToLeft Type: <b>BOOL</b>
     * 
     * A Boolean flag that indicates whether the object is in a right-to-left context, hinting that the drawing may want to mirror the normal image.
     * @param {IUnknown} clientDrawingEffect Type: <b>IUnknown*</b>
     * 
     * Application-defined drawing effects for the glyphs to render. Usually this argument represents effects such as the foreground brush filling the interior of a line.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritetextrenderer1-drawinlineobject
     */
    DrawInlineObject(clientDrawingContext, originX, originY, orientationAngle, inlineObject, isSideways, isRightToLeft, clientDrawingEffect) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        result := ComCall(13, this, clientDrawingContextMarshal, clientDrawingContext, "float", originX, "float", originY, "int", orientationAngle, "ptr", inlineObject, "int", isSideways, "int", isRightToLeft, "ptr", clientDrawingEffect, "HRESULT")
        return result
    }
}
