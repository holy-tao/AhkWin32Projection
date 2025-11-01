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
     * 
     * @param {IHTMLWindow2} htmlWindow 
     * @param {PWSTR} url 
     * @param {Integer} navigationFlags 
     * @param {PWSTR} targetFrameName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationnavigationevents-beforenavigate
     */
    BeforeNavigate(htmlWindow, url, navigationFlags, targetFrameName) {
        url := url is String ? StrPtr(url) : url
        targetFrameName := targetFrameName is String ? StrPtr(targetFrameName) : targetFrameName

        result := ComCall(3, this, "ptr", htmlWindow, "ptr", url, "uint", navigationFlags, "ptr", targetFrameName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLWindow2} htmlWindow 
     * @param {PWSTR} url 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationnavigationevents-navigatecomplete
     */
    NavigateComplete(htmlWindow, url) {
        url := url is String ? StrPtr(url) : url

        result := ComCall(4, this, "ptr", htmlWindow, "ptr", url, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLWindow2} htmlWindow 
     * @param {PWSTR} url 
     * @param {PWSTR} targetFrameName 
     * @param {Integer} statusCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationnavigationevents-navigateerror
     */
    NavigateError(htmlWindow, url, targetFrameName, statusCode) {
        url := url is String ? StrPtr(url) : url
        targetFrameName := targetFrameName is String ? StrPtr(targetFrameName) : targetFrameName

        result := ComCall(5, this, "ptr", htmlWindow, "ptr", url, "ptr", targetFrameName, "uint", statusCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLWindow2} htmlWindow 
     * @param {PWSTR} url 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationnavigationevents-documentcomplete
     */
    DocumentComplete(htmlWindow, url) {
        url := url is String ? StrPtr(url) : url

        result := ComCall(6, this, "ptr", htmlWindow, "ptr", url, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationnavigationevents-downloadbegin
     */
    DownloadBegin() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationnavigationevents-downloadcomplete
     */
    DownloadComplete() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
