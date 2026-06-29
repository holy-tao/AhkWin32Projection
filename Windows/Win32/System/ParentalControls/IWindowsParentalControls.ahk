#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IWindowsParentalControlsCore.ahk" { IWindowsParentalControlsCore }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWPCGamesSettings.ahk" { IWPCGamesSettings }

/**
 * Enables access to all settings interfaces of the Minimum Compliance API.
 * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nn-wpcapi-iwindowsparentalcontrols
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct IWindowsParentalControls extends IWindowsParentalControlsCore {
    /**
     * The interface identifier for IWindowsParentalControls
     * @type {Guid}
     */
    static IID := Guid("{28b4d88b-e072-49e6-804d-26edbe21a7b9}")

    /**
     * The class identifier for WindowsParentalControls
     * @type {Guid}
     */
    static CLSID := Guid("{e77cc89b-7401-4c04-8ced-149db35add04}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWindowsParentalControls interfaces
    */
    struct Vtbl extends IWindowsParentalControlsCore.Vtbl {
        GetGamesSettings : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWindowsParentalControls.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a pointer to an interface for games restrictions settings for the specified user.
     * @param {PWSTR} pcszSID The SID string of the user. If this parameter is <b>NULL</b>, retrieve settings for the current user.
     * @returns {IWPCGamesSettings} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wpcapi/nn-wpcapi-iwpcgamessettings">IWPCGamesSettings</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwindowsparentalcontrols-getgamessettings
     */
    GetGamesSettings(pcszSID) {
        pcszSID := pcszSID is String ? StrPtr(pcszSID) : pcszSID

        result := ComCall(7, this, "ptr", pcszSID, "ptr*", &ppSettings := 0, "HRESULT")
        return IWPCGamesSettings(ppSettings)
    }

    Query(iid) {
        if (IWindowsParentalControls.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGamesSettings := CallbackCreate(GetMethod(implObj, "GetGamesSettings"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGamesSettings)
    }
}
