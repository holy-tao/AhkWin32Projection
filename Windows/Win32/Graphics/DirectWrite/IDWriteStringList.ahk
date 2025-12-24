#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a collection of strings indexed by number.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritestringlist
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteStringList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteStringList
     * @type {Guid}
     */
    static IID => Guid("{cfee3140-1157-47ca-8b85-31bfcf3f2d0e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetLocaleNameLength", "GetLocaleName", "GetStringLength", "GetString"]

    /**
     * Gets the number of strings in the string list.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * Returns the number of strings in the string list.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritestringlist-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * Gets the length in characters (not including the null terminator) of the locale name with the specified index.
     * @param {Integer} listIndex Type: <b>UINT32</b>
     * 
     * Zero-based index of the locale name.
     * @returns {Integer} Type: <b>UINT32*</b>
     * 
     * Receives the length in characters, not including the null terminator.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritestringlist-getlocalenamelength
     */
    GetLocaleNameLength(listIndex) {
        result := ComCall(4, this, "uint", listIndex, "uint*", &length := 0, "HRESULT")
        return length
    }

    /**
     * Copies the locale name with the specified index to the specified array.
     * @param {Integer} listIndex Type: <b>UINT32</b>
     * 
     * Zero-based index of the locale name.
     * @param {PWSTR} localeName Type: <b>WCHAR*</b>
     * 
     * Character array that receives the locale name.
     * @param {Integer} size Type: <b>UINT32</b>
     * 
     * Size of the array in characters. The size must include space for the terminating null character.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritestringlist-getlocalename
     */
    GetLocaleName(listIndex, localeName, size) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(5, this, "uint", listIndex, "ptr", localeName, "uint", size, "HRESULT")
        return result
    }

    /**
     * Gets the length in characters (not including the null terminator) of the string with the specified index.
     * @param {Integer} listIndex Type: <b>UINT32</b>
     * 
     * Zero-based index of the string.
     * @returns {Integer} Type: <b>UINT32*</b>
     * 
     * Receives the length in characters of the string, not including the null terminator.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritestringlist-getstringlength
     */
    GetStringLength(listIndex) {
        result := ComCall(6, this, "uint", listIndex, "uint*", &length := 0, "HRESULT")
        return length
    }

    /**
     * Copies the string with the specified index to the specified array.
     * @param {Integer} listIndex Type: <b>UINT32</b>
     * 
     * Zero-based index of the string.
     * @param {PWSTR} stringBuffer Type: <b>WCHAR*</b>
     * 
     * Character array that receives the string.
     * @param {Integer} stringBufferSize Type: <b>UINT32</b>
     * 
     * Size of the array in characters. The size must include space for the terminating null character.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritestringlist-getstring
     */
    GetString(listIndex, stringBuffer, stringBufferSize) {
        stringBuffer := stringBuffer is String ? StrPtr(stringBuffer) : stringBuffer

        result := ComCall(7, this, "uint", listIndex, "ptr", stringBuffer, "uint", stringBufferSize, "HRESULT")
        return result
    }
}
