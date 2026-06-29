#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DWRITE_OVERHANG_METRICS.ahk" { DWRITE_OVERHANG_METRICS }
#Import ".\DWRITE_INLINE_OBJECT_METRICS.ahk" { DWRITE_INLINE_OBJECT_METRICS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DWRITE_BREAK_CONDITION.ahk" { DWRITE_BREAK_CONDITION }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDWriteTextRenderer.ahk" { IDWriteTextRenderer }

/**
 * Wraps an application-defined inline graphic, allowing DWrite to query metrics as if the graphic were a glyph inline with the text.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriteinlineobject
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteInlineObject extends IUnknown {
    /**
     * The interface identifier for IDWriteInlineObject
     * @type {Guid}
     */
    static IID := Guid("{8339fde3-106f-47ab-8373-1c6295eb10b3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteInlineObject interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Draw               : IntPtr
        GetMetrics         : IntPtr
        GetOverhangMetrics : IntPtr
        GetBreakConditions : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteInlineObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriteinlineobject-draw
     */
    Draw(clientDrawingContext, renderer, originX, originY, isSideways, isRightToLeft, clientDrawingEffect) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, clientDrawingContextMarshal, clientDrawingContext, "ptr", renderer, "float", originX, "float", originY, BOOL, isSideways, BOOL, isRightToLeft, "ptr", clientDrawingEffect, "HRESULT")
        return result
    }

    /**
     * IDWriteTextLayout calls this callback function to get the measurement of the inline object.
     * @returns {DWRITE_INLINE_OBJECT_METRICS} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_inline_object_metrics">DWRITE_INLINE_OBJECT_METRICS</a>*</b>
     * 
     * When this method returns, contains a structure describing the geometric measurement of an
     * application-defined inline object.  These metrics are in relation to the baseline of the adjacent text.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriteinlineobject-getmetrics
     */
    GetMetrics() {
        metrics := DWRITE_INLINE_OBJECT_METRICS()
        result := ComCall(4, this, DWRITE_INLINE_OBJECT_METRICS.Ptr, metrics, "HRESULT")
        return metrics
    }

    /**
     * IDWriteTextLayout calls this callback function to get the visible extents (in DIPs) of the inline object. In the case of a simple bitmap, with no padding and no overhang, all the overhangs will simply be zeroes.
     * @returns {DWRITE_OVERHANG_METRICS} Type: **[**DWRITE\_OVERHANG\_METRICS**](/windows/win32/api/dwrite/ns-dwrite-dwrite_overhang_metrics)\***
     * 
     * Overshoot of visible extents (in DIPs) outside the object.
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwriteinlineobject-getoverhangmetrics
     */
    GetOverhangMetrics() {
        overhangs := DWRITE_OVERHANG_METRICS()
        result := ComCall(5, this, DWRITE_OVERHANG_METRICS.Ptr, overhangs, "HRESULT")
        return overhangs
    }

    /**
     * Layout uses this to determine the line-breaking behavior of the inline object among the text.
     * @param {Pointer<DWRITE_BREAK_CONDITION>} breakConditionBefore Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_break_condition">DWRITE_BREAK_CONDITION</a>*</b>
     * 
     * When this method returns, contains a value which indicates the line-breaking condition between the object and the content immediately preceding it.
     * @param {Pointer<DWRITE_BREAK_CONDITION>} breakConditionAfter Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_break_condition">DWRITE_BREAK_CONDITION</a>*</b>
     * 
     * When this method returns, contains a value which indicates the line-breaking condition between the object and the content immediately following it.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriteinlineobject-getbreakconditions
     */
    GetBreakConditions(breakConditionBefore, breakConditionAfter) {
        breakConditionBeforeMarshal := breakConditionBefore is VarRef ? "int*" : "ptr"
        breakConditionAfterMarshal := breakConditionAfter is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, breakConditionBeforeMarshal, breakConditionBefore, breakConditionAfterMarshal, breakConditionAfter, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDWriteInlineObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Draw := CallbackCreate(GetMethod(implObj, "Draw"), flags, 8)
        this.vtbl.GetMetrics := CallbackCreate(GetMethod(implObj, "GetMetrics"), flags, 2)
        this.vtbl.GetOverhangMetrics := CallbackCreate(GetMethod(implObj, "GetOverhangMetrics"), flags, 2)
        this.vtbl.GetBreakConditions := CallbackCreate(GetMethod(implObj, "GetBreakConditions"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Draw)
        CallbackFree(this.vtbl.GetMetrics)
        CallbackFree(this.vtbl.GetOverhangMetrics)
        CallbackFree(this.vtbl.GetBreakConditions)
    }
}
