#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\ActiveScript\IActiveScriptError.ahk" { IActiveScriptError }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Web\MsHtml\IHTMLWindow2.ahk" { IHTMLWindow2 }

/**
 * Enables a debugging or authoring app to receive notification of scripting engine events.
 * @see https://learn.microsoft.com/windows/win32/api/webapplication/nn-webapplication-iwebapplicationscriptevents
 * @namespace Windows.Win32.System.Diagnostics.Debug.WebApp
 */
export default struct IWebApplicationScriptEvents extends IUnknown {
    /**
     * The interface identifier for IWebApplicationScriptEvents
     * @type {Guid}
     */
    static IID := Guid("{7c3f6998-1567-4bba-b52b-48d32141d613}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebApplicationScriptEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BeforeScriptExecute : IntPtr
        ScriptError         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebApplicationScriptEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationscriptevents-scripterror
     */
    ScriptError(htmlWindow, scriptError, url, errorHandled) {
        url := url is String ? StrPtr(url) : url

        result := ComCall(4, this, "ptr", htmlWindow, "ptr", scriptError, "ptr", url, BOOL, errorHandled, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWebApplicationScriptEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BeforeScriptExecute := CallbackCreate(GetMethod(implObj, "BeforeScriptExecute"), flags, 2)
        this.vtbl.ScriptError := CallbackCreate(GetMethod(implObj, "ScriptError"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BeforeScriptExecute)
        CallbackFree(this.vtbl.ScriptError)
    }
}
