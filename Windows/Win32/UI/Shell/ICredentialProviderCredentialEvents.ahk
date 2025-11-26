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
     * Communicates to the Logon UI or Credential UI that a field state has changed and that the UI should be updated.
     * @param {ICredentialProviderCredential} pcpc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredential">ICredentialProviderCredential</a>*</b>
     * 
     * The credential containing a field whose state is being set. This value should be set to <b>this</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents">ICredentialProviderCredentialEvents</a> for more information.
     * @param {Integer} dwFieldID Type: <b>DWORD</b>
     * 
     * The unique ID of the field where the change occurred to generate the event.
     * @param {Integer} cpfs Type: <b><a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_field_state">CREDENTIAL_PROVIDER_FIELD_STATE</a></b>
     * 
     * The value from the <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_field_state">CREDENTIAL_PROVIDER_FIELD_STATE</a> enumeration that specifies the new field state.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-setfieldstate
     */
    SetFieldState(pcpc, dwFieldID, cpfs) {
        result := ComCall(3, this, "ptr", pcpc, "uint", dwFieldID, "int", cpfs, "HRESULT")
        return result
    }

    /**
     * Communicates to the Logon UI or Credential UI that the interactivity state of a field has changed and that the UI should be updated.
     * @param {ICredentialProviderCredential} pcpc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredential">ICredentialProviderCredential</a>*</b>
     * 
     * The credential containing a field whose interactivity state is being set. This value should be set to <b>this</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents">ICredentialProviderCredentialEvents</a> for more information.
     * @param {Integer} dwFieldID Type: <b>DWORD</b>
     * 
     * The unique ID of the field.
     * @param {Integer} cpfis Type: <b><a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_field_interactive_state">CREDENTIAL_PROVIDER_FIELD_INTERACTIVE_STATE</a></b>
     * 
     * The new interactive state of the field.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-setfieldinteractivestate
     */
    SetFieldInteractiveState(pcpc, dwFieldID, cpfis) {
        result := ComCall(4, this, "ptr", pcpc, "uint", dwFieldID, "int", cpfis, "HRESULT")
        return result
    }

    /**
     * Communicates to the Logon UI or Credential UI that the string associated with a field has changed and that the UI should be updated.
     * @param {ICredentialProviderCredential} pcpc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredential">ICredentialProviderCredential</a>*</b>
     * 
     * The credential containing a field whose interactivity state is being set. This value should be set to <b>this</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents">ICredentialProviderCredentialEvents</a> for more information.
     * @param {Integer} dwFieldID Type: <b>DWORD</b>
     * 
     * The unique ID of the field for which the string is being set.
     * @param {PWSTR} psz Type: <b>LPCWSTR</b>
     * 
     * A pointer to the new string for the field.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-setfieldstring
     */
    SetFieldString(pcpc, dwFieldID, psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(5, this, "ptr", pcpc, "uint", dwFieldID, "ptr", psz, "HRESULT")
        return result
    }

    /**
     * Communicates to the Logon UI or Credential UI that a checkbox field has changed and that the UI should be updated.
     * @param {ICredentialProviderCredential} pcpc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredential">ICredentialProviderCredential</a>*</b>
     * 
     * The credential containing the checkbox field that is being set. This value should be set to <b>this</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents">ICredentialProviderCredentialEvents</a> for more information.
     * @param {Integer} dwFieldID Type: <b>DWORD</b>
     * 
     * The unique field ID for the checkbox.
     * @param {BOOL} bChecked Type: <b>BOOL</b>
     * 
     * The new state of the checkbox. <b>TRUE</b> indicates the checkbox should be checked, <b>FALSE</b> indicates it should not.
     * @param {PWSTR} pszLabel Type: <b>LPCWSTR</b>
     * 
     * The new string for the checkbox label.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-setfieldcheckbox
     */
    SetFieldCheckbox(pcpc, dwFieldID, bChecked, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(6, this, "ptr", pcpc, "uint", dwFieldID, "int", bChecked, "ptr", pszLabel, "HRESULT")
        return result
    }

    /**
     * Communicates to the Logon UI or Credential UI that a tile image field has changed and that the UI should be updated.
     * @param {ICredentialProviderCredential} pcpc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredential">ICredentialProviderCredential</a>*</b>
     * 
     * The credential containing the tile image field that is being set. This value should be set to <b>this</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents">ICredentialProviderCredentialEvents</a> for more information.
     * @param {Integer} dwFieldID Type: <b>DWORD</b>
     * 
     * The unique ID of the tile image field.
     * @param {HBITMAP} hbmp Type: <b>HBITMAP</b>
     * 
     * The new tile image.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-setfieldbitmap
     */
    SetFieldBitmap(pcpc, dwFieldID, hbmp) {
        hbmp := hbmp is Win32Handle ? NumGet(hbmp, "ptr") : hbmp

        result := ComCall(7, this, "ptr", pcpc, "uint", dwFieldID, "ptr", hbmp, "HRESULT")
        return result
    }

    /**
     * Communicates to the Logon UI or Credential UI that the selected item in a combo box has changed and that the UI should be updated.
     * @param {ICredentialProviderCredential} pcpc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredential">ICredentialProviderCredential</a>*</b>
     * 
     * The credential containing the combo box being set. This value should be set to <b>this</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents">ICredentialProviderCredentialEvents</a> for more information.
     * @param {Integer} dwFieldID Type: <b>DWORD</b>
     * 
     * The unique ID of the combo box.
     * @param {Integer} dwSelectedItem Type: <b>DWORD</b>
     * 
     * The index of the item to select in the combo box.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-setfieldcomboboxselecteditem
     */
    SetFieldComboBoxSelectedItem(pcpc, dwFieldID, dwSelectedItem) {
        result := ComCall(8, this, "ptr", pcpc, "uint", dwFieldID, "uint", dwSelectedItem, "HRESULT")
        return result
    }

    /**
     * Communicates to the Logon UI or Credential UI that an item should be deleted from a combo box and that the UI should be updated.
     * @param {ICredentialProviderCredential} pcpc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredential">ICredentialProviderCredential</a>*</b>
     * 
     * The credential containing the combo box that needs to be updated. This value should be set to <b>this</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents">ICredentialProviderCredentialEvents</a> for more information.
     * @param {Integer} dwFieldID Type: <b>DWORD</b>
     * 
     * The unique ID of the combo box.
     * @param {Integer} dwItem Type: <b>DWORD</b>
     * 
     * The index of the item that is deleted.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-deletefieldcomboboxitem
     */
    DeleteFieldComboBoxItem(pcpc, dwFieldID, dwItem) {
        result := ComCall(9, this, "ptr", pcpc, "uint", dwFieldID, "uint", dwItem, "HRESULT")
        return result
    }

    /**
     * Communicates to the Logon UI or Credential UI that a combo box needs an item appended and that the UI should be updated.
     * @param {ICredentialProviderCredential} pcpc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredential">ICredentialProviderCredential</a>*</b>
     * 
     * The credential containing the combo box that needs an item added. This value should be set to <b>this</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents">ICredentialProviderCredentialEvents</a> for more information.
     * @param {Integer} dwFieldID Type: <b>DWORD</b>
     * 
     * The unique ID of the combo box.
     * @param {PWSTR} pszItem Type: <b>LPCWSTR</b>
     * 
     * The string that will be appended to the combo box as a new option.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-appendfieldcomboboxitem
     */
    AppendFieldComboBoxItem(pcpc, dwFieldID, pszItem) {
        pszItem := pszItem is String ? StrPtr(pszItem) : pszItem

        result := ComCall(10, this, "ptr", pcpc, "uint", dwFieldID, "ptr", pszItem, "HRESULT")
        return result
    }

    /**
     * Enables credentials to set the field that the submit button appears adjacent to.
     * @param {ICredentialProviderCredential} pcpc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredential">ICredentialProviderCredential</a>*</b>
     * 
     * The credential whose submit button location is being set. This value should be set to <b>this</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents">ICredentialProviderCredentialEvents</a> for more information.
     * @param {Integer} dwFieldID Type: <b>DWORD</b>
     * 
     * The unique field ID of the submit button.
     * @param {Integer} dwAdjacentTo Type: <b>DWORD</b>
     * 
     * The unique field ID of the field that the submit button should be adjacent to when this method completes.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-setfieldsubmitbutton
     */
    SetFieldSubmitButton(pcpc, dwFieldID, dwAdjacentTo) {
        result := ComCall(11, this, "ptr", pcpc, "uint", dwFieldID, "uint", dwAdjacentTo, "HRESULT")
        return result
    }

    /**
     * Called when the window is created. Enables credentials to retrieve the HWND of the parent window after Advise is called.
     * @returns {HWND} Type: <b>HWND*</b>
     * 
     * A pointer to the handle of the parent window.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents-oncreatingwindow
     */
    OnCreatingWindow() {
        phwndOwner := HWND()
        result := ComCall(12, this, "ptr", phwndOwner, "HRESULT")
        return phwndOwner
    }
}
