#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides an asynchronous callback mechanism used by a credential to notify it of state or text change events in the Logon UI or Credential UI.
 * @remarks
 * 
 * These methods should only be called by a credential passing <b>this</b> as the first parameter. Behavior is undefined if you attempt to call these methods using a credential other than the one activated by the call on <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-advise">Advise</a>. If a credential provider has information on another thread and wants to communicate through that thread's Logon UI or Credential UI, the requests will need to go through the credential that received the <b>Advise</b> call.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Third parties do not implement <b>ICredentialProviderCredentialEvents</b>. An implementation is included with Windows.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICredentialProviderCredentialEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICredentialProviderCredentialEvents
     * @type {Guid}
     */
    static IID => Guid("{fa6fa76b-66b7-4b11-95f1-86171118e816}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFieldState", "SetFieldInteractiveState", "SetFieldString", "SetFieldCheckbox", "SetFieldBitmap", "SetFieldComboBoxSelectedItem", "DeleteFieldComboBoxItem", "AppendFieldComboBoxItem", "SetFieldSubmitButton", "OnCreatingWindow"]

    /**
     * 
     * @param {ICredentialProviderCredential} pcpc 
     * @param {Integer} dwFieldID 
     * @param {Integer} cpfs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-setfieldstate
     */
    SetFieldState(pcpc, dwFieldID, cpfs) {
        result := ComCall(3, this, "ptr", pcpc, "uint", dwFieldID, "int", cpfs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICredentialProviderCredential} pcpc 
     * @param {Integer} dwFieldID 
     * @param {Integer} cpfis 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-setfieldinteractivestate
     */
    SetFieldInteractiveState(pcpc, dwFieldID, cpfis) {
        result := ComCall(4, this, "ptr", pcpc, "uint", dwFieldID, "int", cpfis, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICredentialProviderCredential} pcpc 
     * @param {Integer} dwFieldID 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-setfieldstring
     */
    SetFieldString(pcpc, dwFieldID, psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(5, this, "ptr", pcpc, "uint", dwFieldID, "ptr", psz, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICredentialProviderCredential} pcpc 
     * @param {Integer} dwFieldID 
     * @param {BOOL} bChecked 
     * @param {PWSTR} pszLabel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-setfieldcheckbox
     */
    SetFieldCheckbox(pcpc, dwFieldID, bChecked, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(6, this, "ptr", pcpc, "uint", dwFieldID, "int", bChecked, "ptr", pszLabel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICredentialProviderCredential} pcpc 
     * @param {Integer} dwFieldID 
     * @param {HBITMAP} hbmp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-setfieldbitmap
     */
    SetFieldBitmap(pcpc, dwFieldID, hbmp) {
        hbmp := hbmp is Win32Handle ? NumGet(hbmp, "ptr") : hbmp

        result := ComCall(7, this, "ptr", pcpc, "uint", dwFieldID, "ptr", hbmp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICredentialProviderCredential} pcpc 
     * @param {Integer} dwFieldID 
     * @param {Integer} dwSelectedItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-setfieldcomboboxselecteditem
     */
    SetFieldComboBoxSelectedItem(pcpc, dwFieldID, dwSelectedItem) {
        result := ComCall(8, this, "ptr", pcpc, "uint", dwFieldID, "uint", dwSelectedItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICredentialProviderCredential} pcpc 
     * @param {Integer} dwFieldID 
     * @param {Integer} dwItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-deletefieldcomboboxitem
     */
    DeleteFieldComboBoxItem(pcpc, dwFieldID, dwItem) {
        result := ComCall(9, this, "ptr", pcpc, "uint", dwFieldID, "uint", dwItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICredentialProviderCredential} pcpc 
     * @param {Integer} dwFieldID 
     * @param {PWSTR} pszItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-appendfieldcomboboxitem
     */
    AppendFieldComboBoxItem(pcpc, dwFieldID, pszItem) {
        pszItem := pszItem is String ? StrPtr(pszItem) : pszItem

        result := ComCall(10, this, "ptr", pcpc, "uint", dwFieldID, "ptr", pszItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICredentialProviderCredential} pcpc 
     * @param {Integer} dwFieldID 
     * @param {Integer} dwAdjacentTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-setfieldsubmitbutton
     */
    SetFieldSubmitButton(pcpc, dwFieldID, dwAdjacentTo) {
        result := ComCall(11, this, "ptr", pcpc, "uint", dwFieldID, "uint", dwAdjacentTo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-oncreatingwindow
     */
    OnCreatingWindow() {
        phwndOwner := HWND()
        result := ComCall(12, this, "ptr", phwndOwner, "HRESULT")
        return phwndOwner
    }
}
