#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteFontFallback.ahk" { IDWriteFontFallback }
#Import ".\DWRITE_VERTICAL_GLYPH_ORIENTATION.ahk" { DWRITE_VERTICAL_GLYPH_ORIENTATION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteTextFormat.ahk" { IDWriteTextFormat }
#Import ".\DWRITE_OPTICAL_ALIGNMENT.ahk" { DWRITE_OPTICAL_ALIGNMENT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes the font and paragraph properties used to format text, and it describes locale information. | IDWriteTextFormat1 interface
 * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritetextformat1
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteTextFormat1 extends IDWriteTextFormat {
    /**
     * The interface identifier for IDWriteTextFormat1
     * @type {Guid}
     */
    static IID := Guid("{5f174b49-0d8b-4cfb-8bca-f1cce9d06c67}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteTextFormat1 interfaces
    */
    struct Vtbl extends IDWriteTextFormat.Vtbl {
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
            this.vtbl := IDWriteTextFormat1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the orientation of a text format.
     * @param {DWRITE_VERTICAL_GLYPH_ORIENTATION} glyphOrientation Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_vertical_glyph_orientation">DWRITE_VERTICAL_GLYPH_ORIENTATION</a></b>
     * 
     * The orientation to apply to the text format.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextformat1-setverticalglyphorientation
     */
    SetVerticalGlyphOrientation(glyphOrientation) {
        result := ComCall(28, this, DWRITE_VERTICAL_GLYPH_ORIENTATION, glyphOrientation, "HRESULT")
        return result
    }

    /**
     * Get the preferred orientation of glyphs when using a vertical reading direction. (IDWriteTextFormat1.GetVerticalGlyphOrientation)
     * @returns {DWRITE_VERTICAL_GLYPH_ORIENTATION} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_vertical_glyph_orientation">DWRITE_VERTICAL_GLYPH_ORIENTATION</a></b>
     * 
     * The preferred orientation of glyphs when using a vertical reading direction.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextformat1-getverticalglyphorientation
     */
    GetVerticalGlyphOrientation() {
        result := ComCall(29, this, DWRITE_VERTICAL_GLYPH_ORIENTATION)
        return result
    }

    /**
     * Sets the wrapping mode of the last line.
     * @param {BOOL} isLastLineWrappingEnabled Type: <b>BOOL</b>
     * 
     * If set to FALSE, the last line is not wrapped. If set to TRUE, the last line is wrapped.
     * 
     * The last line is wrapped by default.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextformat1-setlastlinewrapping
     */
    SetLastLineWrapping(isLastLineWrappingEnabled) {
        result := ComCall(30, this, BOOL, isLastLineWrappingEnabled, "HRESULT")
        return result
    }

    /**
     * Gets the wrapping mode of the last line.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns FALSE if the last line is not wrapped; TRUE if the last line is wrapped.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextformat1-getlastlinewrapping
     */
    GetLastLineWrapping() {
        result := ComCall(31, this, BOOL)
        return result
    }

    /**
     * Sets the optical margin alignment for the text format.
     * @param {DWRITE_OPTICAL_ALIGNMENT} opticalAlignment The optical alignment to set.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextformat1-setopticalalignment
     */
    SetOpticalAlignment(opticalAlignment) {
        result := ComCall(32, this, DWRITE_OPTICAL_ALIGNMENT, opticalAlignment, "HRESULT")
        return result
    }

    /**
     * Gets the optical margin alignment for the text format.
     * @returns {DWRITE_OPTICAL_ALIGNMENT} The optical alignment.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextformat1-getopticalalignment
     */
    GetOpticalAlignment() {
        result := ComCall(33, this, DWRITE_OPTICAL_ALIGNMENT)
        return result
    }

    /**
     * Applies the custom font fallback onto the layout. If none is set, it uses the default system fallback list.
     * @param {IDWriteFontFallback} fontFallback Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/nn-dwrite_2-idwritefontfallback">IDWriteFontFallback</a>*</b>
     * 
     * The font fallback to apply to the layout.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextformat1-setfontfallback
     */
    SetFontFallback(fontFallback) {
        result := ComCall(34, this, "ptr", fontFallback, "HRESULT")
        return result
    }

    /**
     * Gets the current fallback. If none was ever set since creating the layout, it will be nullptr.
     * @returns {IDWriteFontFallback} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/nn-dwrite_2-idwritefontfallback">IDWriteFontFallback</a>**</b>
     * 
     * Contains an address of a pointer to the the current font fallback object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritetextformat1-getfontfallback
     */
    GetFontFallback() {
        result := ComCall(35, this, "ptr*", &fontFallback := 0, "HRESULT")
        return IDWriteFontFallback(fontFallback)
    }

    Query(iid) {
        if (IDWriteTextFormat1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
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
