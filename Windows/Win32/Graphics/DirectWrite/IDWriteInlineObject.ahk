#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DWRITE_INLINE_OBJECT_METRICS.ahk
#Include .\DWRITE_OVERHANG_METRICS.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Wraps an application-defined inline graphic, allowing DWrite to query metrics as if the graphic were a glyph inline with the text.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwriteinlineobject
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteInlineObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteInlineObject
     * @type {Guid}
     */
    static IID => Guid("{8339fde3-106f-47ab-8373-1c6295eb10b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Draw", "GetMetrics", "GetOverhangMetrics", "GetBreakConditions"]

    /**
     * The application implemented rendering callback (IDWriteTextRenderer::DrawInlineObject) can use this to draw the inline object without needing to cast or query the object type. The text layout does not call this method directly.
     * @param {Pointer<Void>} clientDrawingContext Type: <b>void*</b>
     * 
     * The drawing context passed to <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-draw">IDWriteTextLayout::Draw</a>.  This parameter may be <b>NULL</b>.
     * @param {IDWriteTextRenderer} renderer Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextrenderer">IDWriteTextRenderer</a>*</b>
     * 
     * The same renderer passed to <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-draw">IDWriteTextLayout::Draw</a> as the object's containing parent.  This is useful if the inline object is recursive such as a nested layout.
     * @param {Float} originX Type: <b>FLOAT</b>
     * 
     * The x-coordinate at the upper-left corner of the inline object.
     * @param {Float} originY Type: <b>FLOAT</b>
     * 
     * The y-coordinate at the upper-left corner of the inline object.
     * @param {BOOL} isSideways Type: <b>BOOL</b>
     * 
     * A Boolean flag that indicates whether the object's baseline runs alongside the baseline axis of the line.
     * @param {BOOL} isRightToLeft Type: <b>BOOL</b>
     * 
     * A Boolean flag that indicates whether the object is in a right-to-left context and should be drawn flipped.
     * @param {IUnknown} clientDrawingEffect Type: <b>IUnknown*</b>
     * 
     * The drawing effect set in <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-setdrawingeffect">IDWriteTextLayout::SetDrawingEffect</a>.  Usually this effect is a foreground brush that  is used in glyph drawing.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwriteinlineobject-draw
     */
    Draw(clientDrawingContext, renderer, originX, originY, isSideways, isRightToLeft, clientDrawingEffect) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, clientDrawingContextMarshal, clientDrawingContext, "ptr", renderer, "float", originX, "float", originY, "int", isSideways, "int", isRightToLeft, "ptr", clientDrawingEffect, "HRESULT")
        return result
    }

    /**
     * IDWriteTextLayout calls this callback function to get the measurement of the inline object.
     * @returns {DWRITE_INLINE_OBJECT_METRICS} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_inline_object_metrics">DWRITE_INLINE_OBJECT_METRICS</a>*</b>
     * 
     * When this method returns, contains a structure describing the geometric measurement of an
     * application-defined inline object.  These metrics are in relation to the baseline of the adjacent text.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwriteinlineobject-getmetrics
     */
    GetMetrics() {
        metrics := DWRITE_INLINE_OBJECT_METRICS()
        result := ComCall(4, this, "ptr", metrics, "HRESULT")
        return metrics
    }

    /**
     * IDWriteTextLayout calls this callback function to get the visible extents (in DIPs) of the inline object. In the case of a simple bitmap, with no padding and no overhang, all the overhangs will simply be zeroes.
     * @returns {DWRITE_OVERHANG_METRICS} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_overhang_metrics">DWRITE_OVERHANG_METRICS</a>*</b>
     * 
     * Overshoot of visible extents (in DIPs) outside the object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwriteinlineobject-getoverhangmetrics
     */
    GetOverhangMetrics() {
        overhangs := DWRITE_OVERHANG_METRICS()
        result := ComCall(5, this, "ptr", overhangs, "HRESULT")
        return overhangs
    }

    /**
     * Layout uses this to determine the line-breaking behavior of the inline object among the text.
     * @param {Pointer<Integer>} breakConditionBefore Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_break_condition">DWRITE_BREAK_CONDITION</a>*</b>
     * 
     * When this method returns, contains a value which indicates the line-breaking condition between the object and the content immediately preceding it.
     * @param {Pointer<Integer>} breakConditionAfter Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_break_condition">DWRITE_BREAK_CONDITION</a>*</b>
     * 
     * When this method returns, contains a value which indicates the line-breaking condition between the object and the content immediately following it.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwriteinlineobject-getbreakconditions
     */
    GetBreakConditions(breakConditionBefore, breakConditionAfter) {
        breakConditionBeforeMarshal := breakConditionBefore is VarRef ? "int*" : "ptr"
        breakConditionAfterMarshal := breakConditionAfter is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, breakConditionBeforeMarshal, breakConditionBefore, breakConditionAfterMarshal, breakConditionAfter, "HRESULT")
        return result
    }
}
