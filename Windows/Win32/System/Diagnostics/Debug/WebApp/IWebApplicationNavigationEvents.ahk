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
     * 
     * @param {Pointer<IHTMLWindow2>} htmlWindow 
     * @param {PWSTR} url 
     * @param {Integer} navigationFlags 
     * @param {PWSTR} targetFrameName 
     * @returns {HRESULT} 
     */
    BeforeNavigate(htmlWindow, url, navigationFlags, targetFrameName) {
        url := url is String ? StrPtr(url) : url
        targetFrameName := targetFrameName is String ? StrPtr(targetFrameName) : targetFrameName

        result := ComCall(3, this, "ptr", htmlWindow, "ptr", url, "uint", navigationFlags, "ptr", targetFrameName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLWindow2>} htmlWindow 
     * @param {PWSTR} url 
     * @returns {HRESULT} 
     */
    NavigateComplete(htmlWindow, url) {
        url := url is String ? StrPtr(url) : url

        result := ComCall(4, this, "ptr", htmlWindow, "ptr", url, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLWindow2>} htmlWindow 
     * @param {PWSTR} url 
     * @param {PWSTR} targetFrameName 
     * @param {Integer} statusCode 
     * @returns {HRESULT} 
     */
    NavigateError(htmlWindow, url, targetFrameName, statusCode) {
        url := url is String ? StrPtr(url) : url
        targetFrameName := targetFrameName is String ? StrPtr(targetFrameName) : targetFrameName

        result := ComCall(5, this, "ptr", htmlWindow, "ptr", url, "ptr", targetFrameName, "uint", statusCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLWindow2>} htmlWindow 
     * @param {PWSTR} url 
     * @returns {HRESULT} 
     */
    DocumentComplete(htmlWindow, url) {
        url := url is String ? StrPtr(url) : url

        result := ComCall(6, this, "ptr", htmlWindow, "ptr", url, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DownloadBegin() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DownloadComplete() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
