#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DWRITE_VERTICAL_GLYPH_ORIENTATION.ahk" { DWRITE_VERTICAL_GLYPH_ORIENTATION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteTextAnalysisSource.ahk" { IDWriteTextAnalysisSource }

/**
 * The interface you implement to provide needed information to the text analyzer, like the text and associated text properties.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nn-dwrite_1-idwritetextanalysissource1
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteTextAnalysisSource1 extends IDWriteTextAnalysisSource {
    /**
     * The interface identifier for IDWriteTextAnalysisSource1
     * @type {Guid}
     */
    static IID := Guid("{639cfad8-0fb4-4b21-a58a-067920120009}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteTextAnalysisSource1 interfaces
    */
    struct Vtbl extends IDWriteTextAnalysisSource.Vtbl {
        GetVerticalGlyphOrientation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteTextAnalysisSource1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Used by the text analyzer to obtain the desired glyph orientation and resolved bidi level.
     * @remarks
     * The text analyzer calls back to this to get the desired glyph
     *     orientation and resolved bidi level, which it uses along with the
     *     script properties of the text to determine the actual orientation of
     *     each character, which it reports back to the client via the sink
     *     SetGlyphOrientation method.
     * @param {Integer} textPosition Type: <b>UINT32</b>
     * 
     * The text position.
     * @param {Pointer<Integer>} textLength Type: <b>UINT32*</b>
     * 
     * A pointer to the text length.
     * @param {Pointer<DWRITE_VERTICAL_GLYPH_ORIENTATION>} glyphOrientation Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_vertical_glyph_orientation">DWRITE_VERTICAL_GLYPH_ORIENTATION</a>*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_vertical_glyph_orientation">DWRITE_VERTICAL_GLYPH_ORIENTATION</a>-typed value that specifies the desired kind of glyph orientation for the text.
     * @param {Pointer<Integer>} bidiLevel Type: <b>UINT8*</b>
     * 
     * A pointer to the resolved bidi level.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returning an error will abort the
     *     analysis.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritetextanalysissource1-getverticalglyphorientation
     */
    GetVerticalGlyphOrientation(textPosition, textLength, glyphOrientation, bidiLevel) {
        textLengthMarshal := textLength is VarRef ? "uint*" : "ptr"
        glyphOrientationMarshal := glyphOrientation is VarRef ? "int*" : "ptr"
        bidiLevelMarshal := bidiLevel is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "uint", textPosition, textLengthMarshal, textLength, glyphOrientationMarshal, glyphOrientation, bidiLevelMarshal, bidiLevel, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDWriteTextAnalysisSource1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetVerticalGlyphOrientation := CallbackCreate(GetMethod(implObj, "GetVerticalGlyphOrientation"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetVerticalGlyphOrientation)
    }
}
