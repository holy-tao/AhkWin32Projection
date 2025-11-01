#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An object that encapsulates a set of fonts, such as the set of fonts installed on the system, or the set of fonts in a particular directory.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-getsystemfontcollection">IDWriteFactory::GetSystemFontCollection</a> method will give you an <b>IDWriteFontCollection</b> object, which encapsulates the set of fonts installed on the system, as shown in the following code example.
  * 
  * 
  * ```cpp
  * IDWriteFontCollection* pFontCollection = NULL;
  * 
  * // Get the system font collection.
  * if (SUCCEEDED(hr))
  * {
  *     hr = pDWriteFactory->GetSystemFontCollection(&pFontCollection);
  * }
  * 
  * ```
  * 
  * 
  * 
  * <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextformat">IDWriteTextFormat</a> and <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextlayout">IDWriteTextLayout</a> both have a <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-getfontcollection">GetFontCollection</a> method that returns the font collection being used by the object.  These interfaces use the system font collection by default, but can use a custom font collection instead.
  * 
  * To determine what fonts are available on the system,  get a reference to the system font collection.  You can then use the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontcollection-getfontfamilycount">IDWriteFontCollection::GetFontFamilyCount</a> method to determine the number of fonts and loop through the list. The following example enumerates the fonts in the system font collection, and prints the font family names to the console.
  * 
  * 
  * ```cpp
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritefontcollection
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontCollection
     * @type {Guid}
     */
    static IID => Guid("{a84cee02-3eea-4eee-a827-87c1a02a0fcc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontFamilyCount", "GetFontFamily", "FindFamilyName", "GetFontFromFontFace"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontcollection-getfontfamilycount
     */
    GetFontFamilyCount() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IDWriteFontFamily>} fontFamily 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontcollection-getfontfamily
     */
    GetFontFamily(index, fontFamily) {
        result := ComCall(4, this, "uint", index, "ptr*", fontFamily, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} familyName 
     * @param {Pointer<Integer>} index 
     * @param {Pointer<BOOL>} exists 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontcollection-findfamilyname
     */
    FindFamilyName(familyName, index, exists) {
        familyName := familyName is String ? StrPtr(familyName) : familyName

        indexMarshal := index is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", familyName, indexMarshal, index, "ptr", exists, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteFontFace} fontFace 
     * @param {Pointer<IDWriteFont>} font 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontcollection-getfontfromfontface
     */
    GetFontFromFontFace(fontFace, font) {
        result := ComCall(6, this, "ptr", fontFace, "ptr*", font, "HRESULT")
        return result
    }
}
