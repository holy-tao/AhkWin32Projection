#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechResourceLoader extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechResourceLoader
     * @type {Guid}
     */
    static IID => Guid("{b9ac5783-fcd0-4b21-b119-b4f8da8fd2c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadResource", "GetLocalCopy", "ReleaseLocalCopy"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/libloaderapi/nf-libloaderapi-loadresource
     */
    LoadResource(bstrResourceUri, fAlwaysReload, pStream, pbstrMIMEType, pfModified, pbstrRedirectUrl) {
        if(bstrResourceUri is String) {
            pin := BSTR.Alloc(bstrResourceUri)
            bstrResourceUri := pin.Value
        }

        pfModifiedMarshal := pfModified is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, "ptr", bstrResourceUri, "short", fAlwaysReload, "ptr*", pStream, "ptr", pbstrMIMEType, pfModifiedMarshal, pfModified, "ptr", pbstrRedirectUrl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(bstrResourceUri is String) {
            pin := BSTR.Alloc(bstrResourceUri)
            bstrResourceUri := pin.Value
        }

        result := ComCall(8, this, "ptr", bstrResourceUri, "ptr", pbstrLocalPath, "ptr", pbstrMIMEType, "ptr", pbstrRedirectUrl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} pbstrLocalPath 
     * @returns {HRESULT} 
     */
    ReleaseLocalCopy(pbstrLocalPath) {
        if(pbstrLocalPath is String) {
            pin := BSTR.Alloc(pbstrLocalPath)
            pbstrLocalPath := pin.Value
        }

        result := ComCall(9, this, "ptr", pbstrLocalPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
