#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnManagementAgent.ahk
#Include ..\..\..\Guid.ahk

/**
 * Allows the creation, deletion, edit, connect, and disconnect flows for VPN. These can be used to manage the lifecycle of a VPN profile, and to create a custom VPN connection manager.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnmanagementagent
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnManagementAgent extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnManagementAgent

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnManagementAgent.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Constructor to allows VPN app to create this object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnManagementAgent")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Creates a new VPN connection based on a ProfileXML-encoded string (see [ProfileXML XSD](/windows/client-management/mdm/vpnv2-profile-xsd)).
     * @remarks
     * You should use this method only with a version of Windows with build number 18362.267, or later. The Windows 10 May 2019 Update (version 1903) has build number 18362; then, an update on July 27 2019 revised that build number to 18362.267. In build numbers prior to 18362.267, this method returns an error code, but does not add a profile.
     * @param {HSTRING} xml A **VpnProfile** object.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnmanagementagent.addprofilefromxmlasync
     */
    AddProfileFromXmlAsync(xml) {
        if (!this.HasProp("__IVpnManagementAgent")) {
            if ((queryResult := this.QueryInterface(IVpnManagementAgent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnManagementAgent := IVpnManagementAgent(outPtr)
        }

        return this.__IVpnManagementAgent.AddProfileFromXmlAsync(xml)
    }

    /**
     * Creates a new VPN Profile based on the **VpnProfile** input object.
     * @param {IVpnProfile} profile_ A **VpnProfile** object.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnmanagementagent.addprofilefromobjectasync
     */
    AddProfileFromObjectAsync(profile_) {
        if (!this.HasProp("__IVpnManagementAgent")) {
            if ((queryResult := this.QueryInterface(IVpnManagementAgent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnManagementAgent := IVpnManagementAgent(outPtr)
        }

        return this.__IVpnManagementAgent.AddProfileFromObjectAsync(profile_)
    }

    /**
     * Updates an existing VPN profile based on an input ProfileXML-encoded string (see [ProfileXML XSD](/windows/client-management/mdm/vpnv2-profile-xsd)).
     * @param {HSTRING} xml A ProfileXML XML string.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnmanagementagent.updateprofilefromxmlasync
     */
    UpdateProfileFromXmlAsync(xml) {
        if (!this.HasProp("__IVpnManagementAgent")) {
            if ((queryResult := this.QueryInterface(IVpnManagementAgent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnManagementAgent := IVpnManagementAgent(outPtr)
        }

        return this.__IVpnManagementAgent.UpdateProfileFromXmlAsync(xml)
    }

    /**
     * Updates a virtual private network (VPN) profile based on an input object.
     * @param {IVpnProfile} profile_ A VPN profile object&mdash;an object that implements the [IVpnProfile](/uwp/api/windows.networking.vpn.ivpnprofile) interface, such as [VpnNativeProfile](/uwp/api/windows.networking.vpn.vpnnativeprofile) or [VpnPlugInProfile](/uwp/api/windows.networking.vpn.vpnpluginprofile).
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnmanagementagent.updateprofilefromobjectasync
     */
    UpdateProfileFromObjectAsync(profile_) {
        if (!this.HasProp("__IVpnManagementAgent")) {
            if ((queryResult := this.QueryInterface(IVpnManagementAgent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnManagementAgent := IVpnManagementAgent(outPtr)
        }

        return this.__IVpnManagementAgent.UpdateProfileFromObjectAsync(profile_)
    }

    /**
     * Gets the accessible list of present VPN profiles.
     * @returns {IAsyncOperation<IVectorView<IVpnProfile>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnmanagementagent.getprofilesasync
     */
    GetProfilesAsync() {
        if (!this.HasProp("__IVpnManagementAgent")) {
            if ((queryResult := this.QueryInterface(IVpnManagementAgent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnManagementAgent := IVpnManagementAgent(outPtr)
        }

        return this.__IVpnManagementAgent.GetProfilesAsync()
    }

    /**
     * Deletes an existing VPN profile.
     * @param {IVpnProfile} profile_ A **VpnProfile** object.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnmanagementagent.deleteprofileasync
     */
    DeleteProfileAsync(profile_) {
        if (!this.HasProp("__IVpnManagementAgent")) {
            if ((queryResult := this.QueryInterface(IVpnManagementAgent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnManagementAgent := IVpnManagementAgent(outPtr)
        }

        return this.__IVpnManagementAgent.DeleteProfileAsync(profile_)
    }

    /**
     * Connects to an existing VPN profile.
     * @param {IVpnProfile} profile_ A **VpnProfile** object.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnmanagementagent.connectprofileasync
     */
    ConnectProfileAsync(profile_) {
        if (!this.HasProp("__IVpnManagementAgent")) {
            if ((queryResult := this.QueryInterface(IVpnManagementAgent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnManagementAgent := IVpnManagementAgent(outPtr)
        }

        return this.__IVpnManagementAgent.ConnectProfileAsync(profile_)
    }

    /**
     * Connects to a VPN profile using a specified set of password credentials.
     * @param {IVpnProfile} profile_ A **VpnProfile** object.
     * @param {PasswordCredential} passwordCredential_ The current password used by the user to log on to the VPN server.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnmanagementagent.connectprofilewithpasswordcredentialasync
     */
    ConnectProfileWithPasswordCredentialAsync(profile_, passwordCredential_) {
        if (!this.HasProp("__IVpnManagementAgent")) {
            if ((queryResult := this.QueryInterface(IVpnManagementAgent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnManagementAgent := IVpnManagementAgent(outPtr)
        }

        return this.__IVpnManagementAgent.ConnectProfileWithPasswordCredentialAsync(profile_, passwordCredential_)
    }

    /**
     * Disconnects from a connected VPN profile.
     * @param {IVpnProfile} profile_ A **VpnProfile** object.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnmanagementagent.disconnectprofileasync
     */
    DisconnectProfileAsync(profile_) {
        if (!this.HasProp("__IVpnManagementAgent")) {
            if ((queryResult := this.QueryInterface(IVpnManagementAgent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnManagementAgent := IVpnManagementAgent(outPtr)
        }

        return this.__IVpnManagementAgent.DisconnectProfileAsync(profile_)
    }

;@endregion Instance Methods
}
