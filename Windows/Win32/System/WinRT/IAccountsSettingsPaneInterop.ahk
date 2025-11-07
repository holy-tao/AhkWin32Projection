#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * 
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//accountssettingspaneinterop/nn-accountssettingspaneinterop-iaccountssettingspaneinterop
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
     * 
     * @param {HWND} appWindow 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/accountssettingspaneinterop/nf-accountssettingspaneinterop-iaccountssettingspaneinterop-getforwindow
     */
    GetForWindow(appWindow, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(6, this, "ptr", appWindow, "ptr", riid, "ptr*", &accountsSettingsPane := 0, "HRESULT")
        return accountsSettingsPane
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/accountssettingspaneinterop/nf-accountssettingspaneinterop-iaccountssettingspaneinterop-showmanageaccountsforwindowasync
     */
    ShowManageAccountsForWindowAsync(appWindow, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(7, this, "ptr", appWindow, "ptr", riid, "ptr*", &asyncAction := 0, "HRESULT")
        return asyncAction
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/accountssettingspaneinterop/nf-accountssettingspaneinterop-iaccountssettingspaneinterop-showaddaccountforwindowasync
     */
    ShowAddAccountForWindowAsync(appWindow, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(8, this, "ptr", appWindow, "ptr", riid, "ptr*", &asyncAction := 0, "HRESULT")
        return asyncAction
    }
}
