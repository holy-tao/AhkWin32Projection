#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontList2.ahk
#Include .\IDWriteFontSet1.ahk
#Include .\IDWriteFontFamily1.ahk

/**
 * Represents a family of related fonts. **IDWriteFontFamily2** adds new facilities, including retrieving fonts by font axis values.
 * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nn-dwrite_3-idwritefontfamily2
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFamily2 extends IDWriteFontFamily1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontFamily2
     * @type {Guid}
     */
    static IID => Guid("{3ed49e77-a398-4261-b9cf-c126c2131ef3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMatchingFonts", "GetFontSet"]

    /**
     * Retrieves a list of fonts in the font family, ranked in order of how well they match the specified axis values.
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues Type: **[DWRITE_FONT_AXIS_VALUE](./ns-dwrite_3-dwrite_font_axis_value.md) const \***
     * 
     * A pointer to an array containing a list of font axis values. The array should be the size (the number of elements) indicated by the *fontAxisValueCount* argument.
     * @param {Integer} fontAxisValueCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of font axis values contained in the *fontAxisValues* array.
     * @returns {Pointer<IDWriteFontList2>} Type: **[IDWriteFontList2](./nn-dwrite_3-idwritefontlist2.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontList2](./nn-dwrite_3-idwritefontlist2.md) interface. On successful completion, the function sets the pointer to a newly created font list object.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritefontfamily2-getmatchingfonts
     */
    GetMatchingFonts(fontAxisValues, fontAxisValueCount) {
        result := ComCall(12, this, "ptr", fontAxisValues, "uint", fontAxisValueCount, "ptr*", &matchingFonts := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return matchingFonts
    }

    /**
     * Retrieves the underlying font set used by this family.
     * @returns {Pointer<IDWriteFontSet1>} Type: **[IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md) interface. On successful completion, the function sets the pointer to the font set used by the family.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritefontfamily2-getfontset
     */
    GetFontSet() {
        result := ComCall(13, this, "ptr*", &fontSet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return fontSet
    }
}
