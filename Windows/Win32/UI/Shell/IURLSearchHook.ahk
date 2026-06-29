#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that is used by the browser to translate the address of an unknown URL protocol.
 * @remarks
 * When attempting to browse to a URL address that does not contain a protocol, the browser will first attempt to determine the correct protocol from the address. If this is not successful, the browser will create URL Search Hook objects and call each object's <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iurlsearchhook-translate">Translate</a> method until the address is translated or all of the hooks have been queried.
 * 
 * URL Search Hooks are registered by adding a value that contains the object's class identifier (CLSID) string under the following key in the registry: 
 * 				
 * <pre><b>HKEY_LOCAL_MACHINE</b>
 *    <b>Software</b>
 *       <b>Microsoft</b>
 *          <b>Internet Explorer</b>
 *             <b>UrlSearchHooks</b></pre>
 * 
 * 
 * Implement this interface if your application defines a custom URL protocol and if address translation for this protocol is required.
 * 
 * You do not typically use this interface; it is called by the browser.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-iurlsearchhook
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IURLSearchHook extends IUnknown {
    /**
     * The interface identifier for IURLSearchHook
     * @type {Guid}
     */
    static IID := Guid("{ac60f6a0-0fd9-11d0-99cb-00c04fd64497}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IURLSearchHook interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Translate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IURLSearchHook.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by the browser when the browser cannot determine the protocol of a URL address.
     * @param {PWSTR} pwszSearchURL Type: <b>PWSTR</b>
     * 
     * The address of a wide character buffer that, on entry, contains the URL address for which the browser is trying to determine the protocol. On exit, this buffer contains the modified URL address if the method was successful. See the return value for more information.
     * @param {Integer} cchBufferSize Type: <b>DWORD</b>
     * 
     * The size, in characters, of the buffer at <i>pwszSearchURL</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method must return one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL address was completely translated. The <i>lpwszSearchURL</i> parameter contains the full URL address. The browser will not call any other URL Search Hooks and will attempt to browse to the modified address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL address has been partially processed, but further translation is still required. The <i>lpwszSearchURL</i> parameter contains the result of the processing. The browser will continue executing the rest of the URL Search Hooks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL address was not translated. The <i>lpwszSearchURL</i> parameter has not been modified. The browser will continue executing the rest of the URL Search Hooks.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iurlsearchhook-translate
     */
    Translate(pwszSearchURL, cchBufferSize) {
        pwszSearchURL := pwszSearchURL is String ? StrPtr(pwszSearchURL) : pwszSearchURL

        result := ComCall(3, this, "ptr", pwszSearchURL, "uint", cchBufferSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IURLSearchHook.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Translate := CallbackCreate(GetMethod(implObj, "Translate"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Translate)
    }
}
