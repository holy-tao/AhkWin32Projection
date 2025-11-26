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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeforeScriptExecute", "ScriptError"]

    /**
     * 
     * @param {IHTMLWindow2} htmlWindow 
     * @returns {HRESULT} 
     */
    BeforeScriptExecute(htmlWindow) {
        result := ComCall(3, this, "ptr", htmlWindow, "HRESULT")
        return result
    }

    /**
     * Fired when an unhandled script error occurs.
     * @param {IHTMLWindow2} htmlWindow Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa741505(v=vs.85)">IHTMLWindow2</a>*</b>
     * 
     * The window or frame in which the script error occurred.
     * @param {IActiveScriptError} scriptError Type: <b><a href="https://docs.microsoft.com/scripting/winscript/reference/iactivescripterror">IActiveScriptError</a>*</b>
     * 
     * The object that contains info about the script error that occurred.
     * @param {PWSTR} url Type: <b>LPCWSTR</b>
     * 
     * The URL on which the script error occurred.
     * @param {BOOL} errorHandled Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the app handled the error; otherwise <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//webapplication/nf-webapplication-iwebapplicationscriptevents-scripterror
     */
    ScriptError(htmlWindow, scriptError, url, errorHandled) {
        url := url is String ? StrPtr(url) : url

        result := ComCall(4, this, "ptr", htmlWindow, "ptr", scriptError, "ptr", url, "int", errorHandled, "HRESULT")
        return result
    }
}
