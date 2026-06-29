#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDot11AdHocSecuritySettings.ahk" { IDot11AdHocSecuritySettings }
#Import ".\IEnumDot11AdHocInterfaces.ahk" { IEnumDot11AdHocInterfaces }
#Import ".\IDot11AdHocNetwork.ahk" { IDot11AdHocNetwork }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDot11AdHocInterface.ahk" { IDot11AdHocInterface }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IEnumDot11AdHocNetworks.ahk" { IEnumDot11AdHocNetworks }

/**
 * Creates and manages 802.11 ad hoc networks.
 * @see https://learn.microsoft.com/windows/win32/api/adhoc/nn-adhoc-idot11adhocmanager
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct IDot11AdHocManager extends IUnknown {
    /**
     * The interface identifier for IDot11AdHocManager
     * @type {Guid}
     */
    static IID := Guid("{8f10cc26-cf0d-42a0-acbe-e2de7007384d}")

    /**
     * The class identifier for Dot11AdHocManager
     * @type {Guid}
     */
    static CLSID := Guid("{dd06a84f-83bd-4d01-8ab9-2389fea0869e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDot11AdHocManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateNetwork                : IntPtr
        CommitCreatedNetwork         : IntPtr
        GetIEnumDot11AdHocNetworks   : IntPtr
        GetIEnumDot11AdHocInterfaces : IntPtr
        GetNetwork                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDot11AdHocManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a wireless ad hoc network.
     * @remarks
     * After a successful <b>CreateNetwork</b> call, the network object returned by <i>pIAdHoc</i> is provisioned but not constructed. A subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nf-adhoc-idot11adhocmanager-commitcreatednetwork">CommitCreatedNetwork</a> initializes the network. Beacons are not sent until the network is committed. 
     * 
     * There are no clients or hosts connected to the network after a <b>CreateNetwork</b> call. Applications are notified of both successful and failed connection attempts using the <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nn-adhoc-idot11adhocmanagernotificationsink">IDot11AdHocManagerNotificationSink</a> interface. For information about registering for notifications on that interface, see <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nn-adhoc-idot11adhocmanager">IDot11AdHocManager</a>.
     * @param {PWSTR} Name The friendly name of the network. This string should be limited to 32 characters. The SSID should be used as the friendly name. This name is broadcasted in a beacon.
     * @param {PWSTR} Password The password used for machine or user authentication on the network. 
     * 
     * The length of the password string depends on the security settings passed in the <i>pSecurity</i> parameter. The following table shows the password length associated with various security settings.
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
     * For the enumerated values that correspond to the security settings pair above, see <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/ne-adhoc-dot11_adhoc_auth_algorithm">DOT11_ADHOC_AUTH_ALGORITHM</a> and <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/ne-adhoc-dot11_adhoc_cipher_algorithm">DOT11_ADHOC_CIPHER_ALGORITHM</a>
     * @param {Integer} GeographicalId The geographical location in which the network will be created. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/Intl/table-of-geographical-locations">Table of Geographical Locations</a>. 
     * 
     * If the interface is not 802.11d conformant, this value is ignored. That means if <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nf-adhoc-idot11adhocinterface-isdot11d">IDot11AdHocInterface::IsDot11d</a> returns <b>FALSE</b>, this value is ignored.
     * 
     * If you are not sure which value to use, set <i>GeographicalId</i> to CTRY_DEFAULT. If you use CTRY_DEFAULT, 802.11d conformance is not enforced.
     * @param {IDot11AdHocInterface} pInterface An optional pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nn-adhoc-idot11adhocinterface">IDot11AdHocInterface</a> that specifies the network interface upon which the new network is created. If this parameter is <b>NULL</b>, the first unused interface is used. If all interfaces are in use, the first enumerated interface is used. In that case, the previous network on the interface is disconnected.
     * @param {IDot11AdHocSecuritySettings} pSecurity A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nn-adhoc-idot11adhocsecuritysettings">IDot11AdHocSecuritySettings</a> interface that specifies the security settings used on the network.
     * @param {Pointer<Guid>} pContextGuid An optional parameter that specifies the GUID of the application that created the network. An application can use this identifier to limit the networks enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nf-adhoc-idot11adhocmanager-getienumdot11adhocnetworks">GetIEnumDot11AdHocNetworks</a> to networks created by the application. For this filtering to work correctly, all instances of the application on all machines must use the same GUID.
     * @returns {IDot11AdHocNetwork} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nn-adhoc-idot11adhocnetwork">IDot11AdHocNetwork</a> interface that represents the created network.
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocmanager-createnetwork
     */
    CreateNetwork(Name, Password, GeographicalId, pInterface, pSecurity, pContextGuid) {
        Name := Name is String ? StrPtr(Name) : Name
        Password := Password is String ? StrPtr(Password) : Password

        result := ComCall(3, this, "ptr", Name, "ptr", Password, "int", GeographicalId, "ptr", pInterface, "ptr", pSecurity, Guid.Ptr, pContextGuid, "ptr*", &pIAdHoc := 0, "HRESULT")
        return IDot11AdHocNetwork(pIAdHoc)
    }

    /**
     * Initializes a created network and optionally commits the network's profile to the profile store.
     * @param {IDot11AdHocNetwork} pIAdHoc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nn-adhoc-idot11adhocnetwork">IDot11AdHocNetwork</a> interface that specifies the network to be initialized and committed.
     * @param {BOOLEAN} fSaveProfile An optional parameter that specifies whether a wireless profile should  be saved. If <b>TRUE</b>, the profile is saved to the profile store. Once a profile has been saved, the user can modify the profile using the <b>Manage Wireless Network</b> user interface. Profiles can also be modified using the <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/native-wifi-functions">Native Wifi Functions</a>.
     * 
     * Saving a profile modifies the network signature returned by <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nf-adhoc-idot11adhocnetwork-getsignature">IDot11AdHocNetwork::GetSignature</a>.
     * @param {BOOLEAN} fMakeSavedProfileUserSpecific An optional parameter that specifies whether the profile to be saved is an all-user profile.  If set to <b>TRUE</b>, the profile is specific to the current user. If set to <b>FALSE</b>, the profile is an all-user profile and can be used by any user logged into the machine. This parameter is ignored if <i>fSaveProfile</i> is <b>FALSE</b>. 
     * 
     * By default, only members of the Administrators group can persist an all-user profile. These security settings can be altered using the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetsecuritysettings">WlanSetSecuritySettings</a> function. Your application must be launched by a user with sufficient privileges for an all-user profile to be persisted successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocmanager-commitcreatednetwork
     */
    CommitCreatedNetwork(pIAdHoc, fSaveProfile, fMakeSavedProfileUserSpecific) {
        result := ComCall(4, this, "ptr", pIAdHoc, BOOLEAN, fSaveProfile, BOOLEAN, fMakeSavedProfileUserSpecific, "HRESULT")
        return result
    }

    /**
     * Returns a list of available ad hoc network destinations within connection range.
     * @param {Pointer<Guid>} pContextGuid An optional parameter that specifies the GUID of the application that created the network. An application can use this identifier to limit the networks enumerated to networks created by the application. For this filtering to work correctly, all instances of the application on all machines must use the same GUID.
     * @returns {IEnumDot11AdHocNetworks} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nn-adhoc-ienumdot11adhocnetworks">IEnumDot11AdHocNetworks</a> interface that contains the enumerated networks.
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocmanager-getienumdot11adhocnetworks
     */
    GetIEnumDot11AdHocNetworks(pContextGuid) {
        result := ComCall(5, this, Guid.Ptr, pContextGuid, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDot11AdHocNetworks(ppEnum)
    }

    /**
     * Returns the set of wireless network interface cards (NICs) available on the machine.
     * @returns {IEnumDot11AdHocInterfaces} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nn-adhoc-ienumdot11adhocinterfaces">IEnumDot11AdHocInterfaces</a> interface that contains the list of NICs.
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocmanager-getienumdot11adhocinterfaces
     */
    GetIEnumDot11AdHocInterfaces() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDot11AdHocInterfaces(ppEnum)
    }

    /**
     * Returns the network associated with a signature.
     * @param {Pointer<Guid>} NetworkSignature A signature that uniquely identifies an ad hoc network. This signature is generated  from certain network attributes.
     * @returns {IDot11AdHocNetwork} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nn-adhoc-idot11adhocnetwork">IDot11AdHocNetwork</a> interface that represents the network associated with the signature.
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocmanager-getnetwork
     */
    GetNetwork(NetworkSignature) {
        result := ComCall(7, this, Guid.Ptr, NetworkSignature, "ptr*", &pNetwork := 0, "HRESULT")
        return IDot11AdHocNetwork(pNetwork)
    }

    Query(iid) {
        if (IDot11AdHocManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateNetwork := CallbackCreate(GetMethod(implObj, "CreateNetwork"), flags, 8)
        this.vtbl.CommitCreatedNetwork := CallbackCreate(GetMethod(implObj, "CommitCreatedNetwork"), flags, 4)
        this.vtbl.GetIEnumDot11AdHocNetworks := CallbackCreate(GetMethod(implObj, "GetIEnumDot11AdHocNetworks"), flags, 3)
        this.vtbl.GetIEnumDot11AdHocInterfaces := CallbackCreate(GetMethod(implObj, "GetIEnumDot11AdHocInterfaces"), flags, 2)
        this.vtbl.GetNetwork := CallbackCreate(GetMethod(implObj, "GetNetwork"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateNetwork)
        CallbackFree(this.vtbl.CommitCreatedNetwork)
        CallbackFree(this.vtbl.GetIEnumDot11AdHocNetworks)
        CallbackFree(this.vtbl.GetIEnumDot11AdHocInterfaces)
        CallbackFree(this.vtbl.GetNetwork)
    }
}
