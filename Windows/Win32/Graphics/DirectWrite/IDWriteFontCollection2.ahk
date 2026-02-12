#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFamily2.ahk
#Include .\IDWriteFontList2.ahk
#Include .\IDWriteFontSet1.ahk
#Include .\IDWriteFontCollection1.ahk

/**
 * This interface encapsulates a set of fonts, such as the set of fonts installed on the system, or the set of fonts in a particular directory. The font collection API can be used to discover what font families and fonts are available, and to obtain some metadata about the fonts. (IDWriteFontCollection2)
 * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nn-dwrite_3-idwritefontcollection2
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontCollection2 extends IDWriteFontCollection1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontCollection2
     * @type {Guid}
     */
    static IID => Guid("{514039c6-4617-4064-bf8b-92ea83e506e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontFamily", "GetMatchingFonts", "GetFontFamilyModel", "GetFontSet"]

    /**
     * Creates a font family object, given a zero-based font family index.
     * @param {Integer} index Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Zero-based index of the font family.
     * @returns {Pointer<IDWriteFontFamily2>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritefontcollection2-getfontfamily
     */
    GetFontFamily(index) {
        result := ComCall(9, this, "uint", index, "ptr*", &fontFamily_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return fontFamily_
    }

    /**
     * Retrieves a list of fonts in the specified font family, ranked in order of how well they match the specified axis values.
     * @remarks
     * If no fonts match, an empty list object is returned (calling [IDWriteFontList::GetFontCount](../dwrite/nf-dwrite-idwritefontlist-getfontcount.md) on it returns 0), but the function doesn't return an error.
     * @param {PWSTR} familyName Type: **[WCHAR](/windows/win32/winprog/windows-data-types) const \***
     * 
     * Name of the font family. The name is not case-sensitive, but must otherwise exactly match a family name in the collection.
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues Type: **[DWRITE_FONT_AXIS_VALUE](./ns-dwrite_3-dwrite_font_axis_value.md) const \***
     * 
     * A pointer to an array containing a list of font axis values. The array should be the size (the number of elements) indicated by the *fontAxisValueCount* argument.
     * @param {Integer} fontAxisValueCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of font axis values contained in the *fontAxisValues* array.
     * @returns {Pointer<IDWriteFontList2>} Type: **[IDWriteFontList2](./nn-dwrite_3-idwritefontlist2.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontList2](./nn-dwrite_3-idwritefontlist2.md) interface. On successful completion, the function sets the pointer to a newly created font list object.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritefontcollection2-getmatchingfonts
     */
    GetMatchingFonts(familyName, fontAxisValues, fontAxisValueCount) {
        familyName := familyName is String ? StrPtr(familyName) : familyName

        result := ComCall(10, this, "ptr", familyName, "ptr", fontAxisValues, "uint", fontAxisValueCount, "ptr*", &fontList := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return fontList
    }

    /**
     * Retrieves the font family model used by the font collection to group families.
     * @returns {Integer} Type: **[DWRITE_FONT_FAMILY_MODEL](./ne-dwrite_3-dwrite_font_family_model.md)**
     * 
     * How families are grouped in the collection.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritefontcollection2-getfontfamilymodel
     */
    GetFontFamilyModel() {
        result := ComCall(11, this, "int")
        return result
    }

    /**
     * Retrieves the underlying font set used by this collection.
     * @returns {Pointer<IDWriteFontSet1>} Type: **[IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md) interface. On successful completion, the function sets the pointer to the font set used by the collection.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritefontcollection2-getfontset
     */
    GetFontSet() {
        result := ComCall(12, this, "ptr*", &fontSet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return fontSet
    }
}
