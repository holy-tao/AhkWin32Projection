#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWPCSettings.ahk" { IWPCSettings }
#Import ".\IWPCWebSettings.ahk" { IWPCWebSettings }
#Import ".\WPCFLAG_VISIBILITY.ahk" { WPCFLAG_VISIBILITY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * . (IWindowsParentalControlsCore)
 * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nn-wpcapi-iwindowsparentalcontrolscore
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct IWindowsParentalControlsCore extends IUnknown {
    /**
     * The interface identifier for IWindowsParentalControlsCore
     * @type {Guid}
     */
    static IID := Guid("{4ff40a0f-3f3b-4d7c-a41b-4f39d7b44d05}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWindowsParentalControlsCore interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetVisibility    : IntPtr
        GetUserSettings  : IntPtr
        GetWebSettings   : IntPtr
        GetWebFilterInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWindowsParentalControlsCore.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates the visibility of the Parental Controls user interface.
     * @returns {WPCFLAG_VISIBILITY} 
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwindowsparentalcontrolscore-getvisibility
     */
    GetVisibility() {
        result := ComCall(3, this, "int*", &peVisibility := 0, "HRESULT")
        return peVisibility
    }

    /**
     * Retrieves a pointer to an interface for general settings for the specified user.
     * @param {PWSTR} pcszSID The SID string of the user. If this parameter is <b>NULL</b>, retrieve settings for the current user.
     * @returns {IWPCSettings} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wpcapi/nn-wpcapi-iwpcsettings">IWPCSettings</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwindowsparentalcontrolscore-getusersettings
     */
    GetUserSettings(pcszSID) {
        pcszSID := pcszSID is String ? StrPtr(pcszSID) : pcszSID

        result := ComCall(4, this, "ptr", pcszSID, "ptr*", &ppSettings := 0, "HRESULT")
        return IWPCSettings(ppSettings)
    }

    /**
     * Retrieves a pointer to an interface for web restrictions settings for the specified user.
     * @param {PWSTR} pcszSID The SID string of the user. If this parameter is <b>NULL</b>, retrieve settings for the current user.
     * @returns {IWPCWebSettings} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wpcapi/nn-wpcapi-iwpcwebsettings">IWPCWebSettings</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwindowsparentalcontrolscore-getwebsettings
     */
    GetWebSettings(pcszSID) {
        pcszSID := pcszSID is String ? StrPtr(pcszSID) : pcszSID

        result := ComCall(5, this, "ptr", pcszSID, "ptr*", &ppSettings := 0, "HRESULT")
        return IWPCWebSettings(ppSettings)
    }

    /**
     * Retrieves the name and identifier of the currently active Web Content Filter.
     * @param {Pointer<PWSTR>} ppszName The name of the currently active Web Content Filter.
     * @returns {Guid} The GUID of the currently active Web Content Filter.
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwindowsparentalcontrolscore-getwebfilterinfo
     */
    GetWebFilterInfo(ppszName) {
        ppszNameMarshal := ppszName is VarRef ? "ptr*" : "ptr"

        pguidID := Guid()
        result := ComCall(6, this, Guid.Ptr, pguidID, ppszNameMarshal, ppszName, "HRESULT")
        return pguidID
    }

    Query(iid) {
        if (IWindowsParentalControlsCore.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetVisibility := CallbackCreate(GetMethod(implObj, "GetVisibility"), flags, 2)
        this.vtbl.GetUserSettings := CallbackCreate(GetMethod(implObj, "GetUserSettings"), flags, 3)
        this.vtbl.GetWebSettings := CallbackCreate(GetMethod(implObj, "GetWebSettings"), flags, 3)
        this.vtbl.GetWebFilterInfo := CallbackCreate(GetMethod(implObj, "GetWebFilterInfo"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetVisibility)
        CallbackFree(this.vtbl.GetUserSettings)
        CallbackFree(this.vtbl.GetWebSettings)
        CallbackFree(this.vtbl.GetWebFilterInfo)
    }
}
