#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteFontSet2.ahk" { IDWriteFontSet2 }
#Import ".\DWRITE_FONT_SOURCE_TYPE.ahk" { DWRITE_FONT_SOURCE_TYPE }

/**
 * Represents a font set. (IDWriteFontSet3)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset3
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontSet3 extends IDWriteFontSet2 {
    /**
     * The interface identifier for IDWriteFontSet3
     * @type {Guid}
     */
    static IID := Guid("{7c073ef2-a7f4-4045-8c32-8ab8ae640f90}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontSet3 interfaces
    */
    struct Vtbl extends IDWriteFontSet2.Vtbl {
        GetFontSourceType       : IntPtr
        GetFontSourceNameLength : IntPtr
        GetFontSourceName       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontSet3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the font source type of the specified font.
     * @param {Integer} fontIndex Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Zero-based index of the font.
     * @returns {DWRITE_FONT_SOURCE_TYPE} Type: **[DWRITE_FONT_SOURCE_TYPE](./ne-dwrite_3-dwrite_font_source_type.md)**
     * 
     * The font source type of the specified font.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset3-getfontsourcetype
     */
    GetFontSourceType(fontIndex) {
        result := ComCall(27, this, "uint", fontIndex, DWRITE_FONT_SOURCE_TYPE)
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
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset3-getfontsourcenamelength
     */
    GetFontSourceNameLength(listIndex) {
        result := ComCall(28, this, "uint", listIndex, UInt32)
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
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset3-getfontsourcename
     */
    GetFontSourceName(listIndex, stringBuffer, stringBufferSize) {
        stringBuffer := stringBuffer is String ? StrPtr(stringBuffer) : stringBuffer

        result := ComCall(29, this, "uint", listIndex, "ptr", stringBuffer, "uint", stringBufferSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDWriteFontSet3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFontSourceType := CallbackCreate(GetMethod(implObj, "GetFontSourceType"), flags, 2)
        this.vtbl.GetFontSourceNameLength := CallbackCreate(GetMethod(implObj, "GetFontSourceNameLength"), flags, 2)
        this.vtbl.GetFontSourceName := CallbackCreate(GetMethod(implObj, "GetFontSourceName"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFontSourceType)
        CallbackFree(this.vtbl.GetFontSourceNameLength)
        CallbackFree(this.vtbl.GetFontSourceName)
    }
}
