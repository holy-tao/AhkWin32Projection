#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IDWriteFontFamily2>} fontFamily 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontcollection2-getfontfamily
     */
    GetFontFamily(index, fontFamily) {
        result := ComCall(9, this, "uint", index, "ptr*", fontFamily, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} familyName 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @param {Pointer<IDWriteFontList2>} fontList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontcollection2-getmatchingfonts
     */
    GetMatchingFonts(familyName, fontAxisValues, fontAxisValueCount, fontList) {
        familyName := familyName is String ? StrPtr(familyName) : familyName

        result := ComCall(10, this, "ptr", familyName, "ptr", fontAxisValues, "uint", fontAxisValueCount, "ptr*", fontList, "HRESULT")
        return result
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
     * @param {Pointer<IDWriteFontSet1>} fontSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontcollection2-getfontset
     */
    GetFontSet(fontSet) {
        result := ComCall(12, this, "ptr*", fontSet, "HRESULT")
        return result
    }
}
