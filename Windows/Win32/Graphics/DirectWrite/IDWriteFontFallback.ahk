#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DWRITE_FONT_STRETCH.ahk" { DWRITE_FONT_STRETCH }
#Import ".\DWRITE_FONT_WEIGHT.ahk" { DWRITE_FONT_WEIGHT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DWRITE_FONT_STYLE.ahk" { DWRITE_FONT_STYLE }
#Import ".\IDWriteFont.ahk" { IDWriteFont }
#Import ".\IDWriteTextAnalysisSource.ahk" { IDWriteTextAnalysisSource }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDWriteFontCollection.ahk" { IDWriteFontCollection }

/**
 * Allows you to access fallback fonts from the font list.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nn-dwrite_2-idwritefontfallback
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontFallback extends IUnknown {
    /**
     * The interface identifier for IDWriteFontFallback
     * @type {Guid}
     */
    static IID := Guid("{efa008f9-f7a1-48bf-b05c-f224713cc0ff}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontFallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        MapCharacters : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontFallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines an appropriate font to use to render the beginning range of text.
     * @param {IDWriteTextAnalysisSource} analysisSource 
     * @param {Integer} textPosition Type: **UINT32**
     * 
     * Starting position to analyze.
     * @param {Integer} textLength Type: **UINT32**
     * 
     * Length of the text to analyze.
     * @param {IDWriteFontCollection} baseFontCollection Type: **[**IDWriteFontCollection**](/windows/win32/api/dwrite/nn-dwrite-idwritefontcollection)\***
     * 
     * Default font collection to use.
     * @param {PWSTR} baseFamilyName Type: **const wchar\_t\***
     * 
     * Family name of the base font. If you pass null, no matching will be done against the family.
     * @param {DWRITE_FONT_WEIGHT} baseWeight Type: **[**DWRITE\_FONT\_WEIGHT**](/windows/win32/api/dwrite/ne-dwrite-dwrite_font_weight)**
     * 
     * The desired weight.
     * @param {DWRITE_FONT_STYLE} baseStyle Type: **[**DWRITE\_FONT\_STYLE**](/windows/win32/api/dwrite/ne-dwrite-dwrite_font_style)**
     * 
     * The desired style.
     * @param {DWRITE_FONT_STRETCH} baseStretch Type: **[**DWRITE\_FONT\_STRETCH**](/windows/win32/api/dwrite/ne-dwrite-dwrite_font_stretch)**
     * 
     * The desired stretch.
     * @param {Pointer<Integer>} mappedLength Type: **UINT32\***
     * 
     * Length of text mapped to the mapped font. This will always be less than or equal to the text length and greater than zero (if the text length is non-zero) so the caller advances at least one character.
     * @param {Pointer<IDWriteFont>} mappedFont Type: **[**IDWriteFont**](/windows/win32/api/dwrite/nn-dwrite-idwritefont)\*\***
     * 
     * The font that should be used to render the first *mappedLength* characters of the text. If it returns NULL, that means that no font can render the text, and *mappedLength* is the number of characters to skip (rendered with a missing glyph).
     * @param {Pointer<Float>} scale Type: **FLOAT\***
     * 
     * Scale factor to multiply the em size of the returned font by.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritefontfallback-mapcharacters
     */
    MapCharacters(analysisSource, textPosition, textLength, baseFontCollection, baseFamilyName, baseWeight, baseStyle, baseStretch, mappedLength, mappedFont, scale) {
        baseFamilyName := baseFamilyName is String ? StrPtr(baseFamilyName) : baseFamilyName

        mappedLengthMarshal := mappedLength is VarRef ? "uint*" : "ptr"
        scaleMarshal := scale is VarRef ? "float*" : "ptr"

        result := ComCall(3, this, "ptr", analysisSource, "uint", textPosition, "uint", textLength, "ptr", baseFontCollection, "ptr", baseFamilyName, DWRITE_FONT_WEIGHT, baseWeight, DWRITE_FONT_STYLE, baseStyle, DWRITE_FONT_STRETCH, baseStretch, mappedLengthMarshal, mappedLength, IDWriteFont.Ptr, mappedFont, scaleMarshal, scale, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDWriteFontFallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MapCharacters := CallbackCreate(GetMethod(implObj, "MapCharacters"), flags, 12)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MapCharacters)
    }
}
