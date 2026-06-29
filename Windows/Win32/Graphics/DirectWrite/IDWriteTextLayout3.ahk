#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DWRITE_LINE_METRICS1.ahk" { DWRITE_LINE_METRICS1 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteTextLayout2.ahk" { IDWriteTextLayout2 }
#Import ".\DWRITE_LINE_SPACING.ahk" { DWRITE_LINE_SPACING }

/**
 * Represents a block of text after it has been fully analyzed and formatted. | IDWriteTextLayout3 interface
 * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritetextlayout3
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteTextLayout3 extends IDWriteTextLayout2 {
    /**
     * The interface identifier for IDWriteTextLayout3
     * @type {Guid}
     */
    static IID := Guid("{07ddcd52-020e-4de8-ac33-6c953d83f92d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteTextLayout3 interfaces
    */
    struct Vtbl extends IDWriteTextLayout2.Vtbl {
        InvalidateLayout : IntPtr
        SetLineSpacing   : IntPtr
        GetLineSpacing   : IntPtr
        GetLineMetrics   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteTextLayout3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Invalidates the layout, forcing layout to remeasure before calling the metrics or drawing functions. This is useful if the locality of a font changes, and layout should be redrawn, or if the size of a client implemented IDWriteInlineObject changes.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritetextlayout3-invalidatelayout
     */
    InvalidateLayout() {
        result := ComCall(80, this, "HRESULT")
        return result
    }

    /**
     * Set line spacing. | IDWriteTextLayout3 SetLineSpacing method
     * @param {Pointer<DWRITE_LINE_SPACING>} lineSpacingOptions How to manage space between lines.
     * @returns {HRESULT} If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritetextlayout3-setlinespacing
     */
    SetLineSpacing(lineSpacingOptions) {
        result := ComCall(81, this, DWRITE_LINE_SPACING.Ptr, lineSpacingOptions, "HRESULT")
        return result
    }

    /**
     * Gets line spacing information.
     * @returns {DWRITE_LINE_SPACING} How to manage space between lines.
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritetextlayout3-getlinespacing
     */
    GetLineSpacing() {
        lineSpacingOptions := DWRITE_LINE_SPACING()
        result := ComCall(82, this, DWRITE_LINE_SPACING.Ptr, lineSpacingOptions, "HRESULT")
        return lineSpacingOptions
    }

    /**
     * Retrieves properties of each line.
     * @remarks
     * If maxLineCount is not large enough E\_NOT\_SUFFICIENT\_BUFFER, which is equivalent to HRESULT\_FROM\_WIN32(ERROR\_INSUFFICIENT\_BUFFER), is returned and actualLineCount is set to the number of lines needed.
     * @param {Pointer<DWRITE_LINE_METRICS1>} lineMetrics The array to fill with line information.
     * @param {Integer} maxLineCount The maximum size of the lineMetrics array.
     * @param {Pointer<Integer>} actualLineCount The actual size of the lineMetrics array that is needed.
     * @returns {HRESULT} If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritetextlayout3-getlinemetrics
     */
    GetLineMetrics(lineMetrics, maxLineCount, actualLineCount) {
        actualLineCountMarshal := actualLineCount is VarRef ? "uint*" : "ptr"

        result := ComCall(83, this, DWRITE_LINE_METRICS1.Ptr, lineMetrics, "uint", maxLineCount, actualLineCountMarshal, actualLineCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDWriteTextLayout3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InvalidateLayout := CallbackCreate(GetMethod(implObj, "InvalidateLayout"), flags, 1)
        this.vtbl.SetLineSpacing := CallbackCreate(GetMethod(implObj, "SetLineSpacing"), flags, 2)
        this.vtbl.GetLineSpacing := CallbackCreate(GetMethod(implObj, "GetLineSpacing"), flags, 2)
        this.vtbl.GetLineMetrics := CallbackCreate(GetMethod(implObj, "GetLineMetrics"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InvalidateLayout)
        CallbackFree(this.vtbl.SetLineSpacing)
        CallbackFree(this.vtbl.GetLineSpacing)
        CallbackFree(this.vtbl.GetLineMetrics)
    }
}
