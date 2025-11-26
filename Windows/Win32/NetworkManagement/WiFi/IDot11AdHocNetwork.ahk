#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDot11AdHocSecuritySettings.ahk
#Include .\IDot11AdHocInterface.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents an available ad hoc network destination within connection range.
 * @see https://docs.microsoft.com/windows/win32/api//adhoc/nn-adhoc-idot11adhocnetwork
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class IDot11AdHocNetwork extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDot11AdHocNetwork
     * @type {Guid}
     */
    static IID => Guid("{8f10cc29-cf0d-42a0-acbe-e2de7007384d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatus", "GetSSID", "HasProfile", "GetProfileName", "DeleteProfile", "GetSignalQuality", "GetSecuritySetting", "GetContextGuid", "GetSignature", "GetInterface", "Connect", "Disconnect"]

    /**
     * Gets the connection status of the network.
     * @param {Pointer<Integer>} eStatus A pointer to a  <a href="https://docs.microsoft.com/windows/win32/api/adhoc/ne-adhoc-dot11_adhoc_network_connection_status">DOT11_ADHOC_NETWORK_CONNECTION_STATUS</a> value that specifies the connection state.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method could not allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer passed as a parameter is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocnetwork-getstatus
     */
    GetStatus(eStatus) {
        eStatusMarshal := eStatus is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, eStatusMarshal, eStatus, "HRESULT")
        return result
    }

    /**
     * Gets the SSID of the network.
     * @returns {PWSTR} The SSID of the network.
     * 
     * You must free this string using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocnetwork-getssid
     */
    GetSSID() {
        result := ComCall(4, this, "ptr*", &ppszwSSID := 0, "HRESULT")
        return ppszwSSID
    }

    /**
     * Returns a boolean value that specifies whether there is a saved profile associated with the network.
     * @param {Pointer<Integer>} pf11d Specifies whether the network has a profile. This value is set to <b>TRUE</b> if the network has a profile and <b>FALSE</b> otherwise.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method could not allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer passed as a parameter is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocnetwork-hasprofile
     */
    HasProfile(pf11d) {
        pf11dMarshal := pf11d is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pf11dMarshal, pf11d, "HRESULT")
        return result
    }

    /**
     * Gets the profile name associated with the network.
     * @returns {PWSTR} The name of the profile associated with the network. If the network has no profile, this parameter is <b>NULL</b>.
     * 
     * You must free this string using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocnetwork-getprofilename
     */
    GetProfileName() {
        result := ComCall(6, this, "ptr*", &ppszwProfileName := 0, "HRESULT")
        return ppszwProfileName
    }

    /**
     * Deletes any profile associated with the network.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method could not allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocnetwork-deleteprofile
     */
    DeleteProfile() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Gets the signal quality values associated with the network's radio.
     * @param {Pointer<Integer>} puStrengthValue The current signal strength. This parameter takes a ULONG value between 0 and <i>puStrengthMax</i>.
     * @param {Pointer<Integer>} puStrengthMax The maximum signal strength value. This parameter takes a ULONG value between 0 and 100. By default, <i>puStrengthMax</i> is set to 100.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method could not allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer passed as a parameter is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocnetwork-getsignalquality
     */
    GetSignalQuality(puStrengthValue, puStrengthMax) {
        puStrengthValueMarshal := puStrengthValue is VarRef ? "uint*" : "ptr"
        puStrengthMaxMarshal := puStrengthMax is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, puStrengthValueMarshal, puStrengthValue, puStrengthMaxMarshal, puStrengthMax, "HRESULT")
        return result
    }

    /**
     * Gets the security settings for the network.
     * @returns {IDot11AdHocSecuritySettings} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nn-adhoc-idot11adhocsecuritysettings">IDot11AdHocSecuritySettings</a> interface that contains the security settings for the network.
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocnetwork-getsecuritysetting
     */
    GetSecuritySetting() {
        result := ComCall(9, this, "ptr*", &pAdHocSecuritySetting := 0, "HRESULT")
        return IDot11AdHocSecuritySettings(pAdHocSecuritySetting)
    }

    /**
     * Gets the context identifier associated with the network.
     * @param {Pointer<Guid>} pContextGuid The context identifier associated with the network. If no ContextGuid was specified when the <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nf-adhoc-idot11adhocmanager-createnetwork">CreateNetwork</a> call was made, the GUID returned consists of all zeros.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method could not allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer passed as a parameter is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocnetwork-getcontextguid
     */
    GetContextGuid(pContextGuid) {
        result := ComCall(10, this, "ptr", pContextGuid, "HRESULT")
        return result
    }

    /**
     * Gets the unique signature associated with the ad hoc network.
     * @param {Pointer<Guid>} pSignature A signature that uniquely identifies an ad hoc network. This signature is generated  from certain network attributes.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method could not allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer passed as a parameter is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocnetwork-getsignature
     */
    GetSignature(pSignature) {
        result := ComCall(11, this, "ptr", pSignature, "HRESULT")
        return result
    }

    /**
     * Gets the interface associated with a network.
     * @returns {IDot11AdHocInterface} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nn-adhoc-idot11adhocinterface">IDot11AdHocInterface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocnetwork-getinterface
     */
    GetInterface() {
        result := ComCall(12, this, "ptr*", &pAdHocInterface := 0, "HRESULT")
        return IDot11AdHocInterface(pAdHocInterface)
    }

    /**
     * Connects to a previously created wireless ad hoc network.
     * @param {PWSTR} Passphrase The password string used to authenticate the user or machine on the network.
     * 
     * The length of the password string depends on the security settings passed in the <i>pSecurity</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nf-adhoc-idot11adhocmanager-createnetwork">CreateNetwork</a> call. The following table shows the password length associated with various security settings.
     * 
     * <table>
     * <tr>
     * <th>Security Settings</th>
     * <th>Password Length</th>
     * </tr>
     * <tr>
     * <td>Open-None</td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td>Open-WEP</td>
     * <td>5 or 13 characters; 10 or 26 hexadecimal digits</td>
     * </tr>
     * <tr>
     * <td>WPA2PSK</td>
     * <td>8 to 63 characters</td>
     * </tr>
     * </table>
     *  
     * 
     * For the enumerated values that correspond to the security settings pair above, see <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/ne-adhoc-dot11_adhoc_auth_algorithm">DOT11_ADHOC_AUTH_ALGORITHM</a> and <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/ne-adhoc-dot11_adhoc_cipher_algorithm">DOT11_ADHOC_CIPHER_ALGORITHM</a>.
     * @param {Integer} GeographicalId The geographical location in which the network was created. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/Intl/table-of-geographical-locations">Table of Geographical Locations</a>.
     * @param {BOOLEAN} fSaveProfile An optional parameter that specifies whether a wireless profile should  be saved. If <b>TRUE</b>, the profile is saved to the profile store. Once a profile is saved, the user can modify the profile using the <b>Manage Wireless Network</b> user interface. Profiles can also be modified using the <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/native-wifi-functions">Native Wifi Functions</a>.
     * 
     * Saving a profile modifies the network signature returned by <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nf-adhoc-idot11adhocnetwork-getsignature">IDot11AdHocNetwork::GetSignature</a>.
     * @param {BOOLEAN} fMakeSavedProfileUserSpecific An optional parameter that specifies whether the profile to be saved is an all-user profile.  If set to <b>TRUE</b>, the profile is specific to the current user. If set to <b>FALSE</b>, the profile is an all-user profile and can be used by any user logged into the machine. This parameter is ignored if <i>fSaveProfile</i> is <b>FALSE</b>.
     * 
     * By default, only members of the Administrators group can save an all-user profile. These security settings can be altered using the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetsecuritysettings">WlanSetSecuritySettings</a> function. Your application must be launched by a user with sufficient privileges for an all-user profile to be saved successfully.
     * 
     * If your application is running in a Remote Desktop window, you can only save an all-user profile. User-specific profiles cannot be saved from an application running remotely.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified interface is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method could not allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer passed as a parameter is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocnetwork-connect
     */
    Connect(Passphrase, GeographicalId, fSaveProfile, fMakeSavedProfileUserSpecific) {
        Passphrase := Passphrase is String ? StrPtr(Passphrase) : Passphrase

        result := ComCall(13, this, "ptr", Passphrase, "int", GeographicalId, "char", fSaveProfile, "char", fMakeSavedProfileUserSpecific, "HRESULT")
        return result
    }

    /**
     * Disconnects from an ad hoc network.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocnetwork-disconnect
     */
    Disconnect() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}
