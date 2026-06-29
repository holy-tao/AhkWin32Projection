#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWPCSettings.ahk" { IWPCSettings }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Accesses games settings for the user.
 * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nn-wpcapi-iwpcgamessettings
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct IWPCGamesSettings extends IWPCSettings {
    /**
     * The interface identifier for IWPCGamesSettings
     * @type {Guid}
     */
    static IID := Guid("{95e87780-e158-489e-b452-bbb850790715}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWPCGamesSettings interfaces
    */
    struct Vtbl extends IWPCSettings.Vtbl {
        IsBlocked : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWPCGamesSettings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether the specified game is blocked from execution.
     * @remarks
     * If <i>guidAppID</i> is not found, the policy will default to unrated and set *<i>pdwReasons</i> to WPCFLAG_ISBLOCKED_NOT_BLOCKED.
     * @param {Guid} guidAppID The GUID associated with the game during install or game scan detection.
     * @returns {Integer} The reason code. For a list of values, see the <a href="https://docs.microsoft.com/windows/desktop/api/wpcevent/ne-wpcevent-wpcflag_isblocked">WPCFLAG_ISBLOCKED</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcgamessettings-isblocked
     */
    IsBlocked(guidAppID) {
        result := ComCall(6, this, Guid, guidAppID, "uint*", &pdwReasons := 0, "HRESULT")
        return pdwReasons
    }

    Query(iid) {
        if (IWPCGamesSettings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsBlocked := CallbackCreate(GetMethod(implObj, "IsBlocked"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsBlocked)
    }
}
