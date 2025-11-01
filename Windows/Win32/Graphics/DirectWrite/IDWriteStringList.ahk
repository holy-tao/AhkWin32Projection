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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritestringlist-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @param {Pointer<Integer>} length 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritestringlist-getlocalenamelength
     */
    GetLocaleNameLength(listIndex, length) {
        result := ComCall(4, this, "uint", listIndex, "uint*", length, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @param {PWSTR} localeName 
     * @param {Integer} size 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritestringlist-getlocalename
     */
    GetLocaleName(listIndex, localeName, size) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(5, this, "uint", listIndex, "ptr", localeName, "uint", size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @param {Pointer<Integer>} length 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritestringlist-getstringlength
     */
    GetStringLength(listIndex, length) {
        result := ComCall(6, this, "uint", listIndex, "uint*", length, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @param {PWSTR} stringBuffer 
     * @param {Integer} stringBufferSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritestringlist-getstring
     */
    GetString(listIndex, stringBuffer, stringBufferSize) {
        stringBuffer := stringBuffer is String ? StrPtr(stringBuffer) : stringBuffer

        result := ComCall(7, this, "uint", listIndex, "ptr", stringBuffer, "uint", stringBufferSize, "HRESULT")
        return result
    }
}
