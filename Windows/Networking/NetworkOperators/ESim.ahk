#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IESim.ahk
#Include .\IESim2.ahk
#Include .\IESim3.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ESim.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * A class that represents an embedded SIM (eSIM, or eUICC). An eSIM stores one or more identities (eSIM profiles) belonging to one or more mobile network operators (MNOs). An eSIM is not a form factor; it's a way to manage SIM profiles.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * A traditional SIM card stores a single identity that the modem can use to register onto a mobile network operator's (MNO's) network, and provide cellular service (the card is usually distributed by the MNO). But an eSIM stores one or more identities (eSIM profiles) belonging to one or more mobile operators. An eSIM switches identities by enabling and disabling the eSIM profiles saved on the card. Once an eSIM profile is enabled, the eSIM appears and functions as if it were a traditional SIM card from the MNO that distributed the profile. In this way, the end-user can easily switch between MNOs without changing the physical card.
 * 
 * There are several steps in the process of installing a profile onto an eSIM. The end-user provides an activation code, which is a string that contains the uniform resource location (URL) of a profile-distributing server together with some identifying information. Next, the eSIM-capable device uses the data in the activation code to contact the server. The server returns the metadata for a specific profile, together with information that's then presented to the user asking for consent to download the profile. Having received consent, the eSIM-capable device downloads the profile and sends the profile binary blob to the eSIM. Lastly, the profile is ready to be activated when the profile is successfully written to the eSIM. LpaSvc is a service for handling all eSIM-related operation requests. For end-users, there is a *Managing eSIM profiles* page in **Settings** to provide a UI for managing the eSIM.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esim
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESim extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IESim

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IESim.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the available memory on the SIM card in whole bytes.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esim.availablememoryinbytes
     * @type {IReference<Integer>} 
     */
    AvailableMemoryInBytes {
        get => this.get_AvailableMemoryInBytes()
    }

    /**
     * Gets the eSIM ID (EID).
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @remarks
     * EID is defined in [SGP.02](https://www.gsma.com/newsroom/resources/sgp-02-v3-2-remote-provisioning-architecture-for-embedded-uicc-technical-specification/).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esim.eid
     * @type {HSTRING} 
     */
    Eid {
        get => this.get_Eid()
    }

    /**
     * Gets the eSIM firmware version.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esim.firmwareversion
     * @type {HSTRING} 
     */
    FirmwareVersion {
        get => this.get_FirmwareVersion()
    }

    /**
     * Gets the device identifier, or [DeviceInformation Id](../windows.devices.enumeration/deviceinformation_id.md), of the network [MobileBroadbandModem](mobilebroadbandmodem.md) device that carries the eSIM.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esim.mobilebroadbandmodemdeviceid
     * @type {HSTRING} 
     */
    MobileBroadbandModemDeviceId {
        get => this.get_MobileBroadbandModemDeviceId()
    }

    /**
     * Gets the policy for the eSIM, regarding whether the eSIM should be shown on the Local User Interface (LUI) for eSIM management.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @remarks
     * LUI is defined in [SGP.22](https://www.gsma.com/newsroom/resources/sgp-22-v2-2-technical-specification/) (the published eSIM standard).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esim.policy
     * @type {ESimPolicy} 
     */
    Policy {
        get => this.get_Policy()
    }

    /**
     * Gets the state of the eSIM, which indicates the presence and working status of the eSIM.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esim.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets the 0-based slot index (slot number) that the eSim corresponds to. **ESim.SlotIndex** matches the [Index](mobilebroadbandslotinfo_index.md) property of the corresponding [MobileBroadbandSlotInfo](mobilebroadbandslotinfo.md) object.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esim.slotindex
     * @type {IReference<Integer>} 
     */
    SlotIndex {
        get => this.get_SlotIndex()
    }

    /**
     * Occurs when the collection of eSIM profiles changes, or when a property of one of the profiles in the collection changes.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @type {TypedEventHandler<ESim, IInspectable>}
    */
    OnProfileChanged {
        get {
            if(!this.HasProp("__OnProfileChanged")){
                this.__OnProfileChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9ca277db-fe42-53b1-ae3b-098e51fa6a9b}"),
                    ESim,
                    IInspectable
                )
                this.__OnProfileChangedToken := this.add_ProfileChanged(this.__OnProfileChanged.iface)
            }
            return this.__OnProfileChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnProfileChangedToken")) {
            this.remove_ProfileChanged(this.__OnProfileChangedToken)
            this.__OnProfileChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_AvailableMemoryInBytes() {
        if (!this.HasProp("__IESim")) {
            if ((queryResult := this.QueryInterface(IESim.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESim := IESim(outPtr)
        }

        return this.__IESim.get_AvailableMemoryInBytes()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Eid() {
        if (!this.HasProp("__IESim")) {
            if ((queryResult := this.QueryInterface(IESim.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESim := IESim(outPtr)
        }

        return this.__IESim.get_Eid()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FirmwareVersion() {
        if (!this.HasProp("__IESim")) {
            if ((queryResult := this.QueryInterface(IESim.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESim := IESim(outPtr)
        }

        return this.__IESim.get_FirmwareVersion()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MobileBroadbandModemDeviceId() {
        if (!this.HasProp("__IESim")) {
            if ((queryResult := this.QueryInterface(IESim.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESim := IESim(outPtr)
        }

        return this.__IESim.get_MobileBroadbandModemDeviceId()
    }

    /**
     * 
     * @returns {ESimPolicy} 
     */
    get_Policy() {
        if (!this.HasProp("__IESim")) {
            if ((queryResult := this.QueryInterface(IESim.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESim := IESim(outPtr)
        }

        return this.__IESim.get_Policy()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IESim")) {
            if ((queryResult := this.QueryInterface(IESim.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESim := IESim(outPtr)
        }

        return this.__IESim.get_State()
    }

    /**
     * Gets the set of profiles stored on the eSIM.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @returns {IVectorView<ESimProfile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esim.getprofiles
     */
    GetProfiles() {
        if (!this.HasProp("__IESim")) {
            if ((queryResult := this.QueryInterface(IESim.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESim := IESim(outPtr)
        }

        return this.__IESim.GetProfiles()
    }

    /**
     * Asynchronously deletes the specified eSIM profile.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @param {HSTRING} profileId The identification number (an ICCID) of the eSIM profile to delete.
     * @returns {IAsyncOperation<ESimOperationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esim.deleteprofileasync
     */
    DeleteProfileAsync(profileId) {
        if (!this.HasProp("__IESim")) {
            if ((queryResult := this.QueryInterface(IESim.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESim := IESim(outPtr)
        }

        return this.__IESim.DeleteProfileAsync(profileId)
    }

    /**
     * Asynchronously downloads installation metadata for the eSIM profile that corresponds to the specified activation code.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @param {HSTRING} activationCode The activation code for the eSIM profile installation metadata to download.
     * @returns {IAsyncOperation<ESimDownloadProfileMetadataResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esim.downloadprofilemetadataasync
     */
    DownloadProfileMetadataAsync(activationCode) {
        if (!this.HasProp("__IESim")) {
            if ((queryResult := this.QueryInterface(IESim.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESim := IESim(outPtr)
        }

        return this.__IESim.DownloadProfileMetadataAsync(activationCode)
    }

    /**
     * Asynchronously resets the eSIM.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @returns {IAsyncOperation<ESimOperationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esim.resetasync
     */
    ResetAsync() {
        if (!this.HasProp("__IESim")) {
            if ((queryResult := this.QueryInterface(IESim.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESim := IESim(outPtr)
        }

        return this.__IESim.ResetAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<ESim, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ProfileChanged(handler) {
        if (!this.HasProp("__IESim")) {
            if ((queryResult := this.QueryInterface(IESim.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESim := IESim(outPtr)
        }

        return this.__IESim.add_ProfileChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ProfileChanged(token) {
        if (!this.HasProp("__IESim")) {
            if ((queryResult := this.QueryInterface(IESim.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESim := IESim(outPtr)
        }

        return this.__IESim.remove_ProfileChanged(token)
    }

    /**
     * Performs an eSIM profile discovery operation using the default SMDS address.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @remarks
     * The profile discovery operation involves contacting a remote server. That server can be either the discovery server whose address is preset in the eSIM, or a server address provided by a mobile operator (MO). The server can return a list of events that contain the information of the next server hop, or it can download a profile metadata. Once your application gets the profile metadata, you can choose to install or reject the profile based on your own business logic. Profile discovery is serial, meaning that until your application makes the installation decision for the current profile, it is not allowed to discover other profiles.
     * 
     * For each hop, your application must visit the hop to know which type of data is returned by the server. However, profile metadata can have download time limits. Thus, your application should avoid unnecessary download of other profile metadata if it has some hint of where the profile of interest should be.
     * @returns {ESimDiscoverResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esim.discover
     */
    Discover() {
        if (!this.HasProp("__IESim2")) {
            if ((queryResult := this.QueryInterface(IESim2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESim2 := IESim2(outPtr)
        }

        return this.__IESim2.Discover()
    }

    /**
     * Performs an eSIM profile discovery operation using the default SMDS address.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @remarks
     * The profile discovery operation involves contacting a remote server. That server can be either the discovery server whose address is preset in the eSIM, or a server address provided by a mobile operator (MO). The server can return a list of events that contain the information of the next server hop, or it can download a profile metadata. Once your application gets the profile metadata, you can choose to install or reject the profile based on your own business logic. Profile discovery is serial, meaning that until your application makes the installation decision for the current profile, it is not allowed to discover other profiles.
     * 
     * For each hop, your application must visit the hop to know which type of data is returned by the server. However, profile metadata can have download time limits. Thus, your application should avoid unnecessary download of other profile metadata if it has some hint of where the profile of interest should be.
     * @param {HSTRING} serverAddress 
     * @param {HSTRING} matchingId 
     * @returns {ESimDiscoverResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esim.discover
     */
    DiscoverWithServerAddressAndMatchingId(serverAddress, matchingId) {
        if (!this.HasProp("__IESim2")) {
            if ((queryResult := this.QueryInterface(IESim2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESim2 := IESim2(outPtr)
        }

        return this.__IESim2.DiscoverWithServerAddressAndMatchingId(serverAddress, matchingId)
    }

    /**
     * Asynchronously performs an eSIM profile discovery operation using the default SMDS address.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @remarks
     * See [Discover](esim_discover_155072993.md) for more info.
     * @returns {IAsyncOperation<ESimDiscoverResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esim.discoverasync
     */
    DiscoverAsync() {
        if (!this.HasProp("__IESim2")) {
            if ((queryResult := this.QueryInterface(IESim2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESim2 := IESim2(outPtr)
        }

        return this.__IESim2.DiscoverAsync()
    }

    /**
     * Asynchronously performs an eSIM profile discovery operation using the default SMDS address.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @remarks
     * See [Discover](esim_discover_155072993.md) for more info.
     * @param {HSTRING} serverAddress 
     * @param {HSTRING} matchingId 
     * @returns {IAsyncOperation<ESimDiscoverResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esim.discoverasync
     */
    DiscoverWithServerAddressAndMatchingIdAsync(serverAddress, matchingId) {
        if (!this.HasProp("__IESim2")) {
            if ((queryResult := this.QueryInterface(IESim2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESim2 := IESim2(outPtr)
        }

        return this.__IESim2.DiscoverWithServerAddressAndMatchingIdAsync(serverAddress, matchingId)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_SlotIndex() {
        if (!this.HasProp("__IESim3")) {
            if ((queryResult := this.QueryInterface(IESim3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESim3 := IESim3(outPtr)
        }

        return this.__IESim3.get_SlotIndex()
    }

;@endregion Instance Methods
}
