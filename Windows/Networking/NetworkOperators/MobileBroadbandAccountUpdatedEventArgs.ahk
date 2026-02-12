#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandAccountUpdatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information for the [AccountUpdated](mobilebroadbandaccountwatcher_accountupdated.md) event.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * <!--MUST add details of how event objects are retrieved from the event handler-->
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccountupdatedeventargs
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandAccountUpdatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandAccountUpdatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandAccountUpdatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the network account Id of the updated account.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccountupdatedeventargs.networkaccountid
     * @type {HSTRING} 
     */
    NetworkAccountId {
        get => this.get_NetworkAccountId()
    }

    /**
     * Gets a value indicating whether the device information has changed for the account.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccountupdatedeventargs.hasdeviceinformationchanged
     * @type {Boolean} 
     */
    HasDeviceInformationChanged {
        get => this.get_HasDeviceInformationChanged()
    }

    /**
     * Gets a value that indicates if the [CurrentNetwork](mobilebroadbandaccount_currentnetwork.md) was updated for the account.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccountupdatedeventargs.hasnetworkchanged
     * @type {Boolean} 
     */
    HasNetworkChanged {
        get => this.get_HasNetworkChanged()
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
        if (!this.HasProp("__IMobileBroadbandAccountUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccountUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccountUpdatedEventArgs := IMobileBroadbandAccountUpdatedEventArgs(outPtr)
        }

        return this.__IMobileBroadbandAccountUpdatedEventArgs.get_NetworkAccountId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasDeviceInformationChanged() {
        if (!this.HasProp("__IMobileBroadbandAccountUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccountUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccountUpdatedEventArgs := IMobileBroadbandAccountUpdatedEventArgs(outPtr)
        }

        return this.__IMobileBroadbandAccountUpdatedEventArgs.get_HasDeviceInformationChanged()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNetworkChanged() {
        if (!this.HasProp("__IMobileBroadbandAccountUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccountUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccountUpdatedEventArgs := IMobileBroadbandAccountUpdatedEventArgs(outPtr)
        }

        return this.__IMobileBroadbandAccountUpdatedEventArgs.get_HasNetworkChanged()
    }

;@endregion Instance Methods
}
