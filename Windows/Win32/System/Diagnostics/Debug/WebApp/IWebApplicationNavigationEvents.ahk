#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Web\MsHtml\IHTMLWindow2.ahk" { IHTMLWindow2 }

/**
 * Enables a debugging or authoring app to receive notification of navigation events.
 * @see https://learn.microsoft.com/windows/win32/api/webapplication/nn-webapplication-iwebapplicationnavigationevents
 * @namespace Windows.Win32.System.Diagnostics.Debug.WebApp
 */
export default struct IWebApplicationNavigationEvents extends IUnknown {
    /**
     * The interface identifier for IWebApplicationNavigationEvents
     * @type {Guid}
     */
    static IID := Guid("{c22615d2-d318-4da2-8422-1fcaf77b10e4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebApplicationNavigationEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BeforeNavigate   : IntPtr
        NavigateComplete : IntPtr
        NavigateError    : IntPtr
        DocumentComplete : IntPtr
        DownloadBegin    : IntPtr
        DownloadComplete : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebApplicationNavigationEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Fired before navigate occurs in the given host (window or frameset element).
     * @param {IHTMLWindow2} htmlWindow Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa741505(v=vs.85)">IHTMLWindow2</a>*</b>
     * 
     * The window or frame in which the navigation is about occur.
     * @param {PWSTR} url Type: <b>LPCWSTR</b>
     * 
     * The URL to navigate to.
     * @param {Integer} navigationFlags Type: <b>DWORD</b>
     * 
     * Flags related to the current navigation.
     * @param {PWSTR} targetFrameName Type: <b>LPCWSTR</b>
     * 
     * The name of the frame in which the navigation is about to occur. The value is <b>null</b> if no named frame is targeted.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Ignored by the host. If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationnavigationevents-beforenavigate
     */
    BeforeNavigate(htmlWindow, url, navigationFlags, targetFrameName) {
        url := url is String ? StrPtr(url) : url
        targetFrameName := targetFrameName is String ? StrPtr(targetFrameName) : targetFrameName

        result := ComCall(3, this, "ptr", htmlWindow, "ptr", url, "uint", navigationFlags, "ptr", targetFrameName, "HRESULT")
        return result
    }

    /**
     * Fired when the document being navigated to becomes visible and enters the navigation stack.
     * @param {IHTMLWindow2} htmlWindow Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa741505(v=vs.85)">IHTMLWindow2</a>*</b>
     * 
     * The window or frame in which the navigation is occurred.
     * @param {PWSTR} url Type: <b>LPCWSTR</b>
     * 
     * The URL which was navigated to
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Ignored by the host. If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationnavigationevents-navigatecomplete
     */
    NavigateComplete(htmlWindow, url) {
        url := url is String ? StrPtr(url) : url

        result := ComCall(4, this, "ptr", htmlWindow, "ptr", url, "HRESULT")
        return result
    }

    /**
     * Fired when a binding error occurs (window or frameset element).
     * @param {IHTMLWindow2} htmlWindow Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa741505(v=vs.85)">IHTMLWindow2</a>*</b>
     * 
     * The window ro frame in which the navigation error occurred.
     * @param {PWSTR} url Type: <b>LPCWSTR</b>
     * 
     * The URL for which navigation failed.
     * @param {PWSTR} targetFrameName Type: <b>LPCWSTR</b>
     * 
     * The name of the frame in which the navigation error occurred. The value is <b>null</b> if no named frame was targeted.
     * @param {Integer} _statusCode Type: <b>DWORD</b>
     * 
     * The error code. Could be a <b>HRESULT</b> or a HTTP status code.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Ignored by the host. If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationnavigationevents-navigateerror
     */
    NavigateError(htmlWindow, url, targetFrameName, _statusCode) {
        url := url is String ? StrPtr(url) : url
        targetFrameName := targetFrameName is String ? StrPtr(targetFrameName) : targetFrameName

        result := ComCall(5, this, "ptr", htmlWindow, "ptr", url, "ptr", targetFrameName, "uint", _statusCode, "HRESULT")
        return result
    }

    /**
     * Fired when the document being navigated to reaches ReadyState_Complete.
     * @param {IHTMLWindow2} htmlWindow Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa741505(v=vs.85)">IHTMLWindow2</a>*</b>
     * 
     * The window or frame in which the document is loaded.
     * @param {PWSTR} url Type: <b>LPCWSTR</b>
     * 
     * The URL of the document.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Ignored by the host. If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationnavigationevents-documentcomplete
     */
    DocumentComplete(htmlWindow, url) {
        url := url is String ? StrPtr(url) : url

        result := ComCall(6, this, "ptr", htmlWindow, "ptr", url, "HRESULT")
        return result
    }

    /**
     * Download of a page has started.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Ignored by the host. If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationnavigationevents-downloadbegin
     */
    DownloadBegin() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Download of a page has completed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Ignored by the host. If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationnavigationevents-downloadcomplete
     */
    DownloadComplete() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWebApplicationNavigationEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BeforeNavigate := CallbackCreate(GetMethod(implObj, "BeforeNavigate"), flags, 5)
        this.vtbl.NavigateComplete := CallbackCreate(GetMethod(implObj, "NavigateComplete"), flags, 3)
        this.vtbl.NavigateError := CallbackCreate(GetMethod(implObj, "NavigateError"), flags, 5)
        this.vtbl.DocumentComplete := CallbackCreate(GetMethod(implObj, "DocumentComplete"), flags, 3)
        this.vtbl.DownloadBegin := CallbackCreate(GetMethod(implObj, "DownloadBegin"), flags, 1)
        this.vtbl.DownloadComplete := CallbackCreate(GetMethod(implObj, "DownloadComplete"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BeforeNavigate)
        CallbackFree(this.vtbl.NavigateComplete)
        CallbackFree(this.vtbl.NavigateError)
        CallbackFree(this.vtbl.DocumentComplete)
        CallbackFree(this.vtbl.DownloadBegin)
        CallbackFree(this.vtbl.DownloadComplete)
    }
}
