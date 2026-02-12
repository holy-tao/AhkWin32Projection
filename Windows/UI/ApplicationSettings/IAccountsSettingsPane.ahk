#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * IAccountsSettingsPaneInterop enables interoperability with a WinRT AccountsSettingsPane object and provides access to members to show the accounts pane.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/accountssettingspaneinterop/nn-accountssettingspaneinterop-iaccountssettingspaneinterop
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class IAccountsSettingsPane extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccountsSettingsPane
     * @type {Guid}
     */
    static IID => Guid("{81ea942c-4f09-4406-a538-838d9b14b7e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_AccountCommandsRequested", "remove_AccountCommandsRequested"]

    /**
     * 
     * @param {TypedEventHandler<AccountsSettingsPane, AccountsSettingsPaneCommandsRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccountCommandsRequested(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_AccountCommandsRequested(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(7, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
