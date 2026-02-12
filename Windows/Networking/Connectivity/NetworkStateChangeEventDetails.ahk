#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INetworkStateChangeEventDetails.ahk
#Include .\INetworkStateChangeEventDetails2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Indicates which network-related properties changed for the current status change event so handlers can perform targeted (not full) refresh logic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkstatechangeeventdetails
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class NetworkStateChangeEventDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INetworkStateChangeEventDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INetworkStateChangeEventDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates if the local machine has a new connection profile associated with the current internet connection.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkstatechangeeventdetails.hasnewinternetconnectionprofile
     * @type {Boolean} 
     */
    HasNewInternetConnectionProfile {
        get => this.get_HasNewInternetConnectionProfile()
    }

    /**
     * Indicates if a connected network has a new connection cost.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkstatechangeeventdetails.hasnewconnectioncost
     * @type {Boolean} 
     */
    HasNewConnectionCost {
        get => this.get_HasNewConnectionCost()
    }

    /**
     * Indicates if the network connectivity level for any connection profiles has changed.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkstatechangeeventdetails.hasnewnetworkconnectivitylevel
     * @type {Boolean} 
     */
    HasNewNetworkConnectivityLevel {
        get => this.get_HasNewNetworkConnectivityLevel()
    }

    /**
     * Indicates a connected network has a new domain connectivity level.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkstatechangeeventdetails.hasnewdomainconnectivitylevel
     * @type {Boolean} 
     */
    HasNewDomainConnectivityLevel {
        get => this.get_HasNewDomainConnectivityLevel()
    }

    /**
     * Indicates if the list of host names returned by [GetHostNames](networkinformation_gethostnames_136280557.md) has changed.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkstatechangeeventdetails.hasnewhostnamelist
     * @type {Boolean} 
     */
    HasNewHostNameList {
        get => this.get_HasNewHostNameList()
    }

    /**
     * Indicates if the network state change event represents a change to the registration state of a WWAN connection. The current registration state can be retrieved from [WwanConnectionProfileDetails.GetNetworkRegistrationState](wwanconnectionprofiledetails_getnetworkregistrationstate_277836897.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkstatechangeeventdetails.hasnewwwanregistrationstate
     * @type {Boolean} 
     */
    HasNewWwanRegistrationState {
        get => this.get_HasNewWwanRegistrationState()
    }

    /**
     * Indicates whether the mobile hotspot (tethering) operational state may have changed for this network status change event.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkstatechangeeventdetails.hasnewtetheringoperationalstate
     * @type {Boolean} 
     */
    HasNewTetheringOperationalState {
        get => this.get_HasNewTetheringOperationalState()
    }

    /**
     * Indicates whether the tethering (mobile hotspot) client count may have changed for the current network status change event.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkstatechangeeventdetails.hasnewtetheringclientcount
     * @type {Boolean} 
     */
    HasNewTetheringClientCount {
        get => this.get_HasNewTetheringClientCount()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNewInternetConnectionProfile() {
        if (!this.HasProp("__INetworkStateChangeEventDetails")) {
            if ((queryResult := this.QueryInterface(INetworkStateChangeEventDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkStateChangeEventDetails := INetworkStateChangeEventDetails(outPtr)
        }

        return this.__INetworkStateChangeEventDetails.get_HasNewInternetConnectionProfile()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNewConnectionCost() {
        if (!this.HasProp("__INetworkStateChangeEventDetails")) {
            if ((queryResult := this.QueryInterface(INetworkStateChangeEventDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkStateChangeEventDetails := INetworkStateChangeEventDetails(outPtr)
        }

        return this.__INetworkStateChangeEventDetails.get_HasNewConnectionCost()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNewNetworkConnectivityLevel() {
        if (!this.HasProp("__INetworkStateChangeEventDetails")) {
            if ((queryResult := this.QueryInterface(INetworkStateChangeEventDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkStateChangeEventDetails := INetworkStateChangeEventDetails(outPtr)
        }

        return this.__INetworkStateChangeEventDetails.get_HasNewNetworkConnectivityLevel()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNewDomainConnectivityLevel() {
        if (!this.HasProp("__INetworkStateChangeEventDetails")) {
            if ((queryResult := this.QueryInterface(INetworkStateChangeEventDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkStateChangeEventDetails := INetworkStateChangeEventDetails(outPtr)
        }

        return this.__INetworkStateChangeEventDetails.get_HasNewDomainConnectivityLevel()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNewHostNameList() {
        if (!this.HasProp("__INetworkStateChangeEventDetails")) {
            if ((queryResult := this.QueryInterface(INetworkStateChangeEventDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkStateChangeEventDetails := INetworkStateChangeEventDetails(outPtr)
        }

        return this.__INetworkStateChangeEventDetails.get_HasNewHostNameList()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNewWwanRegistrationState() {
        if (!this.HasProp("__INetworkStateChangeEventDetails")) {
            if ((queryResult := this.QueryInterface(INetworkStateChangeEventDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkStateChangeEventDetails := INetworkStateChangeEventDetails(outPtr)
        }

        return this.__INetworkStateChangeEventDetails.get_HasNewWwanRegistrationState()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNewTetheringOperationalState() {
        if (!this.HasProp("__INetworkStateChangeEventDetails2")) {
            if ((queryResult := this.QueryInterface(INetworkStateChangeEventDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkStateChangeEventDetails2 := INetworkStateChangeEventDetails2(outPtr)
        }

        return this.__INetworkStateChangeEventDetails2.get_HasNewTetheringOperationalState()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNewTetheringClientCount() {
        if (!this.HasProp("__INetworkStateChangeEventDetails2")) {
            if ((queryResult := this.QueryInterface(INetworkStateChangeEventDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkStateChangeEventDetails2 := INetworkStateChangeEventDetails2(outPtr)
        }

        return this.__INetworkStateChangeEventDetails2.get_HasNewTetheringClientCount()
    }

;@endregion Instance Methods
}
