#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a collection of strings indexed by number.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritestringlist
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteStringList extends IUnknown {
    /**
     * The interface identifier for IDWriteStringList
     * @type {Guid}
     */
    static IID := Guid("{cfee3140-1157-47ca-8b85-31bfcf3f2d0e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteStringList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount            : IntPtr
        GetLocaleNameLength : IntPtr
        GetLocaleName       : IntPtr
        GetStringLength     : IntPtr
        GetString           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteStringList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of strings in the string list.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * Returns the number of strings in the string list.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritestringlist-getcount
     */
    GetCount() {
        result := ComCall(3, this, UInt32)
        return result
    }

    /**
     * Gets the length in characters (not including the null terminator) of the locale name with the specified index. (IDWriteStringList.GetLocaleNameLength)
     * @param {Integer} listIndex Type: <b>UINT32</b>
     * 
     * Zero-based index of the locale name.
     * @returns {Integer} Type: <b>UINT32*</b>
     * 
     * Receives the length in characters, not including the null terminator.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritestringlist-getlocalenamelength
     */
    GetLocaleNameLength(listIndex) {
        result := ComCall(4, this, "uint", listIndex, "uint*", &length := 0, "HRESULT")
        return length
    }

    /**
     * Copies the locale name with the specified index to the specified array. (IDWriteStringList.GetLocaleName)
     * @param {Integer} listIndex Type: <b>UINT32</b>
     * 
     * Zero-based index of the locale name.
     * @param {PWSTR} localeName Type: <b>WCHAR*</b>
     * 
     * Character array that receives the locale name.
     * @param {Integer} _size Type: <b>UINT32</b>
     * 
     * Size of the array in characters. The size must include space for the terminating null character.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritestringlist-getlocalename
     */
    GetLocaleName(listIndex, localeName, _size) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(5, this, "uint", listIndex, "ptr", localeName, "uint", _size, "HRESULT")
        return result
    }

    /**
     * Gets the length in characters (not including the null terminator) of the string with the specified index. (IDWriteStringList.GetStringLength)
     * @param {Integer} listIndex Type: <b>UINT32</b>
     * 
     * Zero-based index of the string.
     * @returns {Integer} Type: <b>UINT32*</b>
     * 
     * Receives the length in characters of the string, not including the null terminator.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritestringlist-getstringlength
     */
    GetStringLength(listIndex) {
        result := ComCall(6, this, "uint", listIndex, "uint*", &length := 0, "HRESULT")
        return length
    }

    /**
     * Copies the string with the specified index to the specified array. (IDWriteStringList.GetString)
     * @param {Integer} listIndex Type: <b>UINT32</b>
     * 
     * Zero-based index of the string.
     * @param {PWSTR} stringBuffer Type: <b>WCHAR*</b>
     * 
     * Character array that receives the string.
     * @param {Integer} stringBufferSize Type: <b>UINT32</b>
     * 
     * Size of the array in characters. The size must include space for the terminating null character.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritestringlist-getstring
     */
    GetString(listIndex, stringBuffer, stringBufferSize) {
        stringBuffer := stringBuffer is String ? StrPtr(stringBuffer) : stringBuffer

        result := ComCall(7, this, "uint", listIndex, "ptr", stringBuffer, "uint", stringBufferSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDWriteStringList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 1)
        this.vtbl.GetLocaleNameLength := CallbackCreate(GetMethod(implObj, "GetLocaleNameLength"), flags, 3)
        this.vtbl.GetLocaleName := CallbackCreate(GetMethod(implObj, "GetLocaleName"), flags, 4)
        this.vtbl.GetStringLength := CallbackCreate(GetMethod(implObj, "GetStringLength"), flags, 3)
        this.vtbl.GetString := CallbackCreate(GetMethod(implObj, "GetString"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetLocaleNameLength)
        CallbackFree(this.vtbl.GetLocaleName)
        CallbackFree(this.vtbl.GetStringLength)
        CallbackFree(this.vtbl.GetString)
    }
}
