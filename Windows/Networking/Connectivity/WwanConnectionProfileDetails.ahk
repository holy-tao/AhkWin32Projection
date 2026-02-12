#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWwanConnectionProfileDetails.ahk
#Include .\IWwanConnectionProfileDetails2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides WWAN (cellular) specific details for a connection profile: carrier identifiers, registration state, current data class, IP kind, and purpose GUIDs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.wwanconnectionprofiledetails
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class WwanConnectionProfileDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWwanConnectionProfileDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWwanConnectionProfileDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates the Home Network Provider ID.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.wwanconnectionprofiledetails.homeproviderid
     * @type {HSTRING} 
     */
    HomeProviderId {
        get => this.get_HomeProviderId()
    }

    /**
     * Indicates the name of the access point used to establish the WWAN connection.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.wwanconnectionprofiledetails.accesspointname
     * @type {HSTRING} 
     */
    AccessPointName {
        get => this.get_AccessPointName()
    }

    /**
     * Gets a value that describes a level of supported IP.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.wwanconnectionprofiledetails.ipkind
     * @type {Integer} 
     */
    IPKind {
        get => this.get_IPKind()
    }

    /**
     * Gets a list of purpose group GUIDs.
     * @remarks
     * A purpose group [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) is a public, industry-wide published GUID value describing a service. For example, IMS has a predefined GUID that you can provision with your mobile network operator SIM when the SIM is inserted into a device, which describes the profile that should be used when you query for the IMS profile.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.wwanconnectionprofiledetails.purposeguids
     * @type {IVectorView<Guid>} 
     */
    PurposeGuids {
        get => this.get_PurposeGuids()
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
    get_HomeProviderId() {
        if (!this.HasProp("__IWwanConnectionProfileDetails")) {
            if ((queryResult := this.QueryInterface(IWwanConnectionProfileDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWwanConnectionProfileDetails := IWwanConnectionProfileDetails(outPtr)
        }

        return this.__IWwanConnectionProfileDetails.get_HomeProviderId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AccessPointName() {
        if (!this.HasProp("__IWwanConnectionProfileDetails")) {
            if ((queryResult := this.QueryInterface(IWwanConnectionProfileDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWwanConnectionProfileDetails := IWwanConnectionProfileDetails(outPtr)
        }

        return this.__IWwanConnectionProfileDetails.get_AccessPointName()
    }

    /**
     * Retrieves the current network registration state for the WWAN connection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.wwanconnectionprofiledetails.getnetworkregistrationstate
     */
    GetNetworkRegistrationState() {
        if (!this.HasProp("__IWwanConnectionProfileDetails")) {
            if ((queryResult := this.QueryInterface(IWwanConnectionProfileDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWwanConnectionProfileDetails := IWwanConnectionProfileDetails(outPtr)
        }

        return this.__IWwanConnectionProfileDetails.GetNetworkRegistrationState()
    }

    /**
     * Indicates the class of data service offered by the network currently in use for the WWAN connection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.wwanconnectionprofiledetails.getcurrentdataclass
     */
    GetCurrentDataClass() {
        if (!this.HasProp("__IWwanConnectionProfileDetails")) {
            if ((queryResult := this.QueryInterface(IWwanConnectionProfileDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWwanConnectionProfileDetails := IWwanConnectionProfileDetails(outPtr)
        }

        return this.__IWwanConnectionProfileDetails.GetCurrentDataClass()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IPKind() {
        if (!this.HasProp("__IWwanConnectionProfileDetails2")) {
            if ((queryResult := this.QueryInterface(IWwanConnectionProfileDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWwanConnectionProfileDetails2 := IWwanConnectionProfileDetails2(outPtr)
        }

        return this.__IWwanConnectionProfileDetails2.get_IPKind()
    }

    /**
     * 
     * @returns {IVectorView<Guid>} 
     */
    get_PurposeGuids() {
        if (!this.HasProp("__IWwanConnectionProfileDetails2")) {
            if ((queryResult := this.QueryInterface(IWwanConnectionProfileDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWwanConnectionProfileDetails2 := IWwanConnectionProfileDetails2(outPtr)
        }

        return this.__IWwanConnectionProfileDetails2.get_PurposeGuids()
    }

;@endregion Instance Methods
}
