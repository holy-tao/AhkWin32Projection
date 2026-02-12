#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enable the handling of a credential.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * <b>ICredentialProviderCredential</b> is implemented by outside parties providing a Logon UI or Credential UI  prompting for user credentials. Enumeration of user tiles cannot be done without an implementation of this interface.
 * 
 * <h3><a id="Credential_Provider_Best_Practices"></a><a id="credential_provider_best_practices"></a><a id="CREDENTIAL_PROVIDER_BEST_PRACTICES"></a>Credential Provider Best Practices</h3>
 * Credential providers handle extremely sensitive user secrets in order to complete logon and unlock requests. As a best practice, secret information such as passwords and PINs should be handled with the utmost care. Proper techniques for handling secret information within a credential provider are: 
 * 
 *                 
 * 
 * <ul>
 * <li>Always securely discard secrets. To do this, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> before freeing the memory used to hold any secret.</li>
 * <li>Securely discard secrets promptly after they are used.</li>
 * <li>Securely discard secrets if they are not used for their intended purpose within an expected amount of time.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nn-credentialprovider-icredentialprovidercredential
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICredentialProviderCredential extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICredentialProviderCredential
     * @type {Guid}
     */
    static IID => Guid("{63913a93-40c1-481a-818d-4072ff8c70cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Advise", "UnAdvise", "SetSelected", "SetDeselected", "GetFieldState", "GetStringValue", "GetBitmapValue", "GetCheckboxValue", "GetSubmitButtonValue", "GetComboBoxValueCount", "GetComboBoxValueAt", "SetStringValue", "SetCheckboxValue", "SetComboBoxSelectedValue", "CommandLinkClicked", "GetSerialization", "ReportResult"]

    /**
     * Enables a credential to initiate events in the Logon UI or Credential UI through a callback interface. This method should be called before other methods in ICredentialProviderCredential interface.
     * @remarks
     * This method is optional. If you do not implement this method, you should just return <b>E_NOTIMPL</b>.
     * 
     * Credential providers that implement this method have the responsibility of calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the provided <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents">ICredentialProviderCredentialEvents</a>. Those credential providers also need to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> during the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-unadvise">UnAdvise</a> method.
     * @param {ICredentialProviderCredentialEvents} pcpce Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents">ICredentialProviderCredentialEvents</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents">ICredentialProviderCredentialEvents</a> callback interface to be used as the notification mechanism.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovidercredential-advise
     */
    Advise(pcpce) {
        result := ComCall(3, this, "ptr", pcpce, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Used by the Logon UI or Credential UI to advise the credential that event callbacks are no longer accepted.
     * @remarks
     * This method is optional. If you do not implement this method, you should just return <b>E_NOTIMPL</b>.
     * 
     * If this method is called, it indicates that the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents">ICredentialProviderCredentialEvents</a> pointer provided in <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-advise">Advise</a> is no longer valid. It is the responsibility of the credential provider to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the provided <b>ICredentialProviderCredentialEvents</b> pointer during this method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovidercredential-unadvise
     */
    UnAdvise() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called when a credential is selected. Enables the implementer to set logon characteristics.
     * @remarks
     * Returning any value other than <b>S_OK</b> causes the Logon UI and Credential UI to behave as if no selection occurred.
     * 
     * In Windows 10, if a credential provider wants to automatically log the user on in a situation Windows does not think is appropriate, the system will display a sign in button as a speed bump. One example of this is when a user with an empty password locks the computer or signs out. In that scenario,  Windows does not directly log the user back in.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * When this method returns, contains <b>TRUE</b> if selection of the credential indicates that it should attempt to logon immediately and automatically, otherwise <b>FALSE</b>. For example, a credential provider that enumerates an account without a password may want to return this as true.
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovidercredential-setselected
     */
    SetSelected() {
        result := ComCall(5, this, "int*", &pbAutoLogon := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbAutoLogon
    }

    /**
     * Called when a credential loses selection.
     * @remarks
     * Credential providers should use this method to purge all buffers containing sensitive information such as a password or Personal Identification Number (PIN). This is in addition to purging them in the destructor of the class that stores them.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovidercredential-setdeselected
     */
    SetDeselected() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the field state. The Logon UI and Credential UI use this to gain information about a field of a credential to display this information in the user tile.
     * @param {Integer} dwFieldID Type: <b>DWORD</b>
     * 
     * The identifier for the field.
     * @param {Pointer<Integer>} pcpfs Type: <b><a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_field_state">CREDENTIAL_PROVIDER_FIELD_STATE</a>*</b>
     * 
     * A pointer to the credential provider field state. This indicates when the field should be displayed on the user tile.
     * @param {Pointer<Integer>} pcpfis Type: <b><a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_field_interactive_state">CREDENTIAL_PROVIDER_FIELD_INTERACTIVE_STATE</a>*</b>
     * 
     * A pointer to the credential provider field interactive state. This indicates when the user can interact with the field.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovidercredential-getfieldstate
     */
    GetFieldState(dwFieldID, pcpfs, pcpfis) {
        pcpfsMarshal := pcpfs is VarRef ? "int*" : "ptr"
        pcpfisMarshal := pcpfis is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "uint", dwFieldID, pcpfsMarshal, pcpfs, pcpfisMarshal, pcpfis, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enables retrieval of text from a credential with a text field.
     * @remarks
     * This method is optional.
     * 
     * The Logon UI and Credential UI us this method to obtain the <i>pszLabel</i> for a field. This information is necessary to get values for <b>CPFT_LARGE_TEXT</b>, <b>CPFT_SMALL_TEXT</b>, <b>CPFT_COMMAND_LINK</b>, <b>CPFT_EDIT_TEXT</b>, and <b>CPFT_PASSWORD_TEXT</b> fields.
     * 
     * <h3><a id="Credential_Provider_Best_Practices"></a><a id="credential_provider_best_practices"></a><a id="CREDENTIAL_PROVIDER_BEST_PRACTICES"></a>Credential Provider Best Practices</h3>
     * Credential providers handle extremely sensitive user secrets in order to complete logon and unlock requests. As a best practice, secret information such as passwords and PINs should be handled with the utmost care. Proper techniques for handling secret information within a credential provider are: 
     * 
     *                 
     * 
     * <ul>
     * <li>Always securely discard secrets. To do this, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> before freeing the memory used to hold any secret.</li>
     * <li>Securely discard secrets promptly after they are used.</li>
     * <li>Securely discard secrets if they are not used for their intended purpose within an expected amount of time.</li>
     * </ul>
     * @param {Integer} dwFieldID Type: <b>DWORD</b>
     * 
     * The identifier for the field.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * A pointer to the memory containing a null-terminated Unicode string to return to the Logon UI or Credential UI.
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovidercredential-getstringvalue
     */
    GetStringValue(dwFieldID) {
        result := ComCall(8, this, "uint", dwFieldID, "ptr*", &ppsz := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppsz
    }

    /**
     * Enables retrieval of bitmap data from a credential with a bitmap field.
     * @remarks
     * This method is optional.
     * @param {Integer} dwFieldID Type: <b>DWORD</b>
     * 
     * The identifier for the field.
     * @returns {HBITMAP} Type: <b>HBITMAP*</b>
     * 
     * Contains a pointer to the handle of the bitmap.
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovidercredential-getbitmapvalue
     */
    GetBitmapValue(dwFieldID) {
        phbmp := HBITMAP()
        result := ComCall(9, this, "uint", dwFieldID, "ptr", phbmp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phbmp
    }

    /**
     * Retrieves the checkbox value.
     * @param {Integer} dwFieldID Type: <b>DWORD</b>
     * 
     * The identifier for the field.
     * @param {Pointer<BOOL>} pbChecked Type: <b>BOOL*</b>
     * 
     * Indicates the state of the checkbox. <b>TRUE</b> indicates the checkbox is checked, otherwise <b>FALSE</b>.
     * @param {Pointer<PWSTR>} ppszLabel Type: <b>LPWSTR*</b>
     * 
     * Points to the label on the checkbox.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovidercredential-getcheckboxvalue
     */
    GetCheckboxValue(dwFieldID, pbChecked, ppszLabel) {
        pbCheckedMarshal := pbChecked is VarRef ? "int*" : "ptr"
        ppszLabelMarshal := ppszLabel is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "uint", dwFieldID, pbCheckedMarshal, pbChecked, ppszLabelMarshal, ppszLabel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the identifier of a field that the submit button should be placed next to in the Logon UI.
     * @remarks
     * The submit button is not labeled as such; that is simply a generic way to refer to the button you click to submit the credentials. The button normally appears as a circular button that contains an arrow pointing to the right, although this appearance could change in later releases. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/ne-credentialprovider-credential_provider_field_type">CPFT_SUBMIT_BUTTON</a>.
     * 
     * You should not hide the submit button unless your credential provider always performs automatic submission. Otherwise it can be confusing to the users since they will not see a way to submit their credentials.
     * 
     * Call this method when assembling the Logon UI. For example usage, see the Credential Providers samples included in the Windows Software Development Kit (SDK).
     * 
     * .
     * @param {Integer} dwFieldID Type: <b>DWORD</b>
     * 
     * The identifier for the field a submit button value is needed for.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to a value that receives the field ID of the field that the submit button should be placed next to.
     * 
     * <b>Note to implementers:</b> Do not return the field ID of a bitmap in this parameter. It is not good UI design to place the submit button next to a bitmap, and doing so can cause a failure in the Logon UI.
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovidercredential-getsubmitbuttonvalue
     */
    GetSubmitButtonValue(dwFieldID) {
        result := ComCall(11, this, "uint", dwFieldID, "uint*", &pdwAdjacentTo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwAdjacentTo
    }

    /**
     * Gets a count of the items in the specified combo box and designates which item should have initial selection.
     * @remarks
     * Credential UI and Logon UI use this method to obtain the number of items in a combo box and designate which item should have initial selection.
     * @param {Integer} dwFieldID Type: <b>DWORD</b>
     * 
     * The identifier for the combo box to gather information about.
     * @param {Pointer<Integer>} pcItems Type: <b>DWORD*</b>
     * 
     * A pointer to the number of items in the given combo box.
     * @param {Pointer<Integer>} pdwSelectedItem Type: <b>DWORD*</b>
     * 
     * Contains a pointer to the item that receives initial selection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovidercredential-getcomboboxvaluecount
     */
    GetComboBoxValueCount(dwFieldID, pcItems, pdwSelectedItem) {
        pcItemsMarshal := pcItems is VarRef ? "uint*" : "ptr"
        pdwSelectedItemMarshal := pdwSelectedItem is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "uint", dwFieldID, pcItemsMarshal, pcItems, pdwSelectedItemMarshal, pdwSelectedItem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the string label for a combo box entry at the given index.
     * @param {Integer} dwFieldID Type: <b>DWORD</b>
     * 
     * The identifier for the combo box to query.
     * @param {Integer} dwItem Type: <b>DWORD</b>
     * 
     * The index of the desired item.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * A pointer to the string value that receives the combo box label.
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovidercredential-getcomboboxvalueat
     */
    GetComboBoxValueAt(dwFieldID, dwItem) {
        result := ComCall(13, this, "uint", dwFieldID, "uint", dwItem, "ptr*", &ppszItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszItem
    }

    /**
     * Enables a Logon UI or Credential UI to update the text for a CPFT_EDIT_TEXT fields as the user types in them.
     * @remarks
     * This method is optional.
     * 
     * <h3><a id="Credential_Provider_Best_Practices"></a><a id="credential_provider_best_practices"></a><a id="CREDENTIAL_PROVIDER_BEST_PRACTICES"></a>Credential Provider Best Practices</h3>
     * Credential providers handle extremely sensitive user secrets in order to complete logon and unlock requests. As a best practice, secret information such as passwords and PINs should be handled with the utmost care. Proper techniques for handling secret information within a credential provider are: 
     * 
     *                 
     * 
     * <ul>
     * <li>Always securely discard secrets. To do this, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> before freeing the memory used to hold any secret.</li>
     * <li>Securely discard secrets promptly after they are used.</li>
     * <li>Securely discard secrets if they are not used for their intended purpose within an expected amount of time.</li>
     * </ul>
     * @param {Integer} dwFieldID Type: <b>DWORD</b>
     * 
     * The identifier for the field that needs to be updated.
     * @param {PWSTR} psz Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the new text.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovidercredential-setstringvalue
     */
    SetStringValue(dwFieldID, psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(14, this, "uint", dwFieldID, "ptr", psz, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enables a Logon UI and Credential UI to indicate that a checkbox value has changed.
     * @param {Integer} dwFieldID Type: <b>DWORD</b>
     * 
     * The identifier for the field to update.
     * @param {BOOL} bChecked Type: <b>BOOL</b>
     * 
     * Indicates the new value for the checkbox. <b>TRUE</b> means the checkbox should be checked, <b>FALSE</b> means unchecked.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovidercredential-setcheckboxvalue
     */
    SetCheckboxValue(dwFieldID, bChecked) {
        result := ComCall(15, this, "uint", dwFieldID, "int", bChecked, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enables a Logon UI and Credential UI to indicate that a combo box value has been selected.
     * @param {Integer} dwFieldID Type: <b>DWORD</b>
     * 
     * The identifier for the combo box that is affected.
     * @param {Integer} dwSelectedItem Type: <b>DWORD</b>
     * 
     * The specific item selected.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovidercredential-setcomboboxselectedvalue
     */
    SetComboBoxSelectedValue(dwFieldID, dwSelectedItem) {
        result := ComCall(16, this, "uint", dwFieldID, "uint", dwSelectedItem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enables the Logon UI and Credential UI to indicate that a link was clicked.
     * @remarks
     * This method contains the logic that the credential provider uses to respond to the click.
     * @param {Integer} dwFieldID Type: <b>DWORD</b>
     * 
     * The identifier for the field clicked on.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovidercredential-commandlinkclicked
     */
    CommandLinkClicked(dwFieldID) {
        result := ComCall(17, this, "uint", dwFieldID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called in response to an attempt to submit this credential to the underlying authentication engine.
     * @remarks
     * This method is required.
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_usage_scenario">CREDENTIAL_PROVIDER_USAGE_SCENARIO</a> indicates what the appropriate response would be when the user attempts to submit credentials. The following table indicates how to respond based on the usage scenario.
     * 
     * <table>
     * <tr>
     * <td><b>CPUS_CHANGE_PASSWORD</b></td>
     * <td>No credential serialization occurs in this scenario. In this scenario the credential provider should update the user's private information and return <b>CPGSR_NO_CREDENTIAL_FINISHED</b> as <i>pcpgsr.</i></td>
     * </tr>
     * <tr>
     * <td><b>CPUS_CREDUI</b></td>
     * <td>The credential information should be serialized and delivered to the calling application.</td>
     * </tr>
     * <tr>
     * <td><b>CPUS_LOGON</b>, <b>CPUS_UNLOCK_WORKSTATION</b></td>
     * <td>The credential information should be packed into a binary stream and transmitted to <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/winlogon">Winlogon</a> and eventually LSA.</td>
     * </tr>
     * </table>
     *  
     * 
     * <h3><a id="Credential_Provider_Best_Practices"></a><a id="credential_provider_best_practices"></a><a id="CREDENTIAL_PROVIDER_BEST_PRACTICES"></a>Credential Provider Best Practices</h3>
     * Credential providers handle extremely sensitive user secrets in order to complete logon and unlock requests. As a best practice, secret information such as passwords and PINs should be handled with the utmost care. Proper techniques for handling secret information within a credential provider are: 
     * 
     *                 
     * 
     * <ul>
     * <li>Always securely discard secrets. To do this, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> before freeing the memory used to hold any secret.</li>
     * <li>Securely discard secrets promptly after they are used.</li>
     * <li>Securely discard secrets if they are not used for their intended purpose within an expected amount of time.</li>
     * </ul>
     * @param {Pointer<Integer>} pcpgsr Type: <b><a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_get_serialization_response">CREDENTIAL_PROVIDER_GET_SERIALIZATION_RESPONSE</a>*</b>
     * 
     * Indicates the success or failure of the attempt to serialize credentials.
     * @param {Pointer<CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION>} pcpcs Type: <b><a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ns-credentialprovider-credential_provider_credential_serialization">CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION</a>*</b>
     * 
     * A pointer to the credential. Depending on the result, there may be no valid credential.
     * @param {Pointer<PWSTR>} ppszOptionalStatusText Type: <b>LPWSTR*</b>
     * 
     * A pointer to a Unicode string value that will be displayed by the Logon UI after serialization. May be <b>NULL</b>.
     * @param {Pointer<Integer>} pcpsiOptionalStatusIcon Type: <b><a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_status_icon">CREDENTIAL_PROVIDER_STATUS_ICON</a>*</b>
     * 
     * A pointer to an icon that will be displayed by the credential after the call to <b>GetSerialization</b> returns. This value can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovidercredential-getserialization
     */
    GetSerialization(pcpgsr, pcpcs, ppszOptionalStatusText, pcpsiOptionalStatusIcon) {
        pcpgsrMarshal := pcpgsr is VarRef ? "int*" : "ptr"
        ppszOptionalStatusTextMarshal := ppszOptionalStatusText is VarRef ? "ptr*" : "ptr"
        pcpsiOptionalStatusIconMarshal := pcpsiOptionalStatusIcon is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, pcpgsrMarshal, pcpgsr, "ptr", pcpcs, ppszOptionalStatusTextMarshal, ppszOptionalStatusText, pcpsiOptionalStatusIconMarshal, pcpsiOptionalStatusIcon, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Translates a received error status code into the appropriate user-readable message.
     * @remarks
     * This method is required for Logon UI.
     * 
     * This method is used to report the outcome of a logon attempt back to a credential. The information in <i>ntsStatus</i> and <i>ntsSubstatus</i> can also be used when credential providers want to generate custom error messages. That status text from this call will be displayed on the selected credential.
     * @param {NTSTATUS} ntsStatus Type: <b>NTSTATUS</b>
     * 
     * The <a href="https://docs.microsoft.com/windows-hardware/drivers/kernel/ntstatus-values">NTSTATUS</a> value that reflects the return value of the <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/winlogon">Winlogon</a> call to <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a>.
     * @param {NTSTATUS} ntsSubstatus Type: <b>NTSTATUS</b>
     * 
     * The <a href="https://docs.microsoft.com/windows-hardware/drivers/kernel/ntstatus-values">NTSTATUS</a> value that reflects the value pointed to by the <i>SubStatus</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a> when that function returns after being called by <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/winlogon">Winlogon</a>.
     * @param {Pointer<PWSTR>} ppszOptionalStatusText Type: <b>LPWSTR*</b>
     * 
     * A pointer to the error message that will be displayed to the user. May be <b>NULL</b>.
     * @param {Pointer<Integer>} pcpsiOptionalStatusIcon Type: <b><a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_status_icon">CREDENTIAL_PROVIDER_STATUS_ICON</a>*</b>
     * 
     * A pointer to an icon  that will shown on the credential. May be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/credentialprovider/nf-credentialprovider-icredentialprovidercredential-reportresult
     */
    ReportResult(ntsStatus, ntsSubstatus, ppszOptionalStatusText, pcpsiOptionalStatusIcon) {
        ppszOptionalStatusTextMarshal := ppszOptionalStatusText is VarRef ? "ptr*" : "ptr"
        pcpsiOptionalStatusIconMarshal := pcpsiOptionalStatusIcon is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, "int", ntsStatus, "int", ntsSubstatus, ppszOptionalStatusTextMarshal, ppszOptionalStatusText, pcpsiOptionalStatusIconMarshal, pcpsiOptionalStatusIcon, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
