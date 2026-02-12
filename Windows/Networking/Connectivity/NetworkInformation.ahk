#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INetworkInformationStatics2.ahk
#Include .\INetworkInformationStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to network connection information for the local machine.
 * @remarks
 * NetworkInformation provides static methods to query network connectivity state and monitor changes:
 * 
 * * Call [NetworkInformation.GetInternetConnectionProfile](networkinformation_getinternetconnectionprofile_255647281.md) to get the current active connection profile (may return null if offline).
 * * Call [NetworkInformation.FindConnectionProfilesAsync](networkinformation_findconnectionprofilesasync_358252851.md) with a
 *   [ConnectionProfileFilter](connectionprofilefilter.md) to enumerate additional profiles (for example, other WLAN interfaces,
 *   WWAN, or prior connections).
 * * Subscribe to the [NetworkInformation.NetworkStatusChanged](networkinformation_networkstatuschanged.md) event to be notified when connectivity changes instead of polling.
 * 
 * The returned [ConnectionProfile](connectionprofile.md) instances expose cost, data plan, adapter, and technology-specific
 * detail objects ([WlanConnectionProfileDetails](wlanconnectionprofiledetails.md),
 * [WwanConnectionProfileDetails](wwanconnectionprofiledetails.md)). Always re-query inside the status changed event handler
 * because previously cached profile objects are not live-updating.
 * 
 * For examples of how `NetworkInformation` class methods are implemented, see the
 * [NetworkConnectivity sample](https://github.com/microsoft/Windows-universal-samples/tree/main/Samples/NetworkConnectivity).
 * 
 * Use this class to:
 * 
 * * Retrieve LAN/WLAN/WWAN specific details (for example, WlanConnectionProfileDetails, WwanConnectionProfileDetails).
 * * Obtain localized names or signal / data plan information through the associated profile objects.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkinformation
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class NetworkInformation extends IInspectable {
;@region Static Methods
    /**
     * Returns an array of [ConnectionProfile](connectionprofile.md) objects that match the filtering criteria defined by [ConnectionProfileFilter](connectionprofilefilter.md).
     * @param {ConnectionProfileFilter} pProfileFilter Provides the filtering criteria.
     * @returns {IAsyncOperation<IVectorView<ConnectionProfile>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkinformation.findconnectionprofilesasync
     */
    static FindConnectionProfilesAsync(pProfileFilter) {
        if (!NetworkInformation.HasProp("__INetworkInformationStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Connectivity.NetworkInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INetworkInformationStatics2.IID)
            NetworkInformation.__INetworkInformationStatics2 := INetworkInformationStatics2(factoryPtr)
        }

        return NetworkInformation.__INetworkInformationStatics2.FindConnectionProfilesAsync(pProfileFilter)
    }

    /**
     * Enumerates all connection profiles (active or not) currently known to the system for the local machine.
     * @returns {IVectorView<ConnectionProfile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkinformation.getconnectionprofiles
     */
    static GetConnectionProfiles() {
        if (!NetworkInformation.HasProp("__INetworkInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Connectivity.NetworkInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INetworkInformationStatics.IID)
            NetworkInformation.__INetworkInformationStatics := INetworkInformationStatics(factoryPtr)
        }

        return NetworkInformation.__INetworkInformationStatics.GetConnectionProfiles()
    }

    /**
     * Retrieves the connection profile associated with the *preferred* interface currently used by the local machine.
     * The *preferred* interface is the one most likely to send or receive internet traffic.
     * This means that the returned profile might or might not have internet access.
     * @remarks
     * To be notified of changes in connectivity, register a handler with the [NetworkStatusChanged](networkinformation_networkstatuschanged.md) event. When a notification is received of a network status change, call the `GetInternetConnectionProfile` method to get the current connection profile which can then be stored for later use when needed.
     * 
     * The following example demonstrates how to retrieve a [ConnectionProfile](connectionprofile.md). The function calls `GetInternetConnectionProfile` to retrieve the [ConnectionProfile](connectionprofile.md) representing the connection currently most likely used for internet connectivity. Alternatively, your app can call [GetConnectionProfiles](networkinformation_getconnectionprofiles_582657984.md) to retrieve all available connections on a device.
     * 
     * > [!NOTE]
     * > For the implementation of the helper shown in the code below, and for additional examples of how [NetworkInformation](networkinformation.md) class methods are implemented to retrieve connection profiles, see the
     * > [NetworkConnectivity sample](https://github.com/microsoft/Windows-universal-samples/tree/main/Samples/NetworkConnectivity).
     * 
     * ```csharp
     * using Windows.Networking.Connectivity;
     * 
     * // Retrieve the ConnectionProfile.
     * ConnectionProfile internetConnectionProfile = NetworkInformation.GetInternetConnectionProfile();
     * 
     * // Pass the returned object to a function that accesses the connection data.
     * string connectionProfileInfo = GetConnectionProfileInfo(internetConnectionProfile);
     * ```
     * 
     * ```cppwinrt
     * @returns {ConnectionProfile} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkinformation.getinternetconnectionprofile
     */
    static GetInternetConnectionProfile() {
        if (!NetworkInformation.HasProp("__INetworkInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Connectivity.NetworkInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INetworkInformationStatics.IID)
            NetworkInformation.__INetworkInformationStatics := INetworkInformationStatics(factoryPtr)
        }

        return NetworkInformation.__INetworkInformationStatics.GetInternetConnectionProfile()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Gets an array of [LanIdentifier](lanidentifier.md) objects that contain locality information for each [NetworkAdapter](networkadapter.md) object that currently connected to a network.
     * @remarks
     * Use this method when you need link layer metadata, such as wired chassis and port identifiers or Wi-Fi BSSID values, to
     * correlate connectivity with diagnostics or enterprise provisioning tasks. Access the returned `LanIdentifier` instances
     * to inspect [LanIdentifier.InfrastructureId](lanidentifier_infrastructureid.md), [LanIdentifier.PortId](lanidentifier_portid.md), and
     * [LanIdentifier.NetworkAdapterId](lanidentifier_networkadapterid.md).
     * @returns {IVectorView<LanIdentifier>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkinformation.getlanidentifiers
     */
    static GetLanIdentifiers() {
        if (!NetworkInformation.HasProp("__INetworkInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Connectivity.NetworkInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INetworkInformationStatics.IID)
            NetworkInformation.__INetworkInformationStatics := INetworkInformationStatics(factoryPtr)
        }

        return NetworkInformation.__INetworkInformationStatics.GetLanIdentifiers()
    }

    /**
     * Gets a list of host names associated with the local machine.
     * @returns {IVectorView<HostName>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkinformation.gethostnames
     */
    static GetHostNames() {
        if (!NetworkInformation.HasProp("__INetworkInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Connectivity.NetworkInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INetworkInformationStatics.IID)
            NetworkInformation.__INetworkInformationStatics := INetworkInformationStatics(factoryPtr)
        }

        return NetworkInformation.__INetworkInformationStatics.GetHostNames()
    }

    /**
     * Gets proxy configuration for a connection using the specified URI.
     * @remarks
     * The *uri* parameter passed to the GetProxyConfigurationAsync method should contain a hostname or IP address for the target endpoint and service name, port number, or protocol scheme.
     * 
     * If the GetProxyConfigurationAsync method is successful, a [ProxyConfiguration](proxyconfiguration.md) object for the specified *uri* parameter is returned by the [IAsyncOperation(ProxyConfiguration)](../windows.foundation/iasyncoperation_1.md) handler.
     * 
     * In a UWP app, the [StreamSocket](../windows.networking.sockets/streamsocket.md) class supports connecting to a remote endpoint when proxies are required to complete the connection. This support for proxies is automatic and transparent to the app. For more detailed information, see the remarks on *Support for proxies* in the [StreamSocket](../windows.networking.sockets/streamsocket.md) class reference.
     * @param {Uri} uri_ The proxy configuration URI.
     * @returns {IAsyncOperation<ProxyConfiguration>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkinformation.getproxyconfigurationasync
     */
    static GetProxyConfigurationAsync(uri_) {
        if (!NetworkInformation.HasProp("__INetworkInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Connectivity.NetworkInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INetworkInformationStatics.IID)
            NetworkInformation.__INetworkInformationStatics := INetworkInformationStatics(factoryPtr)
        }

        return NetworkInformation.__INetworkInformationStatics.GetProxyConfigurationAsync(uri_)
    }

    /**
     * Gets a sorted list of [EndpointPair](../windows.networking/endpointpair.md) objects.
     * @param {IIterable<EndpointPair>} destinationList_ A list of [EndpointPair](../windows.networking/endpointpair.md) objects to be sorted.
     * @param {Integer} sortOptions Indicates sorting options for the returned array.
     * @returns {IVectorView<EndpointPair>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkinformation.getsortedendpointpairs
     */
    static GetSortedEndpointPairs(destinationList_, sortOptions) {
        if (!NetworkInformation.HasProp("__INetworkInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Connectivity.NetworkInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INetworkInformationStatics.IID)
            NetworkInformation.__INetworkInformationStatics := INetworkInformationStatics(factoryPtr)
        }

        return NetworkInformation.__INetworkInformationStatics.GetSortedEndpointPairs(destinationList_, sortOptions)
    }

    /**
     * 
     * @param {NetworkStatusChangedEventHandler} networkStatusHandler 
     * @returns {EventRegistrationToken} 
     */
    static add_NetworkStatusChanged(networkStatusHandler) {
        if (!NetworkInformation.HasProp("__INetworkInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Connectivity.NetworkInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INetworkInformationStatics.IID)
            NetworkInformation.__INetworkInformationStatics := INetworkInformationStatics(factoryPtr)
        }

        return NetworkInformation.__INetworkInformationStatics.add_NetworkStatusChanged(networkStatusHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    static remove_NetworkStatusChanged(eventCookie) {
        if (!NetworkInformation.HasProp("__INetworkInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Connectivity.NetworkInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INetworkInformationStatics.IID)
            NetworkInformation.__INetworkInformationStatics := INetworkInformationStatics(factoryPtr)
        }

        return NetworkInformation.__INetworkInformationStatics.remove_NetworkStatusChanged(eventCookie)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
