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
     * 
     * @param {HWND} appWindow 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} accountsSettingsPane 
     * @returns {HRESULT} 
     */
    GetForWindow(appWindow, riid, accountsSettingsPane) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(6, this, "ptr", appWindow, "ptr", riid, "ptr", accountsSettingsPane, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} asyncAction 
     * @returns {HRESULT} 
     */
    ShowManageAccountsForWindowAsync(appWindow, riid, asyncAction) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(7, this, "ptr", appWindow, "ptr", riid, "ptr", asyncAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} asyncAction 
     * @returns {HRESULT} 
     */
    ShowAddAccountForWindowAsync(appWindow, riid, asyncAction) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(8, this, "ptr", appWindow, "ptr", riid, "ptr", asyncAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
