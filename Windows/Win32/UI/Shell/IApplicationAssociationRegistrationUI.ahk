#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that launches an advanced association dialog box through which the user can customize their associations.
 * @remarks
 * Because <b>IApplicationAssociationRegistrationUI</b> is only supported for Windows Vista and later, applications that support earlier operating systems must use their preexisting code when running under those operating systems. Those applications should include a check for the operating system version to account for this.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iapplicationassociationregistrationui
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IApplicationAssociationRegistrationUI extends IUnknown {
    /**
     * The interface identifier for IApplicationAssociationRegistrationUI
     * @type {Guid}
     */
    static IID := Guid("{1f76a169-f994-40ac-8fc8-0959e8874710}")

    /**
     * The class identifier for ApplicationAssociationRegistrationUI
     * @type {Guid}
     */
    static CLSID := Guid("{1968106d-f3b5-44cf-890e-116fcb9ecef1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IApplicationAssociationRegistrationUI interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LaunchAdvancedAssociationUI : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IApplicationAssociationRegistrationUI.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Launches an advanced association dialog box through which the user can customize the associations for the application specified in pszAppRegName.
     * @remarks
     * Starting in Windows 10, this does not launch the association dialog box. It displays a dialog to the user informing them that they can change the default programs used to open file extensions in their <b>Settings</b>
     * @param {PWSTR} pszAppRegistryName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated Unicode string that specifies the registered name of the application. This value is only valid if it matches one of the application strings registered under <b>HKCU\Software\RegisteredApplications</b> or under <b>HKLM\Software\RegisteredApplications</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iapplicationassociationregistrationui-launchadvancedassociationui
     */
    LaunchAdvancedAssociationUI(pszAppRegistryName) {
        pszAppRegistryName := pszAppRegistryName is String ? StrPtr(pszAppRegistryName) : pszAppRegistryName

        result := ComCall(3, this, "ptr", pszAppRegistryName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IApplicationAssociationRegistrationUI.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LaunchAdvancedAssociationUI := CallbackCreate(GetMethod(implObj, "LaunchAdvancedAssociationUI"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LaunchAdvancedAssociationUI)
    }
}
