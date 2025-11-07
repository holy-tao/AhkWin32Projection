#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk
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
     * 
     * @param {ICredentialProviderCredentialEvents} pcpce 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-advise
     */
    Advise(pcpce) {
        result := ComCall(3, this, "ptr", pcpce, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-unadvise
     */
    UnAdvise() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-setselected
     */
    SetSelected() {
        result := ComCall(5, this, "int*", &pbAutoLogon := 0, "HRESULT")
        return pbAutoLogon
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-setdeselected
     */
    SetDeselected() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @param {Pointer<Integer>} pcpfs 
     * @param {Pointer<Integer>} pcpfis 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-getfieldstate
     */
    GetFieldState(dwFieldID, pcpfs, pcpfis) {
        pcpfsMarshal := pcpfs is VarRef ? "int*" : "ptr"
        pcpfisMarshal := pcpfis is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "uint", dwFieldID, pcpfsMarshal, pcpfs, pcpfisMarshal, pcpfis, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-getstringvalue
     */
    GetStringValue(dwFieldID) {
        result := ComCall(8, this, "uint", dwFieldID, "ptr*", &ppsz := 0, "HRESULT")
        return ppsz
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @returns {HBITMAP} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-getbitmapvalue
     */
    GetBitmapValue(dwFieldID) {
        phbmp := HBITMAP()
        result := ComCall(9, this, "uint", dwFieldID, "ptr", phbmp, "HRESULT")
        return phbmp
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @param {Pointer<BOOL>} pbChecked 
     * @param {Pointer<PWSTR>} ppszLabel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-getcheckboxvalue
     */
    GetCheckboxValue(dwFieldID, pbChecked, ppszLabel) {
        pbCheckedMarshal := pbChecked is VarRef ? "int*" : "ptr"
        ppszLabelMarshal := ppszLabel is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "uint", dwFieldID, pbCheckedMarshal, pbChecked, ppszLabelMarshal, ppszLabel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-getsubmitbuttonvalue
     */
    GetSubmitButtonValue(dwFieldID) {
        result := ComCall(11, this, "uint", dwFieldID, "uint*", &pdwAdjacentTo := 0, "HRESULT")
        return pdwAdjacentTo
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @param {Pointer<Integer>} pcItems 
     * @param {Pointer<Integer>} pdwSelectedItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-getcomboboxvaluecount
     */
    GetComboBoxValueCount(dwFieldID, pcItems, pdwSelectedItem) {
        pcItemsMarshal := pcItems is VarRef ? "uint*" : "ptr"
        pdwSelectedItemMarshal := pdwSelectedItem is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "uint", dwFieldID, pcItemsMarshal, pcItems, pdwSelectedItemMarshal, pdwSelectedItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @param {Integer} dwItem 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-getcomboboxvalueat
     */
    GetComboBoxValueAt(dwFieldID, dwItem) {
        result := ComCall(13, this, "uint", dwFieldID, "uint", dwItem, "ptr*", &ppszItem := 0, "HRESULT")
        return ppszItem
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-setstringvalue
     */
    SetStringValue(dwFieldID, psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(14, this, "uint", dwFieldID, "ptr", psz, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @param {BOOL} bChecked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-setcheckboxvalue
     */
    SetCheckboxValue(dwFieldID, bChecked) {
        result := ComCall(15, this, "uint", dwFieldID, "int", bChecked, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @param {Integer} dwSelectedItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-setcomboboxselectedvalue
     */
    SetComboBoxSelectedValue(dwFieldID, dwSelectedItem) {
        result := ComCall(16, this, "uint", dwFieldID, "uint", dwSelectedItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFieldID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-commandlinkclicked
     */
    CommandLinkClicked(dwFieldID) {
        result := ComCall(17, this, "uint", dwFieldID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcpgsr 
     * @param {Pointer<CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION>} pcpcs 
     * @param {Pointer<PWSTR>} ppszOptionalStatusText 
     * @param {Pointer<Integer>} pcpsiOptionalStatusIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-getserialization
     */
    GetSerialization(pcpgsr, pcpcs, ppszOptionalStatusText, pcpsiOptionalStatusIcon) {
        pcpgsrMarshal := pcpgsr is VarRef ? "int*" : "ptr"
        ppszOptionalStatusTextMarshal := ppszOptionalStatusText is VarRef ? "ptr*" : "ptr"
        pcpsiOptionalStatusIconMarshal := pcpsiOptionalStatusIcon is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, pcpgsrMarshal, pcpgsr, "ptr", pcpcs, ppszOptionalStatusTextMarshal, ppszOptionalStatusText, pcpsiOptionalStatusIconMarshal, pcpsiOptionalStatusIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {NTSTATUS} ntsStatus 
     * @param {NTSTATUS} ntsSubstatus 
     * @param {Pointer<PWSTR>} ppszOptionalStatusText 
     * @param {Pointer<Integer>} pcpsiOptionalStatusIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-reportresult
     */
    ReportResult(ntsStatus, ntsSubstatus, ppszOptionalStatusText, pcpsiOptionalStatusIcon) {
        ppszOptionalStatusTextMarshal := ppszOptionalStatusText is VarRef ? "ptr*" : "ptr"
        pcpsiOptionalStatusIconMarshal := pcpsiOptionalStatusIcon is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, "int", ntsStatus, "int", ntsSubstatus, ppszOptionalStatusTextMarshal, ppszOptionalStatusText, pcpsiOptionalStatusIconMarshal, pcpsiOptionalStatusIcon, "HRESULT")
        return result
    }
}
