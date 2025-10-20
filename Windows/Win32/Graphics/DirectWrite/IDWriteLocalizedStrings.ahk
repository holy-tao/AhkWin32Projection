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
     * 
     * @returns {Integer} 
     */
    GetCount() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} localeName 
     * @param {Pointer<UInt32>} index 
     * @param {Pointer<BOOL>} exists 
     * @returns {HRESULT} 
     */
    FindLocaleName(localeName, index, exists) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(4, this, "ptr", localeName, "uint*", index, "ptr", exists, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<UInt32>} length 
     * @returns {HRESULT} 
     */
    GetLocaleNameLength(index, length) {
        result := ComCall(5, this, "uint", index, "uint*", length, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {PWSTR} localeName 
     * @param {Integer} size 
     * @returns {HRESULT} 
     */
    GetLocaleName(index, localeName, size) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(6, this, "uint", index, "ptr", localeName, "uint", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<UInt32>} length 
     * @returns {HRESULT} 
     */
    GetStringLength(index, length) {
        result := ComCall(7, this, "uint", index, "uint*", length, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {PWSTR} stringBuffer 
     * @param {Integer} size 
     * @returns {HRESULT} 
     */
    GetString(index, stringBuffer, size) {
        stringBuffer := stringBuffer is String ? StrPtr(stringBuffer) : stringBuffer

        result := ComCall(8, this, "uint", index, "ptr", stringBuffer, "uint", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
