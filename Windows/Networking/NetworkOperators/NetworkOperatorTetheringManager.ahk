#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INetworkOperatorTetheringManager.ahk
#Include .\INetworkOperatorTetheringClientManager.ahk
#Include .\INetworkOperatorTetheringManager2.ahk
#Include .\INetworkOperatorTetheringManagerStatics.ahk
#Include .\INetworkOperatorTetheringManagerStatics3.ahk
#Include .\INetworkOperatorTetheringManagerStatics4.ahk
#Include .\INetworkOperatorTetheringManagerStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * This interface exposes the methods and properties used to control and configure tethering capabilities for a specific network account.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class NetworkOperatorTetheringManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INetworkOperatorTetheringManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INetworkOperatorTetheringManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Indicates if a device is capable of creating a tethering network. Possible values are defined by [TetheringCapability](tetheringcapability.md).
     * @remarks
     * Always call GetTetheringCapability prior to the creation of the tethering network using [CreateFromNetworkAccountId](mobilebroadbandaccount_createfromnetworkaccountid_2015090244.md) to first confirm that the system is capable of creating a tethering network.
     * @param {HSTRING} networkAccountId The network account ID.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager.gettetheringcapability
     */
    static GetTetheringCapability(networkAccountId) {
        if (!NetworkOperatorTetheringManager.HasProp("__INetworkOperatorTetheringManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.NetworkOperatorTetheringManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INetworkOperatorTetheringManagerStatics.IID)
            NetworkOperatorTetheringManager.__INetworkOperatorTetheringManagerStatics := INetworkOperatorTetheringManagerStatics(factoryPtr)
        }

        return NetworkOperatorTetheringManager.__INetworkOperatorTetheringManagerStatics.GetTetheringCapability(networkAccountId)
    }

    /**
     * Creates an instance of [NetworkOperatorTetheringManager](networkoperatortetheringmanager.md) for a specific network account using the provided network account ID for the mobile broadband device.
     * 
     * A network account is one of the mobile operator accounts available on the device (configured when the user inserts a SIM). You can retrieve a list of the IDs of the network accounts available on a device by accessing the [MobileBroadbandAccount.AvailableNetworkAccountIds](/uwp/api/windows.networking.networkoperators.mobilebroadbandaccount.availablenetworkaccountids) property.
     * @remarks
     * Always call [GetTetheringCapability](networkoperatortetheringmanager_gettetheringcapability_1651407752.md) prior to the creation of the tethering network using [CreateFromNetworkAccountId](mobilebroadbandaccount_createfromnetworkaccountid_2015090244.md) to first confirm that the system is capable of creating a tethering network.
     * @param {HSTRING} networkAccountId The network account ID.
     * @returns {NetworkOperatorTetheringManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager.createfromnetworkaccountid
     */
    static CreateFromNetworkAccountId(networkAccountId) {
        if (!NetworkOperatorTetheringManager.HasProp("__INetworkOperatorTetheringManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.NetworkOperatorTetheringManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INetworkOperatorTetheringManagerStatics.IID)
            NetworkOperatorTetheringManager.__INetworkOperatorTetheringManagerStatics := INetworkOperatorTetheringManagerStatics(factoryPtr)
        }

        return NetworkOperatorTetheringManager.__INetworkOperatorTetheringManagerStatics.CreateFromNetworkAccountId(networkAccountId)
    }

    /**
     * Creates a [NetworkOperatorTetheringManager](networkoperatortetheringmanager.md) using the given profile as the public interface and Wi-Fi as the private interface.
     * @remarks
     * In previous releases, only privileged apps from network operators could create a [NetworkOperatorTetheringManager](networkoperatortetheringmanager.md) object and use it to control tethering. In this release, any app can create the object by calling CreateFromConnectionProfile. In order for the call to succeed, however, the app must have the appropriate Wi-Fi control device capability declared in its manifest. The following example shows part of a manifest with the necessary **DeviceCapability** tag, with the **wiFiControl** attribute.
     * 
     * 
     * 
     * ```xml
     * <Capabilities>
     *   <DeviceCapability Name="wiFiControl"/>
     * </Capabilities>
     * 
     * ```
     * 
     * If the **wiFiControl** device capability is not set in the manifest, then calls to CreateFromConnectionProfile fail by throwing an exception.
     * 
     * Your code can determine whether the capability is set at runtime by calling [GetTetheringCapabilityFromConnectionProfile](networkoperatortetheringmanager_gettetheringcapabilityfromconnectionprofile_854560136.md). If **DisabledBySystemCapability** is returned, then the manifest does not set the required device capability. Note that even if **Enabled** is returned, your code should be written to handle errors and exceptions, since tethering capability can change at any time, outside your app's control or notice.
     * @param {ConnectionProfile} profile_ Connection profile to be used.
     * @param {NetworkAdapter} adapter_ 
     * @returns {NetworkOperatorTetheringManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager.createfromconnectionprofile
     */
    static CreateFromConnectionProfileWithTargetAdapter(profile_, adapter_) {
        if (!NetworkOperatorTetheringManager.HasProp("__INetworkOperatorTetheringManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.NetworkOperatorTetheringManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INetworkOperatorTetheringManagerStatics3.IID)
            NetworkOperatorTetheringManager.__INetworkOperatorTetheringManagerStatics3 := INetworkOperatorTetheringManagerStatics3(factoryPtr)
        }

        return NetworkOperatorTetheringManager.__INetworkOperatorTetheringManagerStatics3.CreateFromConnectionProfileWithTargetAdapter(profile_, adapter_)
    }

    /**
     * Gets a value indicating whether the *NoConnections* timeout is enabled. If enabled, tethering turns off automatically in 5 minutes after the last peer of the tethering connection goes away.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager.isnoconnectionstimeoutenabled
     */
    static IsNoConnectionsTimeoutEnabled() {
        if (!NetworkOperatorTetheringManager.HasProp("__INetworkOperatorTetheringManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.NetworkOperatorTetheringManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INetworkOperatorTetheringManagerStatics4.IID)
            NetworkOperatorTetheringManager.__INetworkOperatorTetheringManagerStatics4 := INetworkOperatorTetheringManagerStatics4(factoryPtr)
        }

        return NetworkOperatorTetheringManager.__INetworkOperatorTetheringManagerStatics4.IsNoConnectionsTimeoutEnabled()
    }

    /**
     * Enables the *NoConnections* timeout. This means that tethering turns off automatically in 5 minutes after the last peer of the tethering connection goes away.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager.enablenoconnectionstimeout
     */
    static EnableNoConnectionsTimeout() {
        if (!NetworkOperatorTetheringManager.HasProp("__INetworkOperatorTetheringManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.NetworkOperatorTetheringManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INetworkOperatorTetheringManagerStatics4.IID)
            NetworkOperatorTetheringManager.__INetworkOperatorTetheringManagerStatics4 := INetworkOperatorTetheringManagerStatics4(factoryPtr)
        }

        return NetworkOperatorTetheringManager.__INetworkOperatorTetheringManagerStatics4.EnableNoConnectionsTimeout()
    }

    /**
     * Asynchronously enables the *NoConnections* timeout. This means that tethering turns off automatically in 5 minutes after the last peer of the tethering connection goes away.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager.enablenoconnectionstimeoutasync
     */
    static EnableNoConnectionsTimeoutAsync() {
        if (!NetworkOperatorTetheringManager.HasProp("__INetworkOperatorTetheringManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.NetworkOperatorTetheringManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INetworkOperatorTetheringManagerStatics4.IID)
            NetworkOperatorTetheringManager.__INetworkOperatorTetheringManagerStatics4 := INetworkOperatorTetheringManagerStatics4(factoryPtr)
        }

        return NetworkOperatorTetheringManager.__INetworkOperatorTetheringManagerStatics4.EnableNoConnectionsTimeoutAsync()
    }

    /**
     * Disables the *NoConnections* timeout.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager.disablenoconnectionstimeout
     */
    static DisableNoConnectionsTimeout() {
        if (!NetworkOperatorTetheringManager.HasProp("__INetworkOperatorTetheringManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.NetworkOperatorTetheringManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INetworkOperatorTetheringManagerStatics4.IID)
            NetworkOperatorTetheringManager.__INetworkOperatorTetheringManagerStatics4 := INetworkOperatorTetheringManagerStatics4(factoryPtr)
        }

        return NetworkOperatorTetheringManager.__INetworkOperatorTetheringManagerStatics4.DisableNoConnectionsTimeout()
    }

    /**
     * Asynchronously disables the *NoConnections* timeout.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager.disablenoconnectionstimeoutasync
     */
    static DisableNoConnectionsTimeoutAsync() {
        if (!NetworkOperatorTetheringManager.HasProp("__INetworkOperatorTetheringManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.NetworkOperatorTetheringManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INetworkOperatorTetheringManagerStatics4.IID)
            NetworkOperatorTetheringManager.__INetworkOperatorTetheringManagerStatics4 := INetworkOperatorTetheringManagerStatics4(factoryPtr)
        }

        return NetworkOperatorTetheringManager.__INetworkOperatorTetheringManagerStatics4.DisableNoConnectionsTimeoutAsync()
    }

    /**
     * Gets tethering capabilities, based on the given connection profile.
     * @param {ConnectionProfile} profile_ Connection profile to be checked.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager.gettetheringcapabilityfromconnectionprofile
     */
    static GetTetheringCapabilityFromConnectionProfile(profile_) {
        if (!NetworkOperatorTetheringManager.HasProp("__INetworkOperatorTetheringManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.NetworkOperatorTetheringManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INetworkOperatorTetheringManagerStatics2.IID)
            NetworkOperatorTetheringManager.__INetworkOperatorTetheringManagerStatics2 := INetworkOperatorTetheringManagerStatics2(factoryPtr)
        }

        return NetworkOperatorTetheringManager.__INetworkOperatorTetheringManagerStatics2.GetTetheringCapabilityFromConnectionProfile(profile_)
    }

    /**
     * Creates a [NetworkOperatorTetheringManager](networkoperatortetheringmanager.md) using the given profile as the public interface, and on the given [NetworkAdapter](../windows.networking.connectivity/networkadapter.md) as the private interface.
     * @remarks
     * In previous releases, only privileged apps from network operators could create a [NetworkOperatorTetheringManager](networkoperatortetheringmanager.md) object and use it to control tethering. In this release, any app can create the object by calling [CreateFromConnectionProfile](networkoperatortetheringmanager_createfromconnectionprofile_195211386.md). In order for the call to succeed, however, the app must have the appropriate Wi-Fi control device capability declared in its manifest. The following example shows part of a manifest with the necessary **DeviceCapability** tag, with the **wiFiControl** attribute.
     * 
     * 
     * 
     * ```xml
     * <Capabilities>
     *   <DeviceCapability Name="wiFiControl"/>
     * </Capabilities>
     * 
     * ```
     * 
     * If the **wiFiControl** device capability is not set in the manifest, then calls to [CreateFromConnectionProfile](networkoperatortetheringmanager_createfromconnectionprofile_195211386.md) fail by throwing an exception.
     * 
     * Your code can determine whether the capability is set at runtime by calling [GetTetheringCapabilityFromConnectionProfile](networkoperatortetheringmanager_gettetheringcapabilityfromconnectionprofile_854560136.md). If **DisabledBySystemCapability** is returned, then the manifest does not set the required device capability. Note that even if **Enabled** is returned, your code should be written to handle errors and exceptions, since tethering capability can change at any time, outside your app's control or notice.
     * @param {ConnectionProfile} profile_ Connection profile to be used.
     * @returns {NetworkOperatorTetheringManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager.createfromconnectionprofile
     */
    static CreateFromConnectionProfile(profile_) {
        if (!NetworkOperatorTetheringManager.HasProp("__INetworkOperatorTetheringManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.NetworkOperatorTetheringManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INetworkOperatorTetheringManagerStatics2.IID)
            NetworkOperatorTetheringManager.__INetworkOperatorTetheringManagerStatics2 := INetworkOperatorTetheringManagerStatics2(factoryPtr)
        }

        return NetworkOperatorTetheringManager.__INetworkOperatorTetheringManagerStatics2.CreateFromConnectionProfile(profile_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the maximum number of client connections over a tethered network.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager.maxclientcount
     * @type {Integer} 
     */
    MaxClientCount {
        get => this.get_MaxClientCount()
    }

    /**
     * Gets the current number of connected clients on the tethering network.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager.clientcount
     * @type {Integer} 
     */
    ClientCount {
        get => this.get_ClientCount()
    }

    /**
     * Gets the current operational state of the tethering feature. Possible values are defined by [TetheringOperationalState](tetheringoperationalstate.md)
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager.tetheringoperationalstate
     * @type {Integer} 
     */
    TetheringOperationalState {
        get => this.get_TetheringOperationalState()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxClientCount() {
        if (!this.HasProp("__INetworkOperatorTetheringManager")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringManager := INetworkOperatorTetheringManager(outPtr)
        }

        return this.__INetworkOperatorTetheringManager.get_MaxClientCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ClientCount() {
        if (!this.HasProp("__INetworkOperatorTetheringManager")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringManager := INetworkOperatorTetheringManager(outPtr)
        }

        return this.__INetworkOperatorTetheringManager.get_ClientCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TetheringOperationalState() {
        if (!this.HasProp("__INetworkOperatorTetheringManager")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringManager := INetworkOperatorTetheringManager(outPtr)
        }

        return this.__INetworkOperatorTetheringManager.get_TetheringOperationalState()
    }

    /**
     * Gets the current access point configuration for a network account as defined by a [NetworkOperatorTetheringAccessPointConfiguration](networkoperatortetheringaccesspointconfiguration.md) object.
     * @returns {NetworkOperatorTetheringAccessPointConfiguration} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager.getcurrentaccesspointconfiguration
     */
    GetCurrentAccessPointConfiguration() {
        if (!this.HasProp("__INetworkOperatorTetheringManager")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringManager := INetworkOperatorTetheringManager(outPtr)
        }

        return this.__INetworkOperatorTetheringManager.GetCurrentAccessPointConfiguration()
    }

    /**
     * Use this method to provide tethering network configuration details for the tethering network.
     * @param {NetworkOperatorTetheringAccessPointConfiguration} configuration Provides an SSID (to be used for the tethering network), and specifies the passphrase used for authentication when establishing a tethered network connection.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager.configureaccesspointasync
     */
    ConfigureAccessPointAsync(configuration) {
        if (!this.HasProp("__INetworkOperatorTetheringManager")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringManager := INetworkOperatorTetheringManager(outPtr)
        }

        return this.__INetworkOperatorTetheringManager.ConfigureAccessPointAsync(configuration)
    }

    /**
     * Starts the mobile hotspot using a specified per-session configuration.
     * 
     * This overload allows you to start a tethering session without having to pre-configure it via [ConfigureAccessPointAsync](./networkoperatortetheringmanager_configureaccesspointasync_1399951422.md). The configuration passed as a parameter is valid only for the current session, and will be lost once the session has ended.
     * 
     * Starting a new session via this overload of **StartTetheringAsync** also allows you to configure per-session-only parameters that can't be persistently set via **ConfigureAccessPointAsync**. Parameters that *can* be persisted are the network SSID, the network password, the network wireless frequency band, and the network authentication algorithm.
     * 
     * We recommended that you first call [StopTetheringAsync](./networkoperatortetheringmanager_stoptetheringasync_1234797808.md) in order to ensure that the tethering hotspot is off.
     * @returns {IAsyncOperation<NetworkOperatorTetheringOperationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager.starttetheringasync
     */
    StartTetheringAsync() {
        if (!this.HasProp("__INetworkOperatorTetheringManager")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringManager := INetworkOperatorTetheringManager(outPtr)
        }

        return this.__INetworkOperatorTetheringManager.StartTetheringAsync()
    }

    /**
     * Shuts down the tethering network.
     * @returns {IAsyncOperation<NetworkOperatorTetheringOperationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager.stoptetheringasync
     */
    StopTetheringAsync() {
        if (!this.HasProp("__INetworkOperatorTetheringManager")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringManager := INetworkOperatorTetheringManager(outPtr)
        }

        return this.__INetworkOperatorTetheringManager.StopTetheringAsync()
    }

    /**
     * Retrieves a list of tethering clients for this [NetworkOperatorTetheringManager](networkoperatortetheringmanager.md).
     * @returns {IVectorView<NetworkOperatorTetheringClient>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager.gettetheringclients
     */
    GetTetheringClients() {
        if (!this.HasProp("__INetworkOperatorTetheringClientManager")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringClientManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringClientManager := INetworkOperatorTetheringClientManager(outPtr)
        }

        return this.__INetworkOperatorTetheringClientManager.GetTetheringClients()
    }

    /**
     * Establishes the tethering network.
     * 
     * We recommended that you first call [StopTetheringAsync](./networkoperatortetheringmanager_stoptetheringasync_1234797808.md) in order to ensure that the tethering hotspot is off.
     * @param {NetworkOperatorTetheringSessionAccessPointConfiguration} configuration 
     * @returns {IAsyncOperation<NetworkOperatorTetheringOperationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager.starttetheringasync
     */
    StartTetheringAsync1(configuration) {
        if (!this.HasProp("__INetworkOperatorTetheringManager2")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringManager2 := INetworkOperatorTetheringManager2(outPtr)
        }

        return this.__INetworkOperatorTetheringManager2.StartTetheringAsync(configuration)
    }

;@endregion Instance Methods
}
