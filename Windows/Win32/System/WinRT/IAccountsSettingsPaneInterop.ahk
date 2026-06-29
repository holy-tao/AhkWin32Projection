#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInspectable.ahk" { IInspectable }

/**
 * IAccountsSettingsPaneInterop enables interoperability with a WinRT AccountsSettingsPane object and provides access to members to show the accounts pane.
 * @see https://learn.microsoft.com/windows/win32/api/accountssettingspaneinterop/nn-accountssettingspaneinterop-iaccountssettingspaneinterop
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IAccountsSettingsPaneInterop extends IInspectable {
    /**
     * The interface identifier for IAccountsSettingsPaneInterop
     * @type {Guid}
     */
    static IID := Guid("{d3ee12ad-3865-4362-9746-b75a682df0e6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAccountsSettingsPaneInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        GetForWindow                     : IntPtr
        ShowManageAccountsForWindowAsync : IntPtr
        ShowAddAccountForWindowAsync     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAccountsSettingsPaneInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an [AccountsSettingsPane](/uwp/api/windows.ui.applicationsettings.accountssettingspane) object for the window of the active application.
     * @param {HWND} appWindow Handle to the window of the active application.
     * @param {Pointer<Guid>} riid The GUID for the resource interface.
     * 
     * The REFIID, or GUID, of the interface to the resource can be obtained by using the __uuidof() macro. For example: 
     * 
     * `__uuidof(AccountSettingsPanel)`
     * @returns {Pointer<Void>} Address of a pointer to a [AccountSettingsPane](/uwp/api/Windows.UI.ApplicationSettings.AccountsSettingsPane) object.
     * @see https://learn.microsoft.com/windows/win32/api/accountssettingspaneinterop/nf-accountssettingspaneinterop-iaccountssettingspaneinterop-getforwindow
     */
    GetForWindow(appWindow, riid) {
        result := ComCall(6, this, HWND, appWindow, Guid.Ptr, riid, "ptr*", &accountsSettingsPane := 0, "HRESULT")
        return accountsSettingsPane
    }

    /**
     * Displays the manage accounts screen.
     * @param {HWND} appWindow Handle to the window of the active application.
     * @param {Pointer<Guid>} riid The GUID for the resource interface.
     * 
     * The REFIID, or GUID, of the interface to the resource can be obtained by using the __uuidof() macro. For example: 
     * 
     * `__uuidof(IAsyncAction)`
     * @returns {Pointer<Void>} Address of a pointer to a [IAsyncAction](/uwp/api/Windows.Foundation.IAsyncAction) object that returns void upon completion.
     * @see https://learn.microsoft.com/windows/win32/api/accountssettingspaneinterop/nf-accountssettingspaneinterop-iaccountssettingspaneinterop-showmanageaccountsforwindowasync
     */
    ShowManageAccountsForWindowAsync(appWindow, riid) {
        result := ComCall(7, this, HWND, appWindow, Guid.Ptr, riid, "ptr*", &asyncAction := 0, "HRESULT")
        return asyncAction
    }

    /**
     * Displays the add accounts screen.
     * @param {HWND} appWindow Handle to the window of the active application.
     * @param {Pointer<Guid>} riid The GUID for the resource interface.
     * 
     * The REFIID, or GUID, of the interface to the resource can be obtained by using the __uuidof() macro. For example: 
     * 
     * `__uuidof(IAsyncAction)`
     * @returns {Pointer<Void>} Address of a pointer to a [IAsyncAction](/uwp/api/Windows.Foundation.IAsyncAction) object that returns void upon completion.
     * @see https://learn.microsoft.com/windows/win32/api/accountssettingspaneinterop/nf-accountssettingspaneinterop-iaccountssettingspaneinterop-showaddaccountforwindowasync
     */
    ShowAddAccountForWindowAsync(appWindow, riid) {
        result := ComCall(8, this, HWND, appWindow, Guid.Ptr, riid, "ptr*", &asyncAction := 0, "HRESULT")
        return asyncAction
    }

    Query(iid) {
        if (IAccountsSettingsPaneInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetForWindow := CallbackCreate(GetMethod(implObj, "GetForWindow"), flags, 4)
        this.vtbl.ShowManageAccountsForWindowAsync := CallbackCreate(GetMethod(implObj, "ShowManageAccountsForWindowAsync"), flags, 4)
        this.vtbl.ShowAddAccountForWindowAsync := CallbackCreate(GetMethod(implObj, "ShowAddAccountForWindowAsync"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetForWindow)
        CallbackFree(this.vtbl.ShowManageAccountsForWindowAsync)
        CallbackFree(this.vtbl.ShowAddAccountForWindowAsync)
    }
}
