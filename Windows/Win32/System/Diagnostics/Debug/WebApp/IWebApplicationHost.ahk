#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Web\MsHtml\IHTMLDocument2.ahk" { IHTMLDocument2 }
#Import "..\..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods and properties that are implemented by the WWAHost.
 * @see https://learn.microsoft.com/windows/win32/api/webapplication/nn-webapplication-iwebapplicationhost
 * @namespace Windows.Win32.System.Diagnostics.Debug.WebApp
 */
export default struct IWebApplicationHost extends IUnknown {
    /**
     * The interface identifier for IWebApplicationHost
     * @type {Guid}
     */
    static IID := Guid("{cecbd2c3-a3a5-4749-9681-20e9161c6794}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebApplicationHost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_HWND     : IntPtr
        get_Document : IntPtr
        Refresh      : IntPtr
        Advise       : IntPtr
        Unadvise     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebApplicationHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    HWND {
        get => this.get_HWND()
    }

    /**
     * @type {IHTMLDocument2} 
     */
    Document {
        get => this.get_Document()
    }

    /**
     * Gets the handle of the current WWAHost window.
     * @param {Pointer<HWND>} _hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationhost-get_hwnd
     */
    get_HWND(_hwnd) {
        result := ComCall(3, this, HWND.Ptr, _hwnd, "HRESULT")
        return result
    }

    /**
     * Gets the HTML document object model of the current top-level document.
     * @returns {IHTMLDocument2} 
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationhost-get_document
     */
    get_Document() {
        result := ComCall(4, this, "ptr*", &_htmlDocument := 0, "HRESULT")
        return IHTMLDocument2(_htmlDocument)
    }

    /**
     * Refreshes the current document without sending a 'Pragma:no-cache' HTTP header to the server.
     * @remarks
     * Use this method when the currently executing code is outside of the activation path. If the code is executing inside the activation path, use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/webapplication/nf-webapplication-iwebapplicationactivation-cancelpendingactivation">IWebApplicationActivation::CancelPendingActivation</a> instead.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationhost-refresh
     */
    Refresh() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Establishes a connection to allow a client to receive events.
     * @param {Pointer<Guid>} interfaceId Type: <b>REFIID</b>
     * 
     * The identifier of the event interface.
     * @param {IUnknown} callback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * The caller's event interface.
     * @param {Pointer<Integer>} cookie Type: <b>DWORD*</b>
     * 
     * A token that uniquely identifies this connection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationhost-advise
     */
    Advise(interfaceId, callback, cookie) {
        cookieMarshal := cookie is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, Guid.Ptr, interfaceId, "ptr", callback, cookieMarshal, cookie, "HRESULT")
        return result
    }

    /**
     * Removes a previously established connection.
     * @param {Integer} cookie Type: <b>DWORD</b>
     * 
     * A connection token previously returned from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/debug_wwahost/iwebapplicationhost-advise">Advise</a> method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationhost-unadvise
     */
    Unadvise(cookie) {
        result := ComCall(7, this, "uint", cookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWebApplicationHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_HWND := CallbackCreate(GetMethod(implObj, "get_HWND"), flags, 2)
        this.vtbl.get_Document := CallbackCreate(GetMethod(implObj, "get_Document"), flags, 2)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
        this.vtbl.Advise := CallbackCreate(GetMethod(implObj, "Advise"), flags, 4)
        this.vtbl.Unadvise := CallbackCreate(GetMethod(implObj, "Unadvise"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_HWND)
        CallbackFree(this.vtbl.get_Document)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.Advise)
        CallbackFree(this.vtbl.Unadvise)
    }
}
