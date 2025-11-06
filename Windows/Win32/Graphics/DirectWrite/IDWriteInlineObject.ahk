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
     * 
     * @param {Pointer<Void>} clientDrawingContext 
     * @param {IDWriteTextRenderer} renderer 
     * @param {Float} originX 
     * @param {Float} originY 
     * @param {BOOL} isSideways 
     * @param {BOOL} isRightToLeft 
     * @param {IUnknown} clientDrawingEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriteinlineobject-draw
     */
    Draw(clientDrawingContext, renderer, originX, originY, isSideways, isRightToLeft, clientDrawingEffect) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, clientDrawingContextMarshal, clientDrawingContext, "ptr", renderer, "float", originX, "float", originY, "int", isSideways, "int", isRightToLeft, "ptr", clientDrawingEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DWRITE_INLINE_OBJECT_METRICS} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriteinlineobject-getmetrics
     */
    GetMetrics() {
        metrics := DWRITE_INLINE_OBJECT_METRICS()
        result := ComCall(4, this, "ptr", metrics, "HRESULT")
        return metrics
    }

    /**
     * 
     * @returns {DWRITE_OVERHANG_METRICS} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwriteinlineobject-getoverhangmetrics
     */
    GetOverhangMetrics() {
        overhangs := DWRITE_OVERHANG_METRICS()
        result := ComCall(5, this, "ptr", overhangs, "HRESULT")
        return overhangs
    }

    /**
     * 
     * @param {Pointer<Integer>} breakConditionBefore 
     * @param {Pointer<Integer>} breakConditionAfter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriteinlineobject-getbreakconditions
     */
    GetBreakConditions(breakConditionBefore, breakConditionAfter) {
        breakConditionBeforeMarshal := breakConditionBefore is VarRef ? "int*" : "ptr"
        breakConditionAfterMarshal := breakConditionAfter is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, breakConditionBeforeMarshal, breakConditionBefore, breakConditionAfterMarshal, breakConditionAfter, "HRESULT")
        return result
    }
}
