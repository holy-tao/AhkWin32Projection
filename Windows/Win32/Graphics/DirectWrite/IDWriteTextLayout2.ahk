#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteFontFallback.ahk" { IDWriteFontFallback }
#Import ".\DWRITE_VERTICAL_GLYPH_ORIENTATION.ahk" { DWRITE_VERTICAL_GLYPH_ORIENTATION }
#Import ".\IDWriteTextLayout1.ahk" { IDWriteTextLayout1 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DWRITE_TEXT_METRICS1.ahk" { DWRITE_TEXT_METRICS1 }
#Import ".\DWRITE_OPTICAL_ALIGNMENT.ahk" { DWRITE_OPTICAL_ALIGNMENT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents a block of text after it has been fully analyzed and formatted. | IDWriteTextLayout2 interface
 * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritetextlayout2
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteTextLayout2 extends IDWriteTextLayout1 {
    /**
     * The interface identifier for IDWriteTextLayout2
     * @type {Guid}
     */
    static IID := Guid("{1093c18f-8d5e-43f0-b064-0917311b525e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteTextLayout2 interfaces
    */
    struct Vtbl extends IDWriteTextLayout1.Vtbl {
        GetMetrics                  : IntPtr
        SetVerticalGlyphOrientation : IntPtr
        GetVerticalGlyphOrientation : IntPtr
        SetLastLineWrapping         : IntPtr
        GetLastLineWrapping         : IntPtr
        SetOpticalAlignment         : IntPtr
        GetOpticalAlignment         : IntPtr
        SetFontFallback             : IntPtr
        GetFontFallback             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteTextLayout2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves overall metrics for the formatted string.
     * @returns {DWRITE_TEXT_METRICS1} Type: **[**DWRITE\_TEXT\_METRICS1**](/windows/win32/api/dwrite_2/ns-dwrite_2-dwrite_text_metrics1)\***
     * 
     * When this method returns, contains the measured distances of text and associated content after being formatted.
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritetextlayout2-getmetrics
     */
    GetMetrics() {
        textMetrics := DWRITE_TEXT_METRICS1()
        result := ComCall(71, this, DWRITE_TEXT_METRICS1.Ptr, textMetrics, "HRESULT")
        return textMetrics
    }

    /**
     * Set the preferred orientation of glyphs when using a vertical reading direction.
     * @param {DWRITE_VERTICAL_GLYPH_ORIENTATION} glyphOrientation Preferred glyph orientation.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextlayout2-setverticalglyphorientation
     */
    SetVerticalGlyphOrientation(glyphOrientation) {
        result := ComCall(72, this, DWRITE_VERTICAL_GLYPH_ORIENTATION, glyphOrientation, "HRESULT")
        return result
    }

    /**
     * Get the preferred orientation of glyphs when using a vertical reading direction. (IDWriteTextLayout2.GetVerticalGlyphOrientation)
     * @returns {DWRITE_VERTICAL_GLYPH_ORIENTATION} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextlayout2-getverticalglyphorientation
     */
    GetVerticalGlyphOrientation() {
        result := ComCall(73, this, DWRITE_VERTICAL_GLYPH_ORIENTATION)
        return result
    }

    /**
     * Set whether or not the last word on the last line is wrapped.
     * @param {BOOL} isLastLineWrappingEnabled Line wrapping option.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextlayout2-setlastlinewrapping
     */
    SetLastLineWrapping(isLastLineWrappingEnabled) {
        result := ComCall(74, this, BOOL, isLastLineWrappingEnabled, "HRESULT")
        return result
    }

    /**
     * Get whether or not the last word on the last line is wrapped.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextlayout2-getlastlinewrapping
     */
    GetLastLineWrapping() {
        result := ComCall(75, this, BOOL)
        return result
    }

    /**
     * Set how the glyphs align to the edges the margin.
     * @param {DWRITE_OPTICAL_ALIGNMENT} opticalAlignment Optical alignment option.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextlayout2-setopticalalignment
     */
    SetOpticalAlignment(opticalAlignment) {
        result := ComCall(76, this, DWRITE_OPTICAL_ALIGNMENT, opticalAlignment, "HRESULT")
        return result
    }

    /**
     * Get how the glyphs align to the edges the margin.
     * @returns {DWRITE_OPTICAL_ALIGNMENT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextlayout2-getopticalalignment
     */
    GetOpticalAlignment() {
        result := ComCall(77, this, DWRITE_OPTICAL_ALIGNMENT)
        return result
    }

    /**
     * Apply a custom font fallback onto layout.
     * @param {IDWriteFontFallback} fontFallback Custom font fallback created from <a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefontfallbackbuilder-createfontfallback">IDWriteFontFallbackBuilder::CreateFontFallback</a> or <a href="https://docs.microsoft.com/windows/win32/DirectWrite/idwritefactory2-getsystemfontfallback">IDWriteFactory2::GetSystemFontFallback</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextlayout2-setfontfallback
     */
    SetFontFallback(fontFallback) {
        result := ComCall(78, this, "ptr", fontFallback, "HRESULT")
        return result
    }

    /**
     * Get the current font fallback object.
     * @returns {IDWriteFontFallback} The current font fallback object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextlayout2-getfontfallback
     */
    GetFontFallback() {
        result := ComCall(79, this, "ptr*", &fontFallback := 0, "HRESULT")
        return IDWriteFontFallback(fontFallback)
    }

    Query(iid) {
        if (IDWriteTextLayout2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMetrics := CallbackCreate(GetMethod(implObj, "GetMetrics"), flags, 2)
        this.vtbl.SetVerticalGlyphOrientation := CallbackCreate(GetMethod(implObj, "SetVerticalGlyphOrientation"), flags, 2)
        this.vtbl.GetVerticalGlyphOrientation := CallbackCreate(GetMethod(implObj, "GetVerticalGlyphOrientation"), flags, 1)
        this.vtbl.SetLastLineWrapping := CallbackCreate(GetMethod(implObj, "SetLastLineWrapping"), flags, 2)
        this.vtbl.GetLastLineWrapping := CallbackCreate(GetMethod(implObj, "GetLastLineWrapping"), flags, 1)
        this.vtbl.SetOpticalAlignment := CallbackCreate(GetMethod(implObj, "SetOpticalAlignment"), flags, 2)
        this.vtbl.GetOpticalAlignment := CallbackCreate(GetMethod(implObj, "GetOpticalAlignment"), flags, 1)
        this.vtbl.SetFontFallback := CallbackCreate(GetMethod(implObj, "SetFontFallback"), flags, 2)
        this.vtbl.GetFontFallback := CallbackCreate(GetMethod(implObj, "GetFontFallback"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMetrics)
        CallbackFree(this.vtbl.SetVerticalGlyphOrientation)
        CallbackFree(this.vtbl.GetVerticalGlyphOrientation)
        CallbackFree(this.vtbl.SetLastLineWrapping)
        CallbackFree(this.vtbl.GetLastLineWrapping)
        CallbackFree(this.vtbl.SetOpticalAlignment)
        CallbackFree(this.vtbl.GetOpticalAlignment)
        CallbackFree(this.vtbl.SetFontFallback)
        CallbackFree(this.vtbl.GetFontFallback)
    }
}
