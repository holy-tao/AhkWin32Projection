#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWPCSettings.ahk" { IWPCSettings }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WPCFLAG_WEB_SETTING.ahk" { WPCFLAG_WEB_SETTING }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Accesses web restrictions settings for the user.
 * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nn-wpcapi-iwpcwebsettings
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct IWPCWebSettings extends IWPCSettings {
    /**
     * The interface identifier for IWPCWebSettings
     * @type {Guid}
     */
    static IID := Guid("{ffccbdb8-0992-4c30-b0f1-1cbb09c240aa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWPCWebSettings interfaces
    */
    struct Vtbl extends IWPCSettings.Vtbl {
        GetSettings        : IntPtr
        RequestURLOverride : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWPCWebSettings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the web restrictions settings.
     * @returns {WPCFLAG_WEB_SETTING} 
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcwebsettings-getsettings
     */
    GetSettings() {
        result := ComCall(6, this, "int*", &pdwSettings := 0, "HRESULT")
        return pdwSettings
    }

    /**
     * Requests that the Parental Controls web restrictions subsystem set the specified primary and sub URLs to the allowed state.
     * @param {HWND} _hWnd A handle to the parent window. This is  needed for proper User Account Control (UAC) dialog box behavior.
     * @param {PWSTR} pcszURL A pointer to primary URL for override.
     * @param {Integer} cURLs The number of entries in <i>ppcszSubURLs</i>.
     * @param {Pointer<PWSTR>} ppcszSubURLs Pointers to URLs that include pages with the primary URL.
     * @returns {BOOL} Pointer to flag notifying completion of override changed status. This parameter is 1 if the status is changed, and 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcwebsettings-requesturloverride
     */
    RequestURLOverride(_hWnd, pcszURL, cURLs, ppcszSubURLs) {
        pcszURL := pcszURL is String ? StrPtr(pcszURL) : pcszURL

        ppcszSubURLsMarshal := ppcszSubURLs is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, HWND, _hWnd, "ptr", pcszURL, "uint", cURLs, ppcszSubURLsMarshal, ppcszSubURLs, BOOL.Ptr, &pfChanged := 0, "HRESULT")
        return pfChanged
    }

    Query(iid) {
        if (IWPCWebSettings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSettings := CallbackCreate(GetMethod(implObj, "GetSettings"), flags, 2)
        this.vtbl.RequestURLOverride := CallbackCreate(GetMethod(implObj, "RequestURLOverride"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSettings)
        CallbackFree(this.vtbl.RequestURLOverride)
    }
}
