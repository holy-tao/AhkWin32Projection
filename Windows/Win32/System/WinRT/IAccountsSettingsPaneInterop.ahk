#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * IAccountsSettingsPaneInterop enables interoperability with a WinRT AccountsSettingsPane object and provides access to members to show the accounts pane.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/accountssettingspaneinterop/nn-accountssettingspaneinterop-iaccountssettingspaneinterop
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IAccountsSettingsPaneInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccountsSettingsPaneInterop
     * @type {Guid}
     */
    static IID => Guid("{d3ee12ad-3865-4362-9746-b75a682df0e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForWindow", "ShowManageAccountsForWindowAsync", "ShowAddAccountForWindowAsync"]

    /**
     * Gets an [AccountsSettingsPane](/uwp/api/windows.ui.applicationsettings.accountssettingspane) object for the window of the active application.
     * @param {HWND} appWindow Handle to the window of the active application.
     * @param {Pointer<Guid>} riid The GUID for the resource interface.
     * 
     * The REFIID, or GUID, of the interface to the resource can be obtained by using the __uuidof() macro. For example: 
     * 
     * `__uuidof(AccountSettingsPanel)`
     * @returns {Pointer<Pointer<Void>>} Address of a pointer to a [AccountSettingsPane](/uwp/api/Windows.UI.ApplicationSettings.AccountsSettingsPane) object.
     * @see https://learn.microsoft.com/windows/win32/api//content/accountssettingspaneinterop/nf-accountssettingspaneinterop-iaccountssettingspaneinterop-getforwindow
     */
    GetForWindow(appWindow, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(6, this, "ptr", appWindow, "ptr", riid, "ptr*", &accountsSettingsPane := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @returns {Pointer<Pointer<Void>>} Address of a pointer to a [IAsyncAction](/uwp/api/Windows.Foundation.IAsyncAction) object that returns void upon completion.
     * @see https://learn.microsoft.com/windows/win32/api//content/accountssettingspaneinterop/nf-accountssettingspaneinterop-iaccountssettingspaneinterop-showmanageaccountsforwindowasync
     */
    ShowManageAccountsForWindowAsync(appWindow, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(7, this, "ptr", appWindow, "ptr", riid, "ptr*", &asyncAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @returns {Pointer<Pointer<Void>>} Address of a pointer to a [IAsyncAction](/uwp/api/Windows.Foundation.IAsyncAction) object that returns void upon completion.
     * @see https://learn.microsoft.com/windows/win32/api//content/accountssettingspaneinterop/nf-accountssettingspaneinterop-iaccountssettingspaneinterop-showaddaccountforwindowasync
     */
    ShowAddAccountForWindowAsync(appWindow, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(8, this, "ptr", appWindow, "ptr", riid, "ptr*", &asyncAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return asyncAction
    }
}
