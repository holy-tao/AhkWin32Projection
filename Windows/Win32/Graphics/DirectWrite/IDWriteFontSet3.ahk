#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontSet2.ahk

/**
 * Represents a font set. (IDWriteFontSet3)
 * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nn-dwrite_3-idwritefontset3
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontSet3 extends IDWriteFontSet2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontSet3
     * @type {Guid}
     */
    static IID => Guid("{7c073ef2-a7f4-4045-8c32-8ab8ae640f90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontSourceType", "GetFontSourceNameLength", "GetFontSourceName"]

    /**
     * Retrieves the font source type of the specified font.
     * @param {Integer} fontIndex Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Zero-based index of the font.
     * @returns {Integer} Type: **[DWRITE_FONT_SOURCE_TYPE](./ne-dwrite_3-dwrite_font_source_type.md)**
     * 
     * The font source type of the specified font.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritefontset3-getfontsourcetype
     */
    GetFontSourceType(fontIndex) {
        result := ComCall(27, this, "uint", fontIndex, "int")
        return result
    }

    /**
     * Retrieves the length of the font source name for the specified font.
     * @param {Integer} listIndex Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Zero-based index of the font.
     * @returns {Integer} Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The length of the font source name for the specified font.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritefontset3-getfontsourcenamelength
     */
    GetFontSourceNameLength(listIndex) {
        result := ComCall(28, this, "uint", listIndex, "uint")
        return result
    }

    /**
     * Copies the font source name (for the specified font) into an output array.
     * @param {Integer} listIndex Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Zero-based index of the font.
     * @param {PWSTR} stringBuffer Type: **[WCHAR](/windows/win32/winprog/windows-data-types)\***
     * 
     * Character array that receives the string. Call [GetFontSourceNameLength](./nf-dwrite_3-idwritefontset3-getfontsourcenamelength.md) to determine the size of array to allocate.
     * @param {Integer} stringBufferSize Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Size of the array in characters. The size must include space for the terminating null character.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritefontset3-getfontsourcename
     */
    GetFontSourceName(listIndex, stringBuffer, stringBufferSize) {
        stringBuffer := stringBuffer is String ? StrPtr(stringBuffer) : stringBuffer

        result := ComCall(29, this, "uint", listIndex, "ptr", stringBuffer, "uint", stringBufferSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
