#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Wraps an application-defined inline graphic, allowing DWrite to query metrics as if the graphic were a glyph inline with the text.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwriteinlineobject
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteInlineObject extends IUnknown{
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
     * 
     * @param {Pointer<Void>} clientDrawingContext 
     * @param {Pointer<IDWriteTextRenderer>} renderer 
     * @param {Float} originX 
     * @param {Float} originY 
     * @param {BOOL} isSideways 
     * @param {BOOL} isRightToLeft 
     * @param {Pointer<IUnknown>} clientDrawingEffect 
     * @returns {HRESULT} 
     */
    Draw(clientDrawingContext, renderer, originX, originY, isSideways, isRightToLeft, clientDrawingEffect) {
        result := ComCall(3, this, "ptr", clientDrawingContext, "ptr", renderer, "float", originX, "float", originY, "int", isSideways, "int", isRightToLeft, "ptr", clientDrawingEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_INLINE_OBJECT_METRICS>} metrics 
     * @returns {HRESULT} 
     */
    GetMetrics(metrics) {
        result := ComCall(4, this, "ptr", metrics, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_OVERHANG_METRICS>} overhangs 
     * @returns {HRESULT} 
     */
    GetOverhangMetrics(overhangs) {
        result := ComCall(5, this, "ptr", overhangs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} breakConditionBefore 
     * @param {Pointer<Int32>} breakConditionAfter 
     * @returns {HRESULT} 
     */
    GetBreakConditions(breakConditionBefore, breakConditionAfter) {
        result := ComCall(6, this, "int*", breakConditionBefore, "int*", breakConditionAfter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
