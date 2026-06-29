#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDWriteFontFileLoader.ahk" { IDWriteFontFileLoader }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * A built-in implementation of the IDWriteFontFileLoader interface, that operates on local font files and exposes local font file information from the font file reference key.
 * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritelocalfontfileloader
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteLocalFontFileLoader extends IDWriteFontFileLoader {
    /**
     * The interface identifier for IDWriteLocalFontFileLoader
     * @type {Guid}
     */
    static IID := Guid("{b2d9f3ec-c9fe-4a11-a2ec-d86208f7c0a2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteLocalFontFileLoader interfaces
    */
    struct Vtbl extends IDWriteFontFileLoader.Vtbl {
        GetFilePathLengthFromKey : IntPtr
        GetFilePathFromKey       : IntPtr
        GetLastWriteTimeFromKey  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteLocalFontFileLoader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Obtains the length of the absolute file path from the font file reference key.
     * @param {Integer} fontFileReferenceKey Type: **const void\***
     * 
     * Font file reference key that uniquely identifies the local font file within the scope of the font loader being used.
     * @param {Integer} fontFileReferenceKeySize Type: **UINT32**
     * 
     * Size of font file reference key in bytes.
     * @returns {Integer} Type: **UINT32\***
     * 
     * Length of the file path string, not including the terminated **NULL** character.
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritelocalfontfileloader-getfilepathlengthfromkey
     */
    GetFilePathLengthFromKey(fontFileReferenceKey, fontFileReferenceKeySize) {
        result := ComCall(4, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "uint*", &filePathLength := 0, "HRESULT")
        return filePathLength
    }

    /**
     * Obtains the absolute font file path from the font file reference key.
     * @param {Integer} fontFileReferenceKey Type: **const void\***
     * 
     * The font file reference key that uniquely identifies the local font file within the scope of the font loader being used.
     * @param {Integer} fontFileReferenceKeySize Type: **UINT32**
     * 
     * The size of font file reference key in bytes.
     * @param {PWSTR} filePath Type: **WCHAR\***
     * 
     * The character array that receives the local file path.
     * @param {Integer} filePathSize Type: **UINT32**
     * 
     * The length of the file path character array.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritelocalfontfileloader-getfilepathfromkey
     */
    GetFilePathFromKey(fontFileReferenceKey, fontFileReferenceKeySize, filePath, filePathSize) {
        filePath := filePath is String ? StrPtr(filePath) : filePath

        result := ComCall(5, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "ptr", filePath, "uint", filePathSize, "HRESULT")
        return result
    }

    /**
     * Obtains the last write time of the file from the font file reference key.
     * @param {Integer} fontFileReferenceKey Type: **const void\***
     * 
     * The font file reference key that uniquely identifies the local font file within the scope of the font loader being used.
     * @param {Integer} fontFileReferenceKeySize Type: **UINT32**
     * 
     * The size of font file reference key in bytes.
     * @returns {FILETIME} Type: **FILETIME\***
     * 
     * The time of the last font file modification.
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritelocalfontfileloader-getlastwritetimefromkey
     */
    GetLastWriteTimeFromKey(fontFileReferenceKey, fontFileReferenceKeySize) {
        lastWriteTime := FILETIME()
        result := ComCall(6, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, FILETIME.Ptr, lastWriteTime, "HRESULT")
        return lastWriteTime
    }

    Query(iid) {
        if (IDWriteLocalFontFileLoader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFilePathLengthFromKey := CallbackCreate(GetMethod(implObj, "GetFilePathLengthFromKey"), flags, 4)
        this.vtbl.GetFilePathFromKey := CallbackCreate(GetMethod(implObj, "GetFilePathFromKey"), flags, 5)
        this.vtbl.GetLastWriteTimeFromKey := CallbackCreate(GetMethod(implObj, "GetLastWriteTimeFromKey"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFilePathLengthFromKey)
        CallbackFree(this.vtbl.GetFilePathFromKey)
        CallbackFree(this.vtbl.GetLastWriteTimeFromKey)
    }
}
