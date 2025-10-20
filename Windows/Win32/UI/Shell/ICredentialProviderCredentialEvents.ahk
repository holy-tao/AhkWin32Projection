#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<ICredentialProviderCredential>} pcpc 
     * @param {Integer} dwFieldID 
     * @param {Integer} cpfs 
     * @returns {HRESULT} 
     */
    SetFieldState(pcpc, dwFieldID, cpfs) {
        result := ComCall(3, this, "ptr", pcpc, "uint", dwFieldID, "int", cpfs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICredentialProviderCredential>} pcpc 
     * @param {Integer} dwFieldID 
     * @param {Integer} cpfis 
     * @returns {HRESULT} 
     */
    SetFieldInteractiveState(pcpc, dwFieldID, cpfis) {
        result := ComCall(4, this, "ptr", pcpc, "uint", dwFieldID, "int", cpfis, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICredentialProviderCredential>} pcpc 
     * @param {Integer} dwFieldID 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     */
    SetFieldString(pcpc, dwFieldID, psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(5, this, "ptr", pcpc, "uint", dwFieldID, "ptr", psz, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICredentialProviderCredential>} pcpc 
     * @param {Integer} dwFieldID 
     * @param {BOOL} bChecked 
     * @param {PWSTR} pszLabel 
     * @returns {HRESULT} 
     */
    SetFieldCheckbox(pcpc, dwFieldID, bChecked, pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(6, this, "ptr", pcpc, "uint", dwFieldID, "int", bChecked, "ptr", pszLabel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICredentialProviderCredential>} pcpc 
     * @param {Integer} dwFieldID 
     * @param {HBITMAP} hbmp 
     * @returns {HRESULT} 
     */
    SetFieldBitmap(pcpc, dwFieldID, hbmp) {
        hbmp := hbmp is Win32Handle ? NumGet(hbmp, "ptr") : hbmp

        result := ComCall(7, this, "ptr", pcpc, "uint", dwFieldID, "ptr", hbmp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICredentialProviderCredential>} pcpc 
     * @param {Integer} dwFieldID 
     * @param {Integer} dwSelectedItem 
     * @returns {HRESULT} 
     */
    SetFieldComboBoxSelectedItem(pcpc, dwFieldID, dwSelectedItem) {
        result := ComCall(8, this, "ptr", pcpc, "uint", dwFieldID, "uint", dwSelectedItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICredentialProviderCredential>} pcpc 
     * @param {Integer} dwFieldID 
     * @param {Integer} dwItem 
     * @returns {HRESULT} 
     */
    DeleteFieldComboBoxItem(pcpc, dwFieldID, dwItem) {
        result := ComCall(9, this, "ptr", pcpc, "uint", dwFieldID, "uint", dwItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICredentialProviderCredential>} pcpc 
     * @param {Integer} dwFieldID 
     * @param {PWSTR} pszItem 
     * @returns {HRESULT} 
     */
    AppendFieldComboBoxItem(pcpc, dwFieldID, pszItem) {
        pszItem := pszItem is String ? StrPtr(pszItem) : pszItem

        result := ComCall(10, this, "ptr", pcpc, "uint", dwFieldID, "ptr", pszItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICredentialProviderCredential>} pcpc 
     * @param {Integer} dwFieldID 
     * @param {Integer} dwAdjacentTo 
     * @returns {HRESULT} 
     */
    SetFieldSubmitButton(pcpc, dwFieldID, dwAdjacentTo) {
        result := ComCall(11, this, "ptr", pcpc, "uint", dwFieldID, "uint", dwAdjacentTo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} phwndOwner 
     * @returns {HRESULT} 
     */
    OnCreatingWindow(phwndOwner) {
        result := ComCall(12, this, "ptr", phwndOwner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
