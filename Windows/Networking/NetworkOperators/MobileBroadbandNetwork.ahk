#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandNetwork.ahk
#Include .\IMobileBroadbandNetwork2.ahk
#Include .\IMobileBroadbandNetwork3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a mobile broadband network and the current network state.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandnetwork
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandNetwork extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandNetwork

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandNetwork.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the unique network interface that identifies the mobile broadband network.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandnetwork.networkadapter
     * @type {NetworkAdapter} 
     */
    NetworkAdapter {
        get => this.get_NetworkAdapter()
    }

    /**
     * Gets the current network registration state.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandnetwork.networkregistrationstate
     * @type {Integer} 
     */
    NetworkRegistrationState {
        get => this.get_NetworkRegistrationState()
    }

    /**
     * Gets the latest network registration error.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandnetwork.registrationnetworkerror
     * @type {Integer} 
     */
    RegistrationNetworkError {
        get => this.get_RegistrationNetworkError()
    }

    /**
     * Gets the latest packet attach network error.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandnetwork.packetattachnetworkerror
     * @type {Integer} 
     */
    PacketAttachNetworkError {
        get => this.get_PacketAttachNetworkError()
    }

    /**
     * Attempts to get the latest network activation error.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandnetwork.activationnetworkerror
     * @type {Integer} 
     */
    ActivationNetworkError {
        get => this.get_ActivationNetworkError()
    }

    /**
     * The name of the currently connected access point.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandnetwork.accesspointname
     * @type {HSTRING} 
     */
    AccessPointName {
        get => this.get_AccessPointName()
    }

    /**
     * Gets the data class of the current mobile network.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandnetwork.registereddataclass
     * @type {Integer} 
     */
    RegisteredDataClass {
        get => this.get_RegisteredDataClass()
    }

    /**
     * Gets the provider ID for the currently registered mobile network.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandnetwork.registeredproviderid
     * @type {HSTRING} 
     */
    RegisteredProviderId {
        get => this.get_RegisteredProviderId()
    }

    /**
     * Gets the provider name for the currently registered mobile network.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandnetwork.registeredprovidername
     * @type {HSTRING} 
     */
    RegisteredProviderName {
        get => this.get_RegisteredProviderName()
    }

    /**
     * Gets a list of all UICC apps available on the SIM card that can be used for registration on a mobile network. This list includes UICC apps that are not currently used for registration, but could potentially could be used for registration.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandnetwork.registrationuiccapps
     * @type {IVectorView<MobileBroadbandUiccApp>} 
     */
    RegistrationUiccApps {
        get => this.get_RegistrationUiccApps()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {NetworkAdapter} 
     */
    get_NetworkAdapter() {
        if (!this.HasProp("__IMobileBroadbandNetwork")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandNetwork := IMobileBroadbandNetwork(outPtr)
        }

        return this.__IMobileBroadbandNetwork.get_NetworkAdapter()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NetworkRegistrationState() {
        if (!this.HasProp("__IMobileBroadbandNetwork")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandNetwork := IMobileBroadbandNetwork(outPtr)
        }

        return this.__IMobileBroadbandNetwork.get_NetworkRegistrationState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RegistrationNetworkError() {
        if (!this.HasProp("__IMobileBroadbandNetwork")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandNetwork := IMobileBroadbandNetwork(outPtr)
        }

        return this.__IMobileBroadbandNetwork.get_RegistrationNetworkError()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PacketAttachNetworkError() {
        if (!this.HasProp("__IMobileBroadbandNetwork")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandNetwork := IMobileBroadbandNetwork(outPtr)
        }

        return this.__IMobileBroadbandNetwork.get_PacketAttachNetworkError()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActivationNetworkError() {
        if (!this.HasProp("__IMobileBroadbandNetwork")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandNetwork := IMobileBroadbandNetwork(outPtr)
        }

        return this.__IMobileBroadbandNetwork.get_ActivationNetworkError()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AccessPointName() {
        if (!this.HasProp("__IMobileBroadbandNetwork")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandNetwork := IMobileBroadbandNetwork(outPtr)
        }

        return this.__IMobileBroadbandNetwork.get_AccessPointName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RegisteredDataClass() {
        if (!this.HasProp("__IMobileBroadbandNetwork")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandNetwork := IMobileBroadbandNetwork(outPtr)
        }

        return this.__IMobileBroadbandNetwork.get_RegisteredDataClass()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RegisteredProviderId() {
        if (!this.HasProp("__IMobileBroadbandNetwork")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandNetwork := IMobileBroadbandNetwork(outPtr)
        }

        return this.__IMobileBroadbandNetwork.get_RegisteredProviderId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RegisteredProviderName() {
        if (!this.HasProp("__IMobileBroadbandNetwork")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandNetwork := IMobileBroadbandNetwork(outPtr)
        }

        return this.__IMobileBroadbandNetwork.get_RegisteredProviderName()
    }

    /**
     * Displays the connect UI for a specific mobile network.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The ShowConnectionUI method is useful if you determine that connecting to a different network is preferred due to a roaming relationship, pricing changes, and so on. For example, when your app determines that a different network is preferred, you can inform the user of the preferred network. If the user decides to change networks, you can call the ShowConnectionUI for the preferred network to complete the connection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandnetwork.showconnectionui
     */
    ShowConnectionUI() {
        if (!this.HasProp("__IMobileBroadbandNetwork")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandNetwork := IMobileBroadbandNetwork(outPtr)
        }

        return this.__IMobileBroadbandNetwork.ShowConnectionUI()
    }

    /**
     * Asynchronously retrieves a value indicating whether this network currently supports voice calls.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandnetwork.getvoicecallsupportasync
     */
    GetVoiceCallSupportAsync() {
        if (!this.HasProp("__IMobileBroadbandNetwork2")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandNetwork2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandNetwork2 := IMobileBroadbandNetwork2(outPtr)
        }

        return this.__IMobileBroadbandNetwork2.GetVoiceCallSupportAsync()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandUiccApp>} 
     */
    get_RegistrationUiccApps() {
        if (!this.HasProp("__IMobileBroadbandNetwork2")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandNetwork2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandNetwork2 := IMobileBroadbandNetwork2(outPtr)
        }

        return this.__IMobileBroadbandNetwork2.get_RegistrationUiccApps()
    }

    /**
     * Retrieves a [**MobileBroadbandCellsInfo**](mobilebroadbandcellsinfo.md) object that contains all serving and neighboring cell information when device is registered to a network.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @returns {IAsyncOperation<MobileBroadbandCellsInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandnetwork.getcellsinfoasync
     */
    GetCellsInfoAsync() {
        if (!this.HasProp("__IMobileBroadbandNetwork3")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandNetwork3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandNetwork3 := IMobileBroadbandNetwork3(outPtr)
        }

        return this.__IMobileBroadbandNetwork3.GetCellsInfoAsync()
    }

;@endregion Instance Methods
}
