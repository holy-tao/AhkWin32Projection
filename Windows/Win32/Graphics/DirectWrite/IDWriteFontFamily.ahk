#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteLocalizedStrings.ahk
#Include .\IDWriteFont.ahk
#Include .\IDWriteFontList.ahk

/**
 * Represents a family of related fonts.
 * @remarks
 * 
 * A font family is a set of fonts that share the same family name, such as "Times New Roman", but that differ in features. These feature differences include style, such as italic, and weight, such as bold. 
 * 
 * The following illustration shows examples of fonts that are members of the "Times New Roman" font family.
 * 
 * <img alt="Illustration of italic, bold, and bold italic text from the Times New Roman font family" src="./images/FontFamily_for_TimesNewRoman.png"/>
 * An <b>IDWriteFontFamily</b> object can be retrieved from a font collection using the  <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-getfontfamily">IDWriteFontCollection::GetFontFamily</a> method shown in the following example.  <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontcollection-getfontfamily">GetFontFamily</a> takes a <b>UINT32</b> index and returns the font family for the font at that index.
 * 
 * 
 * ```cpp
 * IDWriteFontFamily* pFontFamily = NULL;
 * 
 * // Get the font family.
 * if (SUCCEEDED(hr))
 * {
 *     hr = pFontCollection->GetFontFamily(i, &pFontFamily);
 * }
 * 
 * ```
 * 
 * 
 * The font family name is used to specify the font family for text layout and text format objects.  You can get a list of localized font family names from an <b>IDWriteFontFamily</b> object in the form of an <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritelocalizedstrings">IDWriteLocalizedStrings</a> object by using the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfamily-getfamilynames">IDWriteFontFamily::GetFamilyNames</a> method, as shown in the following code.
 * 
 * 
 * ```cpp
 * IDWriteLocalizedStrings* pFamilyNames = NULL;
 * 
 * // Get a list of localized strings for the family name.
 * if (SUCCEEDED(hr))
 * {
 *     hr = pFontFamily->GetFamilyNames(&pFamilyNames);
 * }
 * 
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritefontfamily
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFamily extends IDWriteFontList{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontFamily
     * @type {Guid}
     */
    static IID => Guid("{da20d8ef-812a-4c43-9802-62ec4abd7add}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFamilyNames", "GetFirstMatchingFont", "GetMatchingFonts"]

    /**
     * Creates a localized strings object that contains the family names for the font family, indexed by locale name.
     * @returns {IDWriteLocalizedStrings} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritelocalizedstrings">IDWriteLocalizedStrings</a>**</b>
     * 
     * The address of a pointer to the newly created <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritelocalizedstrings">IDWriteLocalizedStrings</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontfamily-getfamilynames
     */
    GetFamilyNames() {
        result := ComCall(6, this, "ptr*", &names := 0, "HRESULT")
        return IDWriteLocalizedStrings(names)
    }

    /**
     * Gets the font that best matches the specified properties.
     * @param {Integer} weight Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_weight">DWRITE_FONT_WEIGHT</a></b>
     * 
     * A value that is used to match a requested font weight.
     * @param {Integer} stretch Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_stretch">DWRITE_FONT_STRETCH</a></b>
     * 
     * A value that is used to match a requested font stretch.
     * @param {Integer} style Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_style">DWRITE_FONT_STYLE</a></b>
     * 
     * A value that is used to match a requested font style.
     * @returns {IDWriteFont} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefont">IDWriteFont</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the newly created <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefont">IDWriteFont</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontfamily-getfirstmatchingfont
     */
    GetFirstMatchingFont(weight, stretch, style) {
        result := ComCall(7, this, "int", weight, "int", stretch, "int", style, "ptr*", &matchingFont := 0, "HRESULT")
        return IDWriteFont(matchingFont)
    }

    /**
     * Gets a list of fonts in the font family ranked in order of how well they match the specified properties.
     * @param {Integer} weight Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_weight">DWRITE_FONT_WEIGHT</a></b>
     * 
     * A value that is used to match a requested font weight.
     * @param {Integer} stretch Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_stretch">DWRITE_FONT_STRETCH</a></b>
     * 
     * A value that is used to match a requested font stretch.
     * @param {Integer} style Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_style">DWRITE_FONT_STYLE</a></b>
     * 
     * A value that is used to match a requested font style.
     * @returns {IDWriteFontList} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontlist">IDWriteFontList</a>**</b>
     * 
     * An address of a pointer to the newly created <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontlist">IDWriteFontList</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontfamily-getmatchingfonts
     */
    GetMatchingFonts(weight, stretch, style) {
        result := ComCall(8, this, "int", weight, "int", stretch, "int", style, "ptr*", &matchingFonts := 0, "HRESULT")
        return IDWriteFontList(matchingFonts)
    }
}
