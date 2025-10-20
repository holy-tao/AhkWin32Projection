#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * Enables a debugging or authoring app to receive notification of scripting engine events.
 * @see https://docs.microsoft.com/windows/win32/api//webapplication/nn-webapplication-iwebapplicationscriptevents
 * @namespace Windows.Win32.System.Diagnostics.Debug.WebApp
 * @version v4.0.30319
 */
class IWebApplicationScriptEvents extends IUnknown{
    /**
     * The interface identifier for IWebApplicationScriptEvents
     * @type {Guid}
     */
    static IID => Guid("{7c3f6998-1567-4bba-b52b-48d32141d613}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IHTMLWindow2>} htmlWindow 
     * @returns {HRESULT} 
     */
    BeforeScriptExecute(htmlWindow) {
        result := ComCall(3, this, "ptr", htmlWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLWindow2>} htmlWindow 
     * @param {Pointer<IActiveScriptError>} scriptError 
     * @param {PWSTR} url 
     * @param {BOOL} errorHandled 
     * @returns {HRESULT} 
     */
    ScriptError(htmlWindow, scriptError, url, errorHandled) {
        url := url is String ? StrPtr(url) : url

        result := ComCall(4, this, "ptr", htmlWindow, "ptr", scriptError, "ptr", url, "int", errorHandled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
