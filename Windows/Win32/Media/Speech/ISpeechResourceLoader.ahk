#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechResourceLoader extends IDispatch {
    /**
     * The interface identifier for ISpeechResourceLoader
     * @type {Guid}
     */
    static IID := Guid("{b9ac5783-fcd0-4b21-b119-b4f8da8fd2c3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechResourceLoader interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        LoadResource     : IntPtr
        GetLocalCopy     : IntPtr
        ReleaseLocalCopy : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechResourceLoader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a handle that can be used to obtain a pointer to the first byte of the specified resource in memory.
     * @remarks
     * The return type of <b>LoadResource</b> is <b>HGLOBAL</b> for backward compatibility, not because the function returns a handle to a global memory block. Do not pass this handle to the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globallock">GlobalLock</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalfree">GlobalFree</a> function. To obtain a pointer to the first byte of the resource data, call the <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-lockresource">LockResource</a> function; to obtain the size of the resource, call <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-sizeofresource">SizeofResource</a>. 
     * 
     * [GlobalSize](/windows/desktop/api/winbase/nf-winbase-globalsize) returns 0 for a resource HGLOBAL. As a result, any APIs that depend on GlobalSize to determine the size of the HGLOBAL will not function correctly. For example, use [SHCreateMemStream](/windows/win32/api/shlwapi/nf-shlwapi-shcreatememstream) instead of [CreateStreamOnHGlobal](/windows/win32/api/combaseapi/nf-combaseapi-createstreamonhglobal).
     * 
     * To use a resource immediately, an application should use the following resource-specific functions to find and load the resource in one call.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Function</th>
     * <th>Action</th>
     * <th>To remove resource</th>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a>
     * </td>
     * <td>Loads and formats a message-table entry</td>
     * <td>No action needed</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-loadacceleratorsa">LoadAccelerators</a>
     * </td>
     * <td>Loads an accelerator table</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-destroyacceleratortable">DestroyAcceleratorTable</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadbitmapa">LoadBitmap</a>
     * </td>
     * <td>Loads a bitmap resource</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-loadcursora">LoadCursor</a>
     * </td>
     * <td>Loads a cursor resource</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-destroycursor">DestroyCursor</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-loadicona">LoadIcon</a>
     * </td>
     * <td>Loads an icon resource</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-destroyicon">DestroyIcon</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-loadmenua">LoadMenu</a>
     * </td>
     * <td>Loads a menu resource</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-destroymenu">DestroyMenu</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-loadstringa">LoadString</a>
     * </td>
     * <td>Loads a string resource</td>
     * <td>No action needed</td>
     * </tr>
     * </table>
     *  
     * 
     * For example, an application can use the <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-loadicona">LoadIcon</a> function to load an icon for display on the screen, followed by <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-destroyicon">DestroyIcon</a> when done.
     * @param {BSTR} bstrResourceUri 
     * @param {VARIANT_BOOL} fAlwaysReload 
     * @param {Pointer<IUnknown>} pStream 
     * @param {Pointer<BSTR>} pbstrMIMEType 
     * @param {Pointer<VARIANT_BOOL>} pfModified 
     * @param {Pointer<BSTR>} pbstrRedirectUrl 
     * @returns {HRESULT} Type: <b>HGLOBAL</b>
     * 
     * If the function succeeds, the return value is a handle to the data associated with the resource.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-loadresource
     */
    LoadResource(bstrResourceUri, fAlwaysReload, pStream, pbstrMIMEType, pfModified, pbstrRedirectUrl) {
        bstrResourceUri := bstrResourceUri is String ? BSTR.Alloc(bstrResourceUri).Value : bstrResourceUri

        pfModifiedMarshal := pfModified is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, BSTR, bstrResourceUri, VARIANT_BOOL, fAlwaysReload, IUnknown.Ptr, pStream, BSTR.Ptr, pbstrMIMEType, pfModifiedMarshal, pfModified, BSTR.Ptr, pbstrRedirectUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrResourceUri 
     * @param {Pointer<BSTR>} pbstrLocalPath 
     * @param {Pointer<BSTR>} pbstrMIMEType 
     * @param {Pointer<BSTR>} pbstrRedirectUrl 
     * @returns {HRESULT} 
     */
    GetLocalCopy(bstrResourceUri, pbstrLocalPath, pbstrMIMEType, pbstrRedirectUrl) {
        bstrResourceUri := bstrResourceUri is String ? BSTR.Alloc(bstrResourceUri).Value : bstrResourceUri

        result := ComCall(8, this, BSTR, bstrResourceUri, BSTR.Ptr, pbstrLocalPath, BSTR.Ptr, pbstrMIMEType, BSTR.Ptr, pbstrRedirectUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pbstrLocalPath 
     * @returns {HRESULT} 
     */
    ReleaseLocalCopy(pbstrLocalPath) {
        pbstrLocalPath := pbstrLocalPath is String ? BSTR.Alloc(pbstrLocalPath).Value : pbstrLocalPath

        result := ComCall(9, this, BSTR, pbstrLocalPath, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpeechResourceLoader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LoadResource := CallbackCreate(GetMethod(implObj, "LoadResource"), flags, 7)
        this.vtbl.GetLocalCopy := CallbackCreate(GetMethod(implObj, "GetLocalCopy"), flags, 5)
        this.vtbl.ReleaseLocalCopy := CallbackCreate(GetMethod(implObj, "ReleaseLocalCopy"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LoadResource)
        CallbackFree(this.vtbl.GetLocalCopy)
        CallbackFree(this.vtbl.ReleaseLocalCopy)
    }
}
