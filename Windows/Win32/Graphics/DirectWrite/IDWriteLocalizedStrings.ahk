#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a collection of strings indexed by locale name.
 * @remarks
 * 
 * The set of strings represented by an <b>IDWriteLocalizedStrings</b> are indexed by a zero based <i>UINT32</i> number that maps to a locale.  The numeric index for a specific locale is retreived by using the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritelocalizedstrings-findlocalename">FindLocaleName</a> method.
 * 
 * A common use for the <b>IDWriteLocalizedStrings</b> interface is to hold a list of localized font family names created by using the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfamily-getfamilynames">IDWriteFontFamily::GetFamilyNames</a> method.  The following example shows how to get the family name for the "en-us" locale.
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
 * UINT32 index = 0;
 * BOOL exists = false;
 * 
 * wchar_t localeName[LOCALE_NAME_MAX_LENGTH];
 * 
 * if (SUCCEEDED(hr))
 * {
 *     // Get the default locale for this user.
 *     int defaultLocaleSuccess = GetUserDefaultLocaleName(localeName, LOCALE_NAME_MAX_LENGTH);
 * 
 *     // If the default locale is returned, find that locale name, otherwise use "en-us".
 *     if (defaultLocaleSuccess)
 *     {
 *         hr = pFamilyNames->FindLocaleName(localeName, &index, &exists);
 *     }
 *     if (SUCCEEDED(hr) && !exists) // if the above find did not find a match, retry with US English
 *     {
 *         hr = pFamilyNames->FindLocaleName(L"en-us", &index, &exists);
 *     }
 * }
 * 
 * // If the specified locale doesn't exist, select the first on the list.
 * if (!exists)
 *     index = 0;
 * 
 * UINT32 length = 0;
 * 
 * // Get the string length.
 * if (SUCCEEDED(hr))
 * {
 *     hr = pFamilyNames->GetStringLength(index, &length);
 * }
 * 
 * // Allocate a string big enough to hold the name.
 * wchar_t* name = new (std::nothrow) wchar_t[length+1];
 * if (name == NULL)
 * {
 *     hr = E_OUTOFMEMORY;
 * }
 * 
 * // Get the family name.
 * if (SUCCEEDED(hr))
 * {
 *     hr = pFamilyNames->GetString(index, name, length+1);
 * }
 * 
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritelocalizedstrings
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteLocalizedStrings extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteLocalizedStrings
     * @type {Guid}
     */
    static IID => Guid("{08256209-099a-4b34-b86d-c22b110e7771}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "FindLocaleName", "GetLocaleNameLength", "GetLocaleName", "GetStringLength", "GetString"]

    /**
     * Gets the number of language/string pairs.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * The number of language/string pairs.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritelocalizedstrings-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * Gets the zero-based index of the locale name/string pair with the specified locale name.
     * @param {PWSTR} localeName Type: <b>const WCHAR*</b>
     * 
     * A null-terminated array of characters containing the locale name to look for.
     * @param {Pointer<Integer>} index Type: <b>UINT32*</b>
     * 
     * The zero-based index of the locale name/string pair. This method initializes <i>index</i> to <b>UINT_MAX</b>.
     * @param {Pointer<BOOL>} exists Type: <b>BOOL*</b>
     * 
     * When this method returns, contains <b>TRUE</b> if the locale name exists; otherwise, <b>FALSE</b>. This method initializes <i>exists</i> to <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the specified locale name does not exist, the return value is <b>S_OK</b>, 
     *      but <i>index</i> is <b>UINT_MAX</b> and <i>exists</i> is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritelocalizedstrings-findlocalename
     */
    FindLocaleName(localeName, index, exists) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        indexMarshal := index is VarRef ? "uint*" : "ptr"
        existsMarshal := exists is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", localeName, indexMarshal, index, existsMarshal, exists, "HRESULT")
        return result
    }

    /**
     * Gets the length in characters (not including the null terminator) of the locale name with the specified index.
     * @param {Integer} index Type: <b>UINT32</b>
     * 
     * Zero-based index of the locale name to be retrieved.
     * @returns {Integer} Type: <b>UINT32*</b>
     * 
     * When this method returns, contains the length in characters of the locale name, not including the null terminator.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritelocalizedstrings-getlocalenamelength
     */
    GetLocaleNameLength(index) {
        result := ComCall(5, this, "uint", index, "uint*", &length := 0, "HRESULT")
        return length
    }

    /**
     * Copies the locale name with the specified index to the specified array.
     * @param {Integer} index Type: <b>UINT32</b>
     * 
     * Zero-based index of the locale name to be retrieved.
     * @param {PWSTR} localeName Type: <b>WCHAR*</b>
     * 
     * When this method returns, contains a character array, which is null-terminated, that receives the locale name from the language/string pair.  The buffer allocated for this array must be at least the size of <i>size</i>, in element count.
     * @param {Integer} size Type: <b>UINT32</b>
     * 
     * The size of the array in characters. The size must include space for the terminating
     *      null character.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritelocalizedstrings-getlocalename
     */
    GetLocaleName(index, localeName, size) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(6, this, "uint", index, "ptr", localeName, "uint", size, "HRESULT")
        return result
    }

    /**
     * Gets the length in characters (not including the null terminator) of the string with the specified index.
     * @param {Integer} index Type: <b>UINT32</b>
     * 
     * A zero-based index of the language/string pair.
     * @returns {Integer} Type: <b>UINT32*</b>
     * 
     * The length in characters of the string, not including the null terminator, from the language/string pair.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritelocalizedstrings-getstringlength
     */
    GetStringLength(index) {
        result := ComCall(7, this, "uint", index, "uint*", &length := 0, "HRESULT")
        return length
    }

    /**
     * Copies the string with the specified index to the specified array.
     * @param {Integer} index Type: <b>UINT32</b>
     * 
     * The zero-based index of the language/string pair to be examined.
     * @param {PWSTR} stringBuffer Type: <b>WCHAR*</b>
     * 
     * The null terminated array of characters that receives the string from the language/string pair.  The buffer allocated for this array should be at least the size of <i>size</i>. <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritelocalizedstrings-getstringlength">GetStringLength</a> can be used to get the size of the array before using this method.
     * @param {Integer} size Type: <b>UINT32</b>
     * 
     * The size of the array in characters. The size must include space for the terminating
     *      null character. <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritelocalizedstrings-getstringlength">GetStringLength</a> can be used to get the size of the array before using this method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritelocalizedstrings-getstring
     */
    GetString(index, stringBuffer, size) {
        stringBuffer := stringBuffer is String ? StrPtr(stringBuffer) : stringBuffer

        result := ComCall(8, this, "uint", index, "ptr", stringBuffer, "uint", size, "HRESULT")
        return result
    }
}
