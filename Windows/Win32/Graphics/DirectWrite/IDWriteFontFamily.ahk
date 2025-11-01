#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IDWriteLocalizedStrings>} names 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfamily-getfamilynames
     */
    GetFamilyNames(names) {
        result := ComCall(6, this, "ptr*", names, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} weight 
     * @param {Integer} stretch 
     * @param {Integer} style 
     * @param {Pointer<IDWriteFont>} matchingFont 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfamily-getfirstmatchingfont
     */
    GetFirstMatchingFont(weight, stretch, style, matchingFont) {
        result := ComCall(7, this, "int", weight, "int", stretch, "int", style, "ptr*", matchingFont, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} weight 
     * @param {Integer} stretch 
     * @param {Integer} style 
     * @param {Pointer<IDWriteFontList>} matchingFonts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfamily-getmatchingfonts
     */
    GetMatchingFonts(weight, stretch, style, matchingFonts) {
        result := ComCall(8, this, "int", weight, "int", stretch, "int", style, "ptr*", matchingFonts, "HRESULT")
        return result
    }
}
