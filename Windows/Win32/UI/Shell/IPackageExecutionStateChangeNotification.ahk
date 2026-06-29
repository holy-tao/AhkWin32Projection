#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PACKAGE_EXECUTION_STATE.ahk" { PACKAGE_EXECUTION_STATE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables receiving package state-change notifications during Windows Store app debugging.
 * @remarks
 * Implement the <b>IPackageExecutionStateChangeNotification</b> interface when you need to receive package state-change notifications during Windows Store app debugging. 
 * 
 * Call the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-registerforpackagestatechanges">RegisterForPackageStateChanges</a> method to register for package state-change notifications.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ipackageexecutionstatechangenotification
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IPackageExecutionStateChangeNotification extends IUnknown {
    /**
     * The interface identifier for IPackageExecutionStateChangeNotification
     * @type {Guid}
     */
    static IID := Guid("{1bb12a62-2ad8-432b-8ccf-0c2c52afcd5b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPackageExecutionStateChangeNotification interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnStateChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPackageExecutionStateChangeNotification.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when package state changes during Windows Store app debugging.
     * @param {PWSTR} pszPackageFullName The package full name.
     * @param {PACKAGE_EXECUTION_STATE} pesNewState The new state that the package changed to.
     * @returns {HRESULT} Return <b>S_OK</b> when you implement the <b>OnStateChanged</b> method.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipackageexecutionstatechangenotification-onstatechanged
     */
    OnStateChanged(pszPackageFullName, pesNewState) {
        pszPackageFullName := pszPackageFullName is String ? StrPtr(pszPackageFullName) : pszPackageFullName

        result := ComCall(3, this, "ptr", pszPackageFullName, PACKAGE_EXECUTION_STATE, pesNewState, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPackageExecutionStateChangeNotification.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnStateChanged := CallbackCreate(GetMethod(implObj, "OnStateChanged"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnStateChanged)
    }
}
