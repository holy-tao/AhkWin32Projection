#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFamily2.ahk
#Include .\IDWriteFontList2.ahk
#Include .\IDWriteFontSet1.ahk
#Include .\IDWriteFontCollection1.ahk

/**
 * This interface encapsulates a set of fonts, such as the set of fonts installed on the system, or the set of fonts in a particular directory. The font collection API can be used to discover what font families and fonts are available, and to obtain some metadata about the fonts.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontcollection2
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
     * 
     * @param {Integer} index 
     * @returns {IDWriteFontFamily2} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontcollection2-getfontfamily
     */
    GetFontFamily(index) {
        result := ComCall(9, this, "uint", index, "ptr*", &fontFamily := 0, "HRESULT")
        return IDWriteFontFamily2(fontFamily)
    }

    /**
     * 
     * @param {PWSTR} familyName 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @returns {IDWriteFontList2} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontcollection2-getmatchingfonts
     */
    GetMatchingFonts(familyName, fontAxisValues, fontAxisValueCount) {
        familyName := familyName is String ? StrPtr(familyName) : familyName

        result := ComCall(10, this, "ptr", familyName, "ptr", fontAxisValues, "uint", fontAxisValueCount, "ptr*", &fontList := 0, "HRESULT")
        return IDWriteFontList2(fontList)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontcollection2-getfontfamilymodel
     */
    GetFontFamilyModel() {
        result := ComCall(11, this, "int")
        return result
    }

    /**
     * 
     * @returns {IDWriteFontSet1} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontcollection2-getfontset
     */
    GetFontSet() {
        result := ComCall(12, this, "ptr*", &fontSet := 0, "HRESULT")
        return IDWriteFontSet1(fontSet)
    }
}
