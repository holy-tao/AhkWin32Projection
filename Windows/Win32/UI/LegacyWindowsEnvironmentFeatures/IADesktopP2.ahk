#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Ole\IOleObject.ahk" { IOleObject }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods to manage the Windows Desktop.
 * @remarks
 * Despite its name, this interface does not inherit from <a href="https://docs.microsoft.com/windows/desktop/api/shlobj/nn-shlobj-iactivedesktopp">IActiveDesktopP</a>.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/nn-shlobj-iadesktopp2
 * @namespace Windows.Win32.UI.LegacyWindowsEnvironmentFeatures
 */
export default struct IADesktopP2 extends IUnknown {
    /**
     * The interface identifier for IADesktopP2
     * @type {Guid}
     */
    static IID := Guid("{b22754e2-4574-11d1-9888-006097deacf9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADesktopP2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReReadWallpaper               : IntPtr
        GetADObjectFlags              : IntPtr
        UpdateAllDesktopSubscriptions : IntPtr
        MakeDynamicChanges            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADesktopP2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReReadWallpaper() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMask 
     * @returns {Integer} 
     */
    GetADObjectFlags(dwMask) {
        result := ComCall(4, this, "uint*", &pdwFlags := 0, "uint", dwMask, "HRESULT")
        return pdwFlags
    }

    /**
     * Calls the UpdateAllDesktopSubscriptions function to update desktop subscriptions.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-iadesktopp2-updatealldesktopsubscriptions
     */
    UpdateAllDesktopSubscriptions() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOleObject} pOleObj 
     * @returns {HRESULT} 
     */
    MakeDynamicChanges(pOleObj) {
        result := ComCall(6, this, "ptr", pOleObj, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADesktopP2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReReadWallpaper := CallbackCreate(GetMethod(implObj, "ReReadWallpaper"), flags, 1)
        this.vtbl.GetADObjectFlags := CallbackCreate(GetMethod(implObj, "GetADObjectFlags"), flags, 3)
        this.vtbl.UpdateAllDesktopSubscriptions := CallbackCreate(GetMethod(implObj, "UpdateAllDesktopSubscriptions"), flags, 1)
        this.vtbl.MakeDynamicChanges := CallbackCreate(GetMethod(implObj, "MakeDynamicChanges"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReReadWallpaper)
        CallbackFree(this.vtbl.GetADObjectFlags)
        CallbackFree(this.vtbl.UpdateAllDesktopSubscriptions)
        CallbackFree(this.vtbl.MakeDynamicChanges)
    }
}
