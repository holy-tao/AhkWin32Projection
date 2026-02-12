#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IConnectionProfile.ahk
#Include .\IConnectionProfile2.ahk
#Include .\IConnectionProfile3.ahk
#Include .\IConnectionProfile4.ahk
#Include .\IConnectionProfile5.ahk
#Include .\IConnectionProfile6.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a network connection, including the currently connected network or prior connections.  
  * Provides information about connection status and connectivity statistics.
 * @remarks
 * ConnectionProfile represents a snapshot of a specific network interface's connectivity attributes (WLAN, WWAN,
 * Ethernet, etc.). Re-query the profile when you receive a network status change event because cached profile objects
 * may be obsolete or contain stale properties.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class ConnectionProfile extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IConnectionProfile

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IConnectionProfile.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the connection profile.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.profilename
     * @type {HSTRING} 
     */
    ProfileName {
        get => this.get_ProfileName()
    }

    /**
     * Gets the object representing the network adapter providing connectivity for the connection.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.networkadapter
     * @type {NetworkAdapter} 
     */
    NetworkAdapter {
        get => this.get_NetworkAdapter()
    }

    /**
     * Retrieves the security settings for the network.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.networksecuritysettings
     * @type {NetworkSecuritySettings} 
     */
    NetworkSecuritySettings {
        get => this.get_NetworkSecuritySettings()
    }

    /**
     * Gets a value that indicates if connection profile is a WWAN (mobile) connection. This determines whether or not [WwanConnectionProfileDetails](connectionprofile_wwanconnectionprofiledetails.md) is null.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.iswwanconnectionprofile
     * @type {Boolean} 
     */
    IsWwanConnectionProfile {
        get => this.get_IsWwanConnectionProfile()
    }

    /**
     * Gets a value that indicates if connection profile is a WLAN (WiFi) connection. This determines whether or not [WlanConnectionProfileDetails](connectionprofile_wlanconnectionprofiledetails.md) is null.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.iswlanconnectionprofile
     * @type {Boolean} 
     */
    IsWlanConnectionProfile {
        get => this.get_IsWlanConnectionProfile()
    }

    /**
     * Gets a [WwanConnectionProfileDetails](wwanconnectionprofiledetails.md) object containing the properties and methods used to retrieve information specific to mobile broadband connections.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.wwanconnectionprofiledetails
     * @type {WwanConnectionProfileDetails} 
     */
    WwanConnectionProfileDetails {
        get => this.get_WwanConnectionProfileDetails()
    }

    /**
     * Gets a [WlanConnectionProfileDetails](wlanconnectionprofiledetails.md) object that provides a method for retrieving information specific to a WLAN (WiFi) connection.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.wlanconnectionprofiledetails
     * @type {WlanConnectionProfileDetails} 
     */
    WlanConnectionProfileDetails {
        get => this.get_WlanConnectionProfileDetails()
    }

    /**
     * Gets the ID of the network operator who provisioned the connection profile.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.serviceproviderguid
     * @type {IReference<Guid>} 
     */
    ServiceProviderGuid {
        get => this.get_ServiceProviderGuid()
    }

    /**
     * Gets a value that indicates whether or not it is possible to delete this connection profile. This can help determine whether [TryDeleteAsync](connectionprofile_trydeleteasync_41251962.md) is likely to succeed.
     * @remarks
     * If you're unable to delete a connection profile, then that might be due to policies that have been configured by a network administrator. Also, you may need to configure additional capabilities in order to delete certain types of connection profiles. For Wi-Fi connection profiles, the wiFiControl capability is needed. Calling [WiFiAdapter.RequestAccessAsync](../windows.devices.wifi/wifiadapter_requestaccessasync_380675631.md) prior to attempting to delete any Wi-Fi connection profiles may allow additional connection profiles to be deleted.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.candelete
     * @type {Boolean} 
     */
    CanDelete {
        get => this.get_CanDelete()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProfileName() {
        if (!this.HasProp("__IConnectionProfile")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile := IConnectionProfile(outPtr)
        }

        return this.__IConnectionProfile.get_ProfileName()
    }

    /**
     * Gets the network connectivity level for this connection. This value indicates what network resources, if any, are currently available.
     * @remarks
     * The GetNetworkConnectivityLevel method may take time in some cases to determine the current value of the network connectivity level. The recommended process for determining the network connectivity level is to register a handler for the [NetworkStatusChanged](networkinformation_networkstatuschanged.md) event on the [NetworkInformation](networkinformation.md) class. When a notification is received of a network status change, obtain the new connectivity level by calling the GetNetworkConnectivityLevel method on the profile returned by the [GetInternetConnectionProfile](networkinformation_getinternetconnectionprofile_255647281.md) method. The returned network connectivity level can then be stored for later use when needed. This also ensures that the correct [ConnectionProfile](connectionprofile.md) is checked.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.getnetworkconnectivitylevel
     */
    GetNetworkConnectivityLevel() {
        if (!this.HasProp("__IConnectionProfile")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile := IConnectionProfile(outPtr)
        }

        return this.__IConnectionProfile.GetNetworkConnectivityLevel()
    }

    /**
     * Retrieves names associated with the network with which the connection is currently established.
     * @returns {IVectorView<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.getnetworknames
     */
    GetNetworkNames() {
        if (!this.HasProp("__IConnectionProfile")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile := IConnectionProfile(outPtr)
        }

        return this.__IConnectionProfile.GetNetworkNames()
    }

    /**
     * Gets the cost information for the connection.
     * @returns {ConnectionCost} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.getconnectioncost
     */
    GetConnectionCost() {
        if (!this.HasProp("__IConnectionProfile")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile := IConnectionProfile(outPtr)
        }

        return this.__IConnectionProfile.GetConnectionCost()
    }

    /**
     * Gets the current status of the data plan associated with the connection.
     * @returns {DataPlanStatus} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.getdataplanstatus
     */
    GetDataPlanStatus() {
        if (!this.HasProp("__IConnectionProfile")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile := IConnectionProfile(outPtr)
        }

        return this.__IConnectionProfile.GetDataPlanStatus()
    }

    /**
     * 
     * @returns {NetworkAdapter} 
     */
    get_NetworkAdapter() {
        if (!this.HasProp("__IConnectionProfile")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile := IConnectionProfile(outPtr)
        }

        return this.__IConnectionProfile.get_NetworkAdapter()
    }

    /**
     * > [!NOTE]
     * > GetLocalUsage may be altered or unavailable for releases after Windows 8.1. Instead, use [GetNetworkUsageAsync](connectionprofile_getnetworkusageasync_665790436.md).
     * 
     * Gets the estimated data usage for a connection over a specific period of time and roaming state.
     * @param {DateTime} StartTime The start date/time for the usage data request.
     * @param {DateTime} EndTime The end date/time for the usage data request.
     * @returns {DataUsage} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.getlocalusage
     */
    GetLocalUsage(StartTime, EndTime) {
        if (!this.HasProp("__IConnectionProfile")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile := IConnectionProfile(outPtr)
        }

        return this.__IConnectionProfile.GetLocalUsage(StartTime, EndTime)
    }

    /**
     * > [!NOTE]
     * > GetLocalUsage may be altered or unavailable for releases after Windows 8.1. Instead, use [GetNetworkUsageAsync](connectionprofile_getnetworkusageasync_665790436.md).
     * 
     * Gets the estimated data usage for a connection during a specific period of time.
     * @param {DateTime} StartTime The start date/time for the usage data request.
     * @param {DateTime} EndTime The end date/time for the usage data request.
     * @param {Integer} States 
     * @returns {DataUsage} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.getlocalusage
     */
    GetLocalUsagePerRoamingStates(StartTime, EndTime, States) {
        if (!this.HasProp("__IConnectionProfile")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile := IConnectionProfile(outPtr)
        }

        return this.__IConnectionProfile.GetLocalUsagePerRoamingStates(StartTime, EndTime, States)
    }

    /**
     * 
     * @returns {NetworkSecuritySettings} 
     */
    get_NetworkSecuritySettings() {
        if (!this.HasProp("__IConnectionProfile")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile := IConnectionProfile(outPtr)
        }

        return this.__IConnectionProfile.get_NetworkSecuritySettings()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWwanConnectionProfile() {
        if (!this.HasProp("__IConnectionProfile2")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile2 := IConnectionProfile2(outPtr)
        }

        return this.__IConnectionProfile2.get_IsWwanConnectionProfile()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWlanConnectionProfile() {
        if (!this.HasProp("__IConnectionProfile2")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile2 := IConnectionProfile2(outPtr)
        }

        return this.__IConnectionProfile2.get_IsWlanConnectionProfile()
    }

    /**
     * 
     * @returns {WwanConnectionProfileDetails} 
     */
    get_WwanConnectionProfileDetails() {
        if (!this.HasProp("__IConnectionProfile2")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile2 := IConnectionProfile2(outPtr)
        }

        return this.__IConnectionProfile2.get_WwanConnectionProfileDetails()
    }

    /**
     * 
     * @returns {WlanConnectionProfileDetails} 
     */
    get_WlanConnectionProfileDetails() {
        if (!this.HasProp("__IConnectionProfile2")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile2 := IConnectionProfile2(outPtr)
        }

        return this.__IConnectionProfile2.get_WlanConnectionProfileDetails()
    }

    /**
     * 
     * @returns {IReference<Guid>} 
     */
    get_ServiceProviderGuid() {
        if (!this.HasProp("__IConnectionProfile2")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile2 := IConnectionProfile2(outPtr)
        }

        return this.__IConnectionProfile2.get_ServiceProviderGuid()
    }

    /**
     * Gets a value that indicates the current number of signal bars displayed by the Windows UI for the connection.
     * @returns {IReference<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.getsignalbars
     */
    GetSignalBars() {
        if (!this.HasProp("__IConnectionProfile2")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile2 := IConnectionProfile2(outPtr)
        }

        return this.__IConnectionProfile2.GetSignalBars()
    }

    /**
     * Gets the current domain authentication status for a network connection. Possible values are defined by [DomainConnectivityLevel](domainconnectivitylevel.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.getdomainconnectivitylevel
     */
    GetDomainConnectivityLevel() {
        if (!this.HasProp("__IConnectionProfile2")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile2 := IConnectionProfile2(outPtr)
        }

        return this.__IConnectionProfile2.GetDomainConnectivityLevel()
    }

    /**
     * Retrieves per-interval usage (bytes sent/received and connected duration) for this profile over a specified time
     * window using the requested [DataUsageGranularity](datausagegranularity.md) and optional
     * [NetworkUsageStates](networkusagestates.md) filters.
     * @remarks
     * This method returns aggregate network usage data for the connection profile over the specified time window.
     * @param {DateTime} startTime The start time over which to retrieve data. Can be no more than 60 days prior to the current time. If the specified
     * *granularity* is PerMinute, then the start time can be no more than 120 minutes prior to the current time.
     * @param {DateTime} endTime The end time over which to retrieve data.
     * This time must be later than the startTime.
     * @param {Integer} granularity The desired granularity of the returned usage statistics. Each elements in the list corresponds to the network usage
     * per the specified granularity; for example, usage per hour.
     * @param {NetworkUsageStates} states The state of the connection profile for which usage data should be returned.
     * @returns {IAsyncOperation<IVectorView<NetworkUsage>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.getnetworkusageasync
     */
    GetNetworkUsageAsync(startTime, endTime, granularity, states) {
        if (!this.HasProp("__IConnectionProfile2")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile2 := IConnectionProfile2(outPtr)
        }

        return this.__IConnectionProfile2.GetNetworkUsageAsync(startTime, endTime, granularity, states)
    }

    /**
     * Retrieves connectivity intervals (start timestamp plus duration) for this profile within the specified time window.
     * @param {DateTime} startTime The start time over which to retrieve data. Can be no more than 60 days prior to the current time.
     * @param {DateTime} endTime The end time over which to retrieve data.
     * @param {NetworkUsageStates} states The state of the connection profile for which usage data should be returned.
     * @returns {IAsyncOperation<IVectorView<ConnectivityInterval>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.getconnectivityintervalsasync
     */
    GetConnectivityIntervalsAsync(startTime, endTime, states) {
        if (!this.HasProp("__IConnectionProfile2")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile2 := IConnectionProfile2(outPtr)
        }

        return this.__IConnectionProfile2.GetConnectivityIntervalsAsync(startTime, endTime, states)
    }

    /**
     * Retrieves per-attribution (application or bucket) usage (bytes sent / received and connected duration) over a specified
     * time window with optional [NetworkUsageStates](networkusagestates.md) filtering.
     * @remarks
     * This method returns per-application (or attribution bucket) usage over the specified window.
     * 
     * For general usage API best practices (time window management, incremental collection, avoiding double counting), see [GetNetworkUsageAsync](connectionprofile_getnetworkusageasync_665790436.md).
     * @param {DateTime} startTime The start time of the usage window.
     * @param {DateTime} endTime The end time of the usage window.
     * @param {NetworkUsageStates} states The state of the connection profile for which usage data should be returned.
     * @returns {IAsyncOperation<IVectorView<AttributedNetworkUsage>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.getattributednetworkusageasync
     */
    GetAttributedNetworkUsageAsync(startTime, endTime, states) {
        if (!this.HasProp("__IConnectionProfile3")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile3 := IConnectionProfile3(outPtr)
        }

        return this.__IConnectionProfile3.GetAttributedNetworkUsageAsync(startTime, endTime, states)
    }

    /**
     * Returns the bytes sent and bytes received for each MCC and MNC combination (the combination is represented by a [ProviderId](providernetworkusage_providerid.md)).
     * @remarks
     * The returned collection contains one [ProviderNetworkUsage](providernetworkusage.md) entry per detected provider (MCC/MNC
     * combination) within the requested window. Sum the entries if you need aggregate roaming usage. The method returns an empty
     * list when no provider usage is available (for example, Wi-Fi only connections).
     * @param {DateTime} startTime The start time over which to retrieve data. Can be no more than 60 days prior to the current time.
     * @param {DateTime} endTime The end time over which to retrieve data.
     * @param {NetworkUsageStates} states The state of the connection profile for which usage data should be returned.
     * @returns {IAsyncOperation<IVectorView<ProviderNetworkUsage>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.getprovidernetworkusageasync
     */
    GetProviderNetworkUsageAsync(startTime, endTime, states) {
        if (!this.HasProp("__IConnectionProfile4")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile4 := IConnectionProfile4(outPtr)
        }

        return this.__IConnectionProfile4.GetProviderNetworkUsageAsync(startTime, endTime, states)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanDelete() {
        if (!this.HasProp("__IConnectionProfile5")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile5 := IConnectionProfile5(outPtr)
        }

        return this.__IConnectionProfile5.get_CanDelete()
    }

    /**
     * Asynchronously attempts to delete this connection profile; the operation may or may not succeed. Examine the return value to determine the outcome of the operation.
     * @remarks
     * If you're unable to delete a connection profile, then that might be due to policies that have been configured by a network administrator. Also, you may need to configure additional capabilities in order to delete certain types of connection profiles. For Wi-Fi connection profiles, the wiFiControl capability is needed. Calling [WiFiAdapter.RequestAccessAsync](../windows.devices.wifi/wifiadapter_requestaccessasync_380675631.md) prior to attempting to delete any Wi-Fi connection profiles may allow additional connection profiles to be deleted.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.trydeleteasync
     */
    TryDeleteAsync() {
        if (!this.HasProp("__IConnectionProfile5")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile5 := IConnectionProfile5(outPtr)
        }

        return this.__IConnectionProfile5.TryDeleteAsync()
    }

    /**
     * Determines whether the specified domain authentication mechanism succeeded for this connection profile.
     * @param {Integer} kind The specific domain authentication method to query about.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofile.isdomainauthenticatedby
     */
    IsDomainAuthenticatedBy(kind) {
        if (!this.HasProp("__IConnectionProfile6")) {
            if ((queryResult := this.QueryInterface(IConnectionProfile6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfile6 := IConnectionProfile6(outPtr)
        }

        return this.__IConnectionProfile6.IsDomainAuthenticatedBy(kind)
    }

;@endregion Instance Methods
}
