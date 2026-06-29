#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IUrlAccessor.ahk" { IUrlAccessor }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Extends functionality of the IUrlAccessor interface.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-iurlaccessor2
 * @namespace Windows.Win32.System.Search
 */
export default struct IUrlAccessor2 extends IUrlAccessor {
    /**
     * The interface identifier for IUrlAccessor2
     * @type {Guid}
     */
    static IID := Guid("{c7310734-ac80-11d1-8df3-00c04fb6ef4f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUrlAccessor2 interfaces
    */
    struct Vtbl extends IUrlAccessor.Vtbl {
        GetDisplayUrl : IntPtr
        IsDocument    : IntPtr
        GetCodePage   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUrlAccessor2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the user-friendly path for the URL item.
     * @remarks
     * Protocol handlers can reveal hierarchical or non-hierarchical stores. If the data store is organized hierarchically, users can scope their searches to a specified container object like a directory or folder.
     * @param {PWSTR} wszDocUrl Type: <b>WCHAR[]</b>
     * 
     * Receives the display URL as a null-terminated Unicode string.
     * @param {Integer} dwSize Type: <b>DWORD</b>
     * 
     * Size in <b>TCHAR</b><b>s</b> of <i>wszDocUrl</i>.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Receives a pointer to the number of
     *                 <b>TCHAR</b><b>s</b> written
     *                 to <i>wszDocUrl</i>, not including the terminating <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor2-getdisplayurl
     */
    GetDisplayUrl(wszDocUrl, dwSize) {
        wszDocUrl := wszDocUrl is String ? StrPtr(wszDocUrl) : wszDocUrl

        result := ComCall(16, this, "ptr", wszDocUrl, "uint", dwSize, "uint*", &pdwLength := 0, "HRESULT")
        return pdwLength
    }

    /**
     * Ascertains whether an item URL is a document or directory.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_FALSE if the item is a directory; otherwise, it returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor2-isdocument
     */
    IsDocument() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Gets the code page for properties of the URL item.
     * @param {PWSTR} wszCodePage Type: <b>WCHAR[]</b>
     * 
     * Receives the code page as a null-terminated Unicode string.
     * @param {Integer} dwSize Type: <b>DWORD</b>
     * 
     * Size of <i>wszCodePage</i> 
     *                     in <b>TCHAR</b><b>s</b>.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Receives a pointer to the number of
     *                 <b>TCHAR</b><b>s</b> written to
     *                <i>wszCodePage</i>, not including the terminating <b>NULL</b> character.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor2-getcodepage
     */
    GetCodePage(wszCodePage, dwSize) {
        wszCodePage := wszCodePage is String ? StrPtr(wszCodePage) : wszCodePage

        result := ComCall(18, this, "ptr", wszCodePage, "uint", dwSize, "uint*", &pdwLength := 0, "HRESULT")
        return pdwLength
    }

    Query(iid) {
        if (IUrlAccessor2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDisplayUrl := CallbackCreate(GetMethod(implObj, "GetDisplayUrl"), flags, 4)
        this.vtbl.IsDocument := CallbackCreate(GetMethod(implObj, "IsDocument"), flags, 1)
        this.vtbl.GetCodePage := CallbackCreate(GetMethod(implObj, "GetCodePage"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDisplayUrl)
        CallbackFree(this.vtbl.IsDocument)
        CallbackFree(this.vtbl.GetCodePage)
    }
}
