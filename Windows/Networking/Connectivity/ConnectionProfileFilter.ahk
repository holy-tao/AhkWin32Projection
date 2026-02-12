#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IConnectionProfileFilter.ahk
#Include .\IConnectionProfileFilter2.ahk
#Include .\IConnectionProfileFilter3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines properties used to filter results from [FindConnectionProfilesAsync](networkinformation_findconnectionprofilesasync_358252851.md).
  * At least one property must be set; otherwise the filter is ignored.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofilefilter
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class ConnectionProfileFilter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IConnectionProfileFilter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IConnectionProfileFilter.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates if connection profiles that represent currently established connections are included in query results.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofilefilter.isconnected
     * @type {Boolean} 
     */
    IsConnected {
        get => this.get_IsConnected()
        set => this.put_IsConnected(value)
    }

    /**
     * Indicates whether connection profiles that represent WWAN (mobile) connections are included in query results.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofilefilter.iswwanconnectionprofile
     * @type {Boolean} 
     */
    IsWwanConnectionProfile {
        get => this.get_IsWwanConnectionProfile()
        set => this.put_IsWwanConnectionProfile(value)
    }

    /**
     * Indicates if connection profiles that represent WLAN (WiFi) connections are included in query results.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofilefilter.iswlanconnectionprofile
     * @type {Boolean} 
     */
    IsWlanConnectionProfile {
        get => this.get_IsWlanConnectionProfile()
        set => this.put_IsWlanConnectionProfile(value)
    }

    /**
     * Defines a specific [NetworkCostType](networkcosttype.md) value to query for.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofilefilter.networkcosttype
     * @type {Integer} 
     */
    NetworkCostType {
        get => this.get_NetworkCostType()
        set => this.put_NetworkCostType(value)
    }

    /**
     * Indicates a specific network operator ID to query for.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofilefilter.serviceproviderguid
     * @type {IReference<Guid>} 
     */
    ServiceProviderGuid {
        get => this.get_ServiceProviderGuid()
        set => this.put_ServiceProviderGuid(value)
    }

    /**
     * Gets or sets whether roaming is active in the connection profile filter.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofilefilter.isroaming
     * @type {IReference<Boolean>} 
     */
    IsRoaming {
        get => this.get_IsRoaming()
        set => this.put_IsRoaming(value)
    }

    /**
     * Gets or sets whether the data limit has been exceeded under the current connection profile filter.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofilefilter.isoverdatalimit
     * @type {IReference<Boolean>} 
     */
    IsOverDataLimit {
        get => this.get_IsOverDataLimit()
        set => this.put_IsOverDataLimit(value)
    }

    /**
     * Gets or sets whether background data usage is restricted by this connection profile filter.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofilefilter.isbackgrounddatausagerestricted
     * @type {IReference<Boolean>} 
     */
    IsBackgroundDataUsageRestricted {
        get => this.get_IsBackgroundDataUsageRestricted()
        set => this.put_IsBackgroundDataUsageRestricted(value)
    }

    /**
     * Gets available data as raw data.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofilefilter.rawdata
     * @type {IBuffer} 
     */
    RawData {
        get => this.get_RawData()
    }

    /**
     * Gets or sets the purpose group [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) that a connection profile must match in order to be included in query results.
     * @remarks
     * A purpose group GUID is a public, industry-wide published GUID value describing a service. For example, IMS has a predefined GUID that you can provision with your mobile network operator SIM when the SIM is inserted into a device, which describes the profile that should be used when you query for the IMS profile.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionprofilefilter.purposeguid
     * @type {IReference<Guid>} 
     */
    PurposeGuid {
        get => this.get_PurposeGuid()
        set => this.put_PurposeGuid(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of [ConnectionProfileFilter](connectionprofilefilter.md), which contains a set of properties that are used to improve the relevance of [FindConnectionProfilesAsync](networkinformation_findconnectionprofilesasync_358252851.md) results.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.Connectivity.ConnectionProfileFilter")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsConnected(value) {
        if (!this.HasProp("__IConnectionProfileFilter")) {
            if ((queryResult := this.QueryInterface(IConnectionProfileFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfileFilter := IConnectionProfileFilter(outPtr)
        }

        return this.__IConnectionProfileFilter.put_IsConnected(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConnected() {
        if (!this.HasProp("__IConnectionProfileFilter")) {
            if ((queryResult := this.QueryInterface(IConnectionProfileFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfileFilter := IConnectionProfileFilter(outPtr)
        }

        return this.__IConnectionProfileFilter.get_IsConnected()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsWwanConnectionProfile(value) {
        if (!this.HasProp("__IConnectionProfileFilter")) {
            if ((queryResult := this.QueryInterface(IConnectionProfileFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfileFilter := IConnectionProfileFilter(outPtr)
        }

        return this.__IConnectionProfileFilter.put_IsWwanConnectionProfile(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWwanConnectionProfile() {
        if (!this.HasProp("__IConnectionProfileFilter")) {
            if ((queryResult := this.QueryInterface(IConnectionProfileFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfileFilter := IConnectionProfileFilter(outPtr)
        }

        return this.__IConnectionProfileFilter.get_IsWwanConnectionProfile()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsWlanConnectionProfile(value) {
        if (!this.HasProp("__IConnectionProfileFilter")) {
            if ((queryResult := this.QueryInterface(IConnectionProfileFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfileFilter := IConnectionProfileFilter(outPtr)
        }

        return this.__IConnectionProfileFilter.put_IsWlanConnectionProfile(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWlanConnectionProfile() {
        if (!this.HasProp("__IConnectionProfileFilter")) {
            if ((queryResult := this.QueryInterface(IConnectionProfileFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfileFilter := IConnectionProfileFilter(outPtr)
        }

        return this.__IConnectionProfileFilter.get_IsWlanConnectionProfile()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_NetworkCostType(value) {
        if (!this.HasProp("__IConnectionProfileFilter")) {
            if ((queryResult := this.QueryInterface(IConnectionProfileFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfileFilter := IConnectionProfileFilter(outPtr)
        }

        return this.__IConnectionProfileFilter.put_NetworkCostType(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NetworkCostType() {
        if (!this.HasProp("__IConnectionProfileFilter")) {
            if ((queryResult := this.QueryInterface(IConnectionProfileFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfileFilter := IConnectionProfileFilter(outPtr)
        }

        return this.__IConnectionProfileFilter.get_NetworkCostType()
    }

    /**
     * 
     * @param {IReference<Guid>} value 
     * @returns {HRESULT} 
     */
    put_ServiceProviderGuid(value) {
        if (!this.HasProp("__IConnectionProfileFilter")) {
            if ((queryResult := this.QueryInterface(IConnectionProfileFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfileFilter := IConnectionProfileFilter(outPtr)
        }

        return this.__IConnectionProfileFilter.put_ServiceProviderGuid(value)
    }

    /**
     * 
     * @returns {IReference<Guid>} 
     */
    get_ServiceProviderGuid() {
        if (!this.HasProp("__IConnectionProfileFilter")) {
            if ((queryResult := this.QueryInterface(IConnectionProfileFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfileFilter := IConnectionProfileFilter(outPtr)
        }

        return this.__IConnectionProfileFilter.get_ServiceProviderGuid()
    }

    /**
     * 
     * @param {IReference<Boolean>} value 
     * @returns {HRESULT} 
     */
    put_IsRoaming(value) {
        if (!this.HasProp("__IConnectionProfileFilter2")) {
            if ((queryResult := this.QueryInterface(IConnectionProfileFilter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfileFilter2 := IConnectionProfileFilter2(outPtr)
        }

        return this.__IConnectionProfileFilter2.put_IsRoaming(value)
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_IsRoaming() {
        if (!this.HasProp("__IConnectionProfileFilter2")) {
            if ((queryResult := this.QueryInterface(IConnectionProfileFilter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfileFilter2 := IConnectionProfileFilter2(outPtr)
        }

        return this.__IConnectionProfileFilter2.get_IsRoaming()
    }

    /**
     * 
     * @param {IReference<Boolean>} value 
     * @returns {HRESULT} 
     */
    put_IsOverDataLimit(value) {
        if (!this.HasProp("__IConnectionProfileFilter2")) {
            if ((queryResult := this.QueryInterface(IConnectionProfileFilter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfileFilter2 := IConnectionProfileFilter2(outPtr)
        }

        return this.__IConnectionProfileFilter2.put_IsOverDataLimit(value)
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_IsOverDataLimit() {
        if (!this.HasProp("__IConnectionProfileFilter2")) {
            if ((queryResult := this.QueryInterface(IConnectionProfileFilter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfileFilter2 := IConnectionProfileFilter2(outPtr)
        }

        return this.__IConnectionProfileFilter2.get_IsOverDataLimit()
    }

    /**
     * 
     * @param {IReference<Boolean>} value 
     * @returns {HRESULT} 
     */
    put_IsBackgroundDataUsageRestricted(value) {
        if (!this.HasProp("__IConnectionProfileFilter2")) {
            if ((queryResult := this.QueryInterface(IConnectionProfileFilter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfileFilter2 := IConnectionProfileFilter2(outPtr)
        }

        return this.__IConnectionProfileFilter2.put_IsBackgroundDataUsageRestricted(value)
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_IsBackgroundDataUsageRestricted() {
        if (!this.HasProp("__IConnectionProfileFilter2")) {
            if ((queryResult := this.QueryInterface(IConnectionProfileFilter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfileFilter2 := IConnectionProfileFilter2(outPtr)
        }

        return this.__IConnectionProfileFilter2.get_IsBackgroundDataUsageRestricted()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_RawData() {
        if (!this.HasProp("__IConnectionProfileFilter2")) {
            if ((queryResult := this.QueryInterface(IConnectionProfileFilter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfileFilter2 := IConnectionProfileFilter2(outPtr)
        }

        return this.__IConnectionProfileFilter2.get_RawData()
    }

    /**
     * 
     * @param {IReference<Guid>} value 
     * @returns {HRESULT} 
     */
    put_PurposeGuid(value) {
        if (!this.HasProp("__IConnectionProfileFilter3")) {
            if ((queryResult := this.QueryInterface(IConnectionProfileFilter3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfileFilter3 := IConnectionProfileFilter3(outPtr)
        }

        return this.__IConnectionProfileFilter3.put_PurposeGuid(value)
    }

    /**
     * 
     * @returns {IReference<Guid>} 
     */
    get_PurposeGuid() {
        if (!this.HasProp("__IConnectionProfileFilter3")) {
            if ((queryResult := this.QueryInterface(IConnectionProfileFilter3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionProfileFilter3 := IConnectionProfileFilter3(outPtr)
        }

        return this.__IConnectionProfileFilter3.get_PurposeGuid()
    }

;@endregion Instance Methods
}
