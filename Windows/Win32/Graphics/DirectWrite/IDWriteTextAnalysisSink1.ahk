#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DWRITE_GLYPH_ORIENTATION_ANGLE.ahk" { DWRITE_GLYPH_ORIENTATION_ANGLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IDWriteTextAnalysisSink.ahk" { IDWriteTextAnalysisSink }

/**
 * The interface you implement to receive the output of the text analyzers.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nn-dwrite_1-idwritetextanalysissink1
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteTextAnalysisSink1 extends IDWriteTextAnalysisSink {
    /**
     * The interface identifier for IDWriteTextAnalysisSink1
     * @type {Guid}
     */
    static IID := Guid("{b0d941a0-85e7-4d8b-9fd3-5ced9934482a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteTextAnalysisSink1 interfaces
    */
    struct Vtbl extends IDWriteTextAnalysisSink.Vtbl {
        SetGlyphOrientation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteTextAnalysisSink1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The text analyzer calls back to this to report the actual orientation of each character for shaping and drawing.
     * @param {Integer} textPosition Type: <b>UINT32 </b>
     * 
     * The starting position to report from.
     * @param {Integer} textLength Type: <b>UINT32 </b>
     * 
     * Number of UTF-16 units of the reported range.
     * @param {DWRITE_GLYPH_ORIENTATION_ANGLE} glyphOrientationAngle Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_glyph_orientation_angle">DWRITE_GLYPH_ORIENTATION_ANGLE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_glyph_orientation_angle">DWRITE_GLYPH_ORIENTATION_ANGLE</a>-typed value that specifies the angle of the glyphs within the text
     *     range (pass to <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritetextanalyzer1-getglyphorientationtransform">IDWriteTextAnalyzer1::GetGlyphOrientationTransform</a> to get the world
     *     relative transform).
     * @param {Integer} adjustedBidiLevel Type: <b>UINT8</b>
     * 
     * The adjusted bidi level to be used by
     *     the client layout for reordering runs. This will differ from the
     *     resolved bidi level retrieved from the source for cases such as
     *     Arabic stacked top-to-bottom, where the glyphs are still shaped
     *     as RTL, but the runs are TTB along with any CJK or Latin.
     * @param {BOOL} isSideways Type: <b>BOOL</b>
     * 
     * Whether the glyphs are rotated on their side,
     *     which is the default case for CJK and the case stacked Latin
     * @param {BOOL} isRightToLeft Type: <b>BOOL</b>
     * 
     * Whether the script should be shaped as
     *     right-to-left. For Arabic stacked top-to-bottom, even when the
     *     adjusted bidi level is coerced to an even level, this will still
     *     be true.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns a successful code or an error code to abort analysis.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritetextanalysissink1-setglyphorientation
     */
    SetGlyphOrientation(textPosition, textLength, glyphOrientationAngle, adjustedBidiLevel, isSideways, isRightToLeft) {
        result := ComCall(7, this, "uint", textPosition, "uint", textLength, DWRITE_GLYPH_ORIENTATION_ANGLE, glyphOrientationAngle, "char", adjustedBidiLevel, BOOL, isSideways, BOOL, isRightToLeft, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDWriteTextAnalysisSink1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetGlyphOrientation := CallbackCreate(GetMethod(implObj, "SetGlyphOrientation"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetGlyphOrientation)
    }
}
