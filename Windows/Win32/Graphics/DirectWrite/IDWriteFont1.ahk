#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DWRITE_PANOSE.ahk" { DWRITE_PANOSE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteFont.ahk" { IDWriteFont }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DWRITE_FONT_METRICS1.ahk" { DWRITE_FONT_METRICS1 }
#Import ".\DWRITE_UNICODE_RANGE.ahk" { DWRITE_UNICODE_RANGE }

/**
 * Represents a physical font in a font collection. (IDWriteFont1)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nn-dwrite_1-idwritefont1
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFont1 extends IDWriteFont {
    /**
     * The interface identifier for IDWriteFont1
     * @type {Guid}
     */
    static IID := Guid("{acd16696-8c14-4f5d-877e-fe3fc1d32738}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFont1 interfaces
    */
    struct Vtbl extends IDWriteFont.Vtbl {
        GetMetrics       : IntPtr
        GetPanose        : IntPtr
        GetUnicodeRanges : IntPtr
        IsMonospacedFont : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFont1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Obtains design units and common metrics for the font face. These metrics are applicable to all the glyphs within a font face and are used by applications for layout calculations. (IDWriteFont1.GetMetrics)
     * @param {Pointer<DWRITE_FONT_METRICS1>} fontMetrics Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_font_metrics1">DWRITE_FONT_METRICS1</a>*</b>
     * 
     *  A filled  <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_font_metrics1">DWRITE_FONT_METRICS1</a> structure that has font metrics for the current font face. The metrics returned by this method are in font design units.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefont1-getmetrics
     */
    GetMetrics(fontMetrics) {
        ComCall(14, this, DWRITE_FONT_METRICS1.Ptr, fontMetrics)
    }

    /**
     * Gets the PANOSE values from the font and is used for font selection and matching.
     * @remarks
     * If the font has no PANOSE values,
     *     they are set to 'any' (0) and <a href="https://docs.microsoft.com/windows/win32/DirectWrite/direct-write-portal">DirectWrite</a> doesn't simulate those values.
     * @param {Pointer<DWRITE_PANOSE>} _panose Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_panose">DWRITE_PANOSE</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_panose">DWRITE_PANOSE</a> structure to fill in.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefont1-getpanose
     */
    GetPanose(_panose) {
        ComCall(15, this, DWRITE_PANOSE.Ptr, _panose)
    }

    /**
     * Retrieves the list of character ranges supported by a font.
     * @remarks
     * The list of character ranges supported by a font, is
     *     useful for scenarios like character picking, glyph display, and
     *     efficient font selection lookup. GetUnicodeRanges is similar to GDI's
     *     GetFontUnicodeRanges, except that it returns the full Unicode range,
     *     not just 16-bit UCS-2.
     * 
     * These ranges are from the cmap, not the OS/2::ulCodePageRange1.
     * 
     * If this method is unavailable, you can use the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontface-getglyphindices">IDWriteFontFace::GetGlyphIndices</a> method to check for missing glyphs.  The method returns the 0 index for glyphs that aren't present in the font.
     * 
     *  The <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-hascharacter">IDWriteFont::HasCharacter</a> method is often simpler in cases where you need to check a single character or a series of single characters in succession, such as in font fallback.
     * @param {Integer} maxRangeCount Type: <b>UINT32</b>
     * 
     * The maximum number of character ranges passed
     *     in from the client.
     * @param {Pointer<DWRITE_UNICODE_RANGE>} unicodeRanges Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_unicode_range">DWRITE_UNICODE_RANGE</a>*</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_unicode_range">DWRITE_UNICODE_RANGE</a> structures that are filled with the character ranges.
     * @param {Pointer<Integer>} actualRangeCount Type: <b>UINT32*</b>
     * 
     * A pointer to the actual number of character ranges,
     *     regardless of the maximum count.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method executed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_NOT_SUFFICIENT_BUFFER</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small.  The <i>actualRangeCount</i> was more than the <i>maxRangeCount</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefont1-getunicoderanges
     */
    GetUnicodeRanges(maxRangeCount, unicodeRanges, actualRangeCount) {
        actualRangeCountMarshal := actualRangeCount is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "uint", maxRangeCount, DWRITE_UNICODE_RANGE.Ptr, unicodeRanges, actualRangeCountMarshal, actualRangeCount, "HRESULT")
        return result
    }

    /**
     * Determines if the font is monospaced, that is, the characters are the same fixed-pitch width (non-proportional).
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns true if the font is monospaced, else it returns false.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefont1-ismonospacedfont
     */
    IsMonospacedFont() {
        result := ComCall(17, this, BOOL)
        return result
    }

    Query(iid) {
        if (IDWriteFont1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMetrics := CallbackCreate(GetMethod(implObj, "GetMetrics"), flags, 2)
        this.vtbl.GetPanose := CallbackCreate(GetMethod(implObj, "GetPanose"), flags, 2)
        this.vtbl.GetUnicodeRanges := CallbackCreate(GetMethod(implObj, "GetUnicodeRanges"), flags, 4)
        this.vtbl.IsMonospacedFont := CallbackCreate(GetMethod(implObj, "IsMonospacedFont"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMetrics)
        CallbackFree(this.vtbl.GetPanose)
        CallbackFree(this.vtbl.GetUnicodeRanges)
        CallbackFree(this.vtbl.IsMonospacedFont)
    }
}
