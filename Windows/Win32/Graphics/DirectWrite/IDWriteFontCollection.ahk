#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFamily.ahk
#Include .\IDWriteFont.ahk
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
     * Gets the number of font families in the collection.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * The number of font families in the collection.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontcollection-getfontfamilycount
     */
    GetFontFamilyCount() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * Creates a font family object given a zero-based font family index.
     * @param {Integer} index Type: <b>UINT32</b>
     * 
     * Zero-based index of the font family.
     * @returns {IDWriteFontFamily} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfamily">IDWriteFontFamily</a>**</b>
     * 
     * When this method returns, contains the address of   a pointer to the newly created font family object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontcollection-getfontfamily
     */
    GetFontFamily(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &fontFamily := 0, "HRESULT")
        return IDWriteFontFamily(fontFamily)
    }

    /**
     * Finds the font family with the specified family name.
     * @param {PWSTR} familyName Type: <b>const WCHAR*</b>
     * 
     * An array of characters, which is null-terminated, containing the name of the font family. The name is not case-sensitive but must otherwise exactly match a family name in the collection.
     * @param {Pointer<Integer>} index Type: <b>UINT32*</b>
     * 
     * When this method returns, contains the zero-based index of the matching font family if the family name was found; otherwise, <b>UINT_MAX</b>.
     * @param {Pointer<BOOL>} exists Type: <b>BOOL*</b>
     * 
     * When this method returns, <b>TRUE</b> if the family name exists; otherwise, <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontcollection-findfamilyname
     */
    FindFamilyName(familyName, index, exists) {
        familyName := familyName is String ? StrPtr(familyName) : familyName

        indexMarshal := index is VarRef ? "uint*" : "ptr"
        existsMarshal := exists is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", familyName, indexMarshal, index, existsMarshal, exists, "HRESULT")
        return result
    }

    /**
     * Gets the font object that corresponds to the same physical font as the specified font face object. The specified physical font must belong to the font collection.
     * @param {IDWriteFontFace} fontFace Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontface">IDWriteFontFace</a>*</b>
     * 
     * A font face object that specifies the physical font.
     * @returns {IDWriteFont} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefont">IDWriteFont</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the newly created font object if successful; otherwise, <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontcollection-getfontfromfontface
     */
    GetFontFromFontFace(fontFace) {
        result := ComCall(6, this, "ptr", fontFace, "ptr*", &font := 0, "HRESULT")
        return IDWriteFont(font)
    }
}
