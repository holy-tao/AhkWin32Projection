#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandAccount.ahk
#Include .\IMobileBroadbandAccount2.ahk
#Include .\IMobileBroadbandAccount3.ahk
#Include .\IMobileBroadbandAccountStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a mobile broadband account and related information about the network provider for the account.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccount
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandAccount extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandAccount

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandAccount.IID

    /**
     * A list of all network account IDs for the network service provider.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps, and apps given privileged access by mobile network operators. If you want to use this API, and publish your app to the Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccount.availablenetworkaccountids
     * @type {IVectorView<HSTRING>} 
     */
    static AvailableNetworkAccountIds {
        get => MobileBroadbandAccount.get_AvailableNetworkAccountIds()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    static get_AvailableNetworkAccountIds() {
        if (!MobileBroadbandAccount.HasProp("__IMobileBroadbandAccountStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.MobileBroadbandAccount")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMobileBroadbandAccountStatics.IID)
            MobileBroadbandAccount.__IMobileBroadbandAccountStatics := IMobileBroadbandAccountStatics(factoryPtr)
        }

        return MobileBroadbandAccount.__IMobileBroadbandAccountStatics.get_AvailableNetworkAccountIds()
    }

    /**
     * Creates a mobile broadband account for the mobile device associated with the supplied network account ID.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @param {HSTRING} networkAccountId The network account ID to use to select the corresponding mobile broadband device to use for the account.
     * @returns {MobileBroadbandAccount} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccount.createfromnetworkaccountid
     */
    static CreateFromNetworkAccountId(networkAccountId) {
        if (!MobileBroadbandAccount.HasProp("__IMobileBroadbandAccountStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.MobileBroadbandAccount")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMobileBroadbandAccountStatics.IID)
            MobileBroadbandAccount.__IMobileBroadbandAccountStatics := IMobileBroadbandAccountStatics(factoryPtr)
        }

        return MobileBroadbandAccount.__IMobileBroadbandAccountStatics.CreateFromNetworkAccountId(networkAccountId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a unique identifier for the mobile broadband account.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The network account identifier is supplied by the mobile broadband provider when an account is activated and is stored locally in metadata that describes account information for the mobile broadband device.
     * 
     * The network account identifier for a mobile broadband account matches the value passed to the [CreateFromNetworkAccountId](ussdsession_createfromnetworkaccountid_2015090244.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccount.networkaccountid
     * @type {HSTRING} 
     */
    NetworkAccountId {
        get => this.get_NetworkAccountId()
    }

    /**
     * A unique identifier for the network provider for the mobile broadband account.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccount.serviceproviderguid
     * @type {Guid} 
     */
    ServiceProviderGuid {
        get => this.get_ServiceProviderGuid()
    }

    /**
     * The name of the network provider for the mobile broadband account.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccount.serviceprovidername
     * @type {HSTRING} 
     */
    ServiceProviderName {
        get => this.get_ServiceProviderName()
    }

    /**
     * Gets the Mobile Broadband network object for this account.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccount.currentnetwork
     * @type {MobileBroadbandNetwork} 
     */
    CurrentNetwork {
        get => this.get_CurrentNetwork()
    }

    /**
     * Gets the mobile broadband device information associated with this account.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccount.currentdeviceinformation
     * @type {MobileBroadbandDeviceInformation} 
     */
    CurrentDeviceInformation {
        get => this.get_CurrentDeviceInformation()
    }

    /**
     * Returns the Account Experience URL associated with the Mobile Broadband account.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * An Account Experience URL represents a mobile broadband account and its related information about the network provider. For more information, see [Microsoft Store mobile broadband apps](/windows-hardware/drivers/mobilebroadband/windows-store-mobile-broadband-apps).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccount.accountexperienceurl
     * @type {Uri} 
     */
    AccountExperienceUrl {
        get => this.get_AccountExperienceUrl()
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
    get_NetworkAccountId() {
        if (!this.HasProp("__IMobileBroadbandAccount")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccount := IMobileBroadbandAccount(outPtr)
        }

        return this.__IMobileBroadbandAccount.get_NetworkAccountId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ServiceProviderGuid() {
        if (!this.HasProp("__IMobileBroadbandAccount")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccount := IMobileBroadbandAccount(outPtr)
        }

        return this.__IMobileBroadbandAccount.get_ServiceProviderGuid()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ServiceProviderName() {
        if (!this.HasProp("__IMobileBroadbandAccount")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccount := IMobileBroadbandAccount(outPtr)
        }

        return this.__IMobileBroadbandAccount.get_ServiceProviderName()
    }

    /**
     * 
     * @returns {MobileBroadbandNetwork} 
     */
    get_CurrentNetwork() {
        if (!this.HasProp("__IMobileBroadbandAccount")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccount := IMobileBroadbandAccount(outPtr)
        }

        return this.__IMobileBroadbandAccount.get_CurrentNetwork()
    }

    /**
     * 
     * @returns {MobileBroadbandDeviceInformation} 
     */
    get_CurrentDeviceInformation() {
        if (!this.HasProp("__IMobileBroadbandAccount")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccount := IMobileBroadbandAccount(outPtr)
        }

        return this.__IMobileBroadbandAccount.get_CurrentDeviceInformation()
    }

    /**
     * Retrieves an array of [ConnectionProfile](../windows.networking.connectivity/connectionprofile.md) objects that represent connections associated with the Mobile Broadband account.
     * @returns {IVectorView<ConnectionProfile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccount.getconnectionprofiles
     */
    GetConnectionProfiles() {
        if (!this.HasProp("__IMobileBroadbandAccount2")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccount2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccount2 := IMobileBroadbandAccount2(outPtr)
        }

        return this.__IMobileBroadbandAccount2.GetConnectionProfiles()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_AccountExperienceUrl() {
        if (!this.HasProp("__IMobileBroadbandAccount3")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccount3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccount3 := IMobileBroadbandAccount3(outPtr)
        }

        return this.__IMobileBroadbandAccount3.get_AccountExperienceUrl()
    }

;@endregion Instance Methods
}
