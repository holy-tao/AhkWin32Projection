#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enable the handling of a credential.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nn-credentialprovider-icredentialprovidercredential
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICredentialProviderCredential extends IUnknown{
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
     * 
     * @param {Pointer<ICredentialProviderCredentialEvents>} pcpce 
     * @returns {HRESULT} 
     */
    Advise(pcpce) {
        result := ComCall(3, this, "ptr", pcpce, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnAdvise() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbAutoLogon 
     * @returns {HRESULT} 
     */
    SetSelected(pbAutoLogon) {
        result := ComCall(5, this, "ptr", pbAutoLogon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetDeselected() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @param {Pointer<Int32>} pcpfs 
     * @param {Pointer<Int32>} pcpfis 
     * @returns {HRESULT} 
     */
    GetFieldState(dwFieldID, pcpfs, pcpfis) {
        result := ComCall(7, this, "uint", dwFieldID, "int*", pcpfs, "int*", pcpfis, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @param {Pointer<PWSTR>} ppsz 
     * @returns {HRESULT} 
     */
    GetStringValue(dwFieldID, ppsz) {
        result := ComCall(8, this, "uint", dwFieldID, "ptr", ppsz, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @param {Pointer<HBITMAP>} phbmp 
     * @returns {HRESULT} 
     */
    GetBitmapValue(dwFieldID, phbmp) {
        result := ComCall(9, this, "uint", dwFieldID, "ptr", phbmp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @param {Pointer<BOOL>} pbChecked 
     * @param {Pointer<PWSTR>} ppszLabel 
     * @returns {HRESULT} 
     */
    GetCheckboxValue(dwFieldID, pbChecked, ppszLabel) {
        result := ComCall(10, this, "uint", dwFieldID, "ptr", pbChecked, "ptr", ppszLabel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @param {Pointer<UInt32>} pdwAdjacentTo 
     * @returns {HRESULT} 
     */
    GetSubmitButtonValue(dwFieldID, pdwAdjacentTo) {
        result := ComCall(11, this, "uint", dwFieldID, "uint*", pdwAdjacentTo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @param {Pointer<UInt32>} pcItems 
     * @param {Pointer<UInt32>} pdwSelectedItem 
     * @returns {HRESULT} 
     */
    GetComboBoxValueCount(dwFieldID, pcItems, pdwSelectedItem) {
        result := ComCall(12, this, "uint", dwFieldID, "uint*", pcItems, "uint*", pdwSelectedItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @param {Integer} dwItem 
     * @param {Pointer<PWSTR>} ppszItem 
     * @returns {HRESULT} 
     */
    GetComboBoxValueAt(dwFieldID, dwItem, ppszItem) {
        result := ComCall(13, this, "uint", dwFieldID, "uint", dwItem, "ptr", ppszItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     */
    SetStringValue(dwFieldID, psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(14, this, "uint", dwFieldID, "ptr", psz, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @param {BOOL} bChecked 
     * @returns {HRESULT} 
     */
    SetCheckboxValue(dwFieldID, bChecked) {
        result := ComCall(15, this, "uint", dwFieldID, "int", bChecked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @param {Integer} dwSelectedItem 
     * @returns {HRESULT} 
     */
    SetComboBoxSelectedValue(dwFieldID, dwSelectedItem) {
        result := ComCall(16, this, "uint", dwFieldID, "uint", dwSelectedItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @returns {HRESULT} 
     */
    CommandLinkClicked(dwFieldID) {
        result := ComCall(17, this, "uint", dwFieldID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pcpgsr 
     * @param {Pointer<CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION>} pcpcs 
     * @param {Pointer<PWSTR>} ppszOptionalStatusText 
     * @param {Pointer<Int32>} pcpsiOptionalStatusIcon 
     * @returns {HRESULT} 
     */
    GetSerialization(pcpgsr, pcpcs, ppszOptionalStatusText, pcpsiOptionalStatusIcon) {
        result := ComCall(18, this, "int*", pcpgsr, "ptr", pcpcs, "ptr", ppszOptionalStatusText, "int*", pcpsiOptionalStatusIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {NTSTATUS} ntsStatus 
     * @param {NTSTATUS} ntsSubstatus 
     * @param {Pointer<PWSTR>} ppszOptionalStatusText 
     * @param {Pointer<Int32>} pcpsiOptionalStatusIcon 
     * @returns {HRESULT} 
     */
    ReportResult(ntsStatus, ntsSubstatus, ppszOptionalStatusText, pcpsiOptionalStatusIcon) {
        result := ComCall(19, this, "int", ntsStatus, "int", ntsSubstatus, "ptr", ppszOptionalStatusText, "int*", pcpsiOptionalStatusIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
