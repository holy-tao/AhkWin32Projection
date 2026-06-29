#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import ".\WPCFLAG_RESTRICTION.ahk" { WPCFLAG_RESTRICTION }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Accesses general settings for the user.
 * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nn-wpcapi-iwpcsettings
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct IWPCSettings extends IUnknown {
    /**
     * The interface identifier for IWPCSettings
     * @type {Guid}
     */
    static IID := Guid("{8fdf6ca1-0189-47e4-b670-1a8a4636e340}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWPCSettings interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsLoggingRequired         : IntPtr
        GetLastSettingsChangeTime : IntPtr
        GetRestrictions           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWPCSettings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether activity logging should be performed when obtaining the IWPCSettings interface.
     * @returns {BOOL} Indicates whether logging is required.
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcsettings-isloggingrequired
     */
    IsLoggingRequired() {
        result := ComCall(3, this, BOOL.Ptr, &pfRequired := 0, "HRESULT")
        return pfRequired
    }

    /**
     * Retrieves the time at which the configuration settings were last updated.
     * @returns {SYSTEMTIME} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the time at which the settings were last updated.
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcsettings-getlastsettingschangetime
     */
    GetLastSettingsChangeTime() {
        pTime := SYSTEMTIME()
        result := ComCall(4, this, SYSTEMTIME.Ptr, pTime, "HRESULT")
        return pTime
    }

    /**
     * Determines whether web restrictions, time limits, or game restrictions are on.
     * @returns {WPCFLAG_RESTRICTION} 
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcsettings-getrestrictions
     */
    GetRestrictions() {
        result := ComCall(5, this, "int*", &pdwRestrictions := 0, "HRESULT")
        return pdwRestrictions
    }

    Query(iid) {
        if (IWPCSettings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsLoggingRequired := CallbackCreate(GetMethod(implObj, "IsLoggingRequired"), flags, 2)
        this.vtbl.GetLastSettingsChangeTime := CallbackCreate(GetMethod(implObj, "GetLastSettingsChangeTime"), flags, 2)
        this.vtbl.GetRestrictions := CallbackCreate(GetMethod(implObj, "GetRestrictions"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsLoggingRequired)
        CallbackFree(this.vtbl.GetLastSettingsChangeTime)
        CallbackFree(this.vtbl.GetRestrictions)
    }
}
