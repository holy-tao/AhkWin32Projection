#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * Enables a debugging or authoring app to receive notification of navigation events.
 * @see https://docs.microsoft.com/windows/win32/api//webapplication/nn-webapplication-iwebapplicationnavigationevents
 * @namespace Windows.Win32.System.Diagnostics.Debug.WebApp
 * @version v4.0.30319
 */
class IWebApplicationNavigationEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebApplicationNavigationEvents
     * @type {Guid}
     */
    static IID => Guid("{c22615d2-d318-4da2-8422-1fcaf77b10e4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeforeNavigate", "NavigateComplete", "NavigateError", "DocumentComplete", "DownloadBegin", "DownloadComplete"]

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
     * @see https://docs.microsoft.com/windows/win32/api//webapplication/nf-webapplication-iwebapplicationnavigationevents-beforenavigate
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
     * @see https://docs.microsoft.com/windows/win32/api//webapplication/nf-webapplication-iwebapplicationnavigationevents-navigatecomplete
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
     * @param {Integer} statusCode Type: <b>DWORD</b>
     * 
     * The error code. Could be a <b>HRESULT</b> or a HTTP status code.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Ignored by the host. If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//webapplication/nf-webapplication-iwebapplicationnavigationevents-navigateerror
     */
    NavigateError(htmlWindow, url, targetFrameName, statusCode) {
        url := url is String ? StrPtr(url) : url
        targetFrameName := targetFrameName is String ? StrPtr(targetFrameName) : targetFrameName

        result := ComCall(5, this, "ptr", htmlWindow, "ptr", url, "ptr", targetFrameName, "uint", statusCode, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//webapplication/nf-webapplication-iwebapplicationnavigationevents-documentcomplete
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
     * @see https://docs.microsoft.com/windows/win32/api//webapplication/nf-webapplication-iwebapplicationnavigationevents-downloadbegin
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
     * @see https://docs.microsoft.com/windows/win32/api//webapplication/nf-webapplication-iwebapplicationnavigationevents-downloadcomplete
     */
    DownloadComplete() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
