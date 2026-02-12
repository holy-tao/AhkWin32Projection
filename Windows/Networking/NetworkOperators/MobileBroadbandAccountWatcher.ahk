#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandAccountWatcher.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MobileBroadbandAccountWatcher.ahk
#Include .\MobileBroadbandAccountEventArgs.ahk
#Include .\MobileBroadbandAccountUpdatedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides information regarding availability of and updates to Mobile Broadband Accounts.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccountwatcher
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandAccountWatcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandAccountWatcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandAccountWatcher.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the account watcher.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccountwatcher.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Occurs when a Mobile Broadband Account is added to the client.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The network account id of the account is available in the event handler from the [NetworkAccountId](mobilebroadbandaccounteventargs_networkaccountid.md) property.
     * @type {TypedEventHandler<MobileBroadbandAccountWatcher, MobileBroadbandAccountEventArgs>}
    */
    OnAccountAdded {
        get {
            if(!this.HasProp("__OnAccountAdded")){
                this.__OnAccountAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{423cc41e-fe8c-5a7d-9fee-aae04ef85700}"),
                    MobileBroadbandAccountWatcher,
                    MobileBroadbandAccountEventArgs
                )
                this.__OnAccountAddedToken := this.add_AccountAdded(this.__OnAccountAdded.iface)
            }
            return this.__OnAccountAdded
        }
    }

    /**
     * Occurs when a Mobile Broadband Account is updated on the client.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The network account id of the account is available in the event handler from the [NetworkAccountId](mobilebroadbandaccountupdatedeventargs_networkaccountid.md) property.
     * 
     * 
     * The AccountUpdated event is triggered when any of the following properties change:
     * 
     * + [MobileBroadbandDeviceInformation](mobilebroadbanddeviceinformation.md) class:
     * 
     * + [CellularClass](mobilebroadbanddeviceinformation_cellularclass.md)
     * + [CurrentRadioState](mobilebroadbanddeviceinformation_currentradiostate.md)
     * + [CustomDataClass](mobilebroadbanddeviceinformation_customdataclass.md)
     * + [DataClasses](mobilebroadbanddeviceinformation_dataclasses.md)
     * + [MobileEquipmentId](mobilebroadbanddeviceinformation_mobileequipmentid.md)
     * + [DeviceType](mobilebroadbanddeviceinformation_devicetype.md)
     * + [FirmwareInformation](mobilebroadbanddeviceinformation_firmwareinformation.md)
     * + [Manufacturer](mobilebroadbanddeviceinformation_manufacturer.md)
     * + [Model](mobilebroadbanddeviceinformation_model.md)
     * + [SimIccId](mobilebroadbanddeviceinformation_simiccid.md)
     * + [SubscriberId](mobilebroadbanddeviceinformation_subscriberid.md)
     * + [TelephoneNumbers](mobilebroadbanddeviceinformation_telephonenumbers.md)
     * 
     * + [MobileBroadbandNetwork](mobilebroadbandnetwork.md) class:
     * 
     * + [AccessPointName](mobilebroadbandnetwork_accesspointname.md)
     * + [NetworkRegistrationState](mobilebroadbandnetwork_networkregistrationstate.md)
     * + [PacketAttachNetworkError](mobilebroadbandnetwork_packetattachnetworkerror.md)
     * + [RegistrationNetworkError](mobilebroadbandnetwork_registrationnetworkerror.md)
     * @type {TypedEventHandler<MobileBroadbandAccountWatcher, MobileBroadbandAccountUpdatedEventArgs>}
    */
    OnAccountUpdated {
        get {
            if(!this.HasProp("__OnAccountUpdated")){
                this.__OnAccountUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0e865096-1ffa-5792-8d4f-8623e3c77f56}"),
                    MobileBroadbandAccountWatcher,
                    MobileBroadbandAccountUpdatedEventArgs
                )
                this.__OnAccountUpdatedToken := this.add_AccountUpdated(this.__OnAccountUpdated.iface)
            }
            return this.__OnAccountUpdated
        }
    }

    /**
     * Occurs when a Mobile Broadband Account is removed from the client.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The network account id of the account is available in the event handler from the [NetworkAccountId](mobilebroadbandaccounteventargs_networkaccountid.md) property.
     * @type {TypedEventHandler<MobileBroadbandAccountWatcher, MobileBroadbandAccountEventArgs>}
    */
    OnAccountRemoved {
        get {
            if(!this.HasProp("__OnAccountRemoved")){
                this.__OnAccountRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{423cc41e-fe8c-5a7d-9fee-aae04ef85700}"),
                    MobileBroadbandAccountWatcher,
                    MobileBroadbandAccountEventArgs
                )
                this.__OnAccountRemovedToken := this.add_AccountRemoved(this.__OnAccountRemoved.iface)
            }
            return this.__OnAccountRemoved
        }
    }

    /**
     * Occurs when the account watcher has finished enumerating accounts for the client.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * When the watcher is started, it enumerates all existing accounts (raising an [AccountAdded](mobilebroadbandaccountwatcher_accountadded.md) event for each account). You can use the **EnumerationCompleted** event to determine when the enumeration operation has finished. After that, all proceeding events are new.
     * @type {TypedEventHandler<MobileBroadbandAccountWatcher, IInspectable>}
    */
    OnEnumerationCompleted {
        get {
            if(!this.HasProp("__OnEnumerationCompleted")){
                this.__OnEnumerationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e4dc9cfc-f462-5afd-856d-04ace229d00e}"),
                    MobileBroadbandAccountWatcher,
                    IInspectable
                )
                this.__OnEnumerationCompletedToken := this.add_EnumerationCompleted(this.__OnEnumerationCompleted.iface)
            }
            return this.__OnEnumerationCompleted
        }
    }

    /**
     * Occurs when the [MobileBroadbandAccountWatcher](mobilebroadbandaccountwatcher.md) has stopped.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * You can begin the process of stopping a [MobileBroadbandAccountWatcher](mobilebroadbandaccountwatcher.md) by calling the [Stop](mobilebroadbandaccountwatcher_stop_1201535524.md) method. When the [MobileBroadbandAccountWatcher](mobilebroadbandaccountwatcher.md) fully stops, the Stopped event is raised.
     * 
     * You can query the status of a watcher using the [Status](mobilebroadbandaccountwatcher_status.md) property to determine if the watcher was aborted due to an unexpected internal error condition.
     * @type {TypedEventHandler<MobileBroadbandAccountWatcher, IInspectable>}
    */
    OnStopped {
        get {
            if(!this.HasProp("__OnStopped")){
                this.__OnStopped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e4dc9cfc-f462-5afd-856d-04ace229d00e}"),
                    MobileBroadbandAccountWatcher,
                    IInspectable
                )
                this.__OnStoppedToken := this.add_Stopped(this.__OnStopped.iface)
            }
            return this.__OnStopped
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of a [MobileBroadbandAccountWatcher](mobilebroadbandaccountwatcher.md).
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * To enable the [MobileBroadbandAccountWatcher](mobilebroadbandaccountwatcher.md), call the [Start](mobilebroadbandaccountwatcher_start_1587696324.md) method.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.MobileBroadbandAccountWatcher")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAccountAddedToken")) {
            this.remove_AccountAdded(this.__OnAccountAddedToken)
            this.__OnAccountAdded.iface.Dispose()
        }

        if(this.HasProp("__OnAccountUpdatedToken")) {
            this.remove_AccountUpdated(this.__OnAccountUpdatedToken)
            this.__OnAccountUpdated.iface.Dispose()
        }

        if(this.HasProp("__OnAccountRemovedToken")) {
            this.remove_AccountRemoved(this.__OnAccountRemovedToken)
            this.__OnAccountRemoved.iface.Dispose()
        }

        if(this.HasProp("__OnEnumerationCompletedToken")) {
            this.remove_EnumerationCompleted(this.__OnEnumerationCompletedToken)
            this.__OnEnumerationCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnStoppedToken")) {
            this.remove_Stopped(this.__OnStoppedToken)
            this.__OnStopped.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<MobileBroadbandAccountWatcher, MobileBroadbandAccountEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccountAdded(handler) {
        if (!this.HasProp("__IMobileBroadbandAccountWatcher")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccountWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccountWatcher := IMobileBroadbandAccountWatcher(outPtr)
        }

        return this.__IMobileBroadbandAccountWatcher.add_AccountAdded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_AccountAdded(cookie) {
        if (!this.HasProp("__IMobileBroadbandAccountWatcher")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccountWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccountWatcher := IMobileBroadbandAccountWatcher(outPtr)
        }

        return this.__IMobileBroadbandAccountWatcher.remove_AccountAdded(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<MobileBroadbandAccountWatcher, MobileBroadbandAccountUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccountUpdated(handler) {
        if (!this.HasProp("__IMobileBroadbandAccountWatcher")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccountWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccountWatcher := IMobileBroadbandAccountWatcher(outPtr)
        }

        return this.__IMobileBroadbandAccountWatcher.add_AccountUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_AccountUpdated(cookie) {
        if (!this.HasProp("__IMobileBroadbandAccountWatcher")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccountWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccountWatcher := IMobileBroadbandAccountWatcher(outPtr)
        }

        return this.__IMobileBroadbandAccountWatcher.remove_AccountUpdated(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<MobileBroadbandAccountWatcher, MobileBroadbandAccountEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccountRemoved(handler) {
        if (!this.HasProp("__IMobileBroadbandAccountWatcher")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccountWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccountWatcher := IMobileBroadbandAccountWatcher(outPtr)
        }

        return this.__IMobileBroadbandAccountWatcher.add_AccountRemoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_AccountRemoved(cookie) {
        if (!this.HasProp("__IMobileBroadbandAccountWatcher")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccountWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccountWatcher := IMobileBroadbandAccountWatcher(outPtr)
        }

        return this.__IMobileBroadbandAccountWatcher.remove_AccountRemoved(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<MobileBroadbandAccountWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EnumerationCompleted(handler) {
        if (!this.HasProp("__IMobileBroadbandAccountWatcher")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccountWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccountWatcher := IMobileBroadbandAccountWatcher(outPtr)
        }

        return this.__IMobileBroadbandAccountWatcher.add_EnumerationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_EnumerationCompleted(cookie) {
        if (!this.HasProp("__IMobileBroadbandAccountWatcher")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccountWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccountWatcher := IMobileBroadbandAccountWatcher(outPtr)
        }

        return this.__IMobileBroadbandAccountWatcher.remove_EnumerationCompleted(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<MobileBroadbandAccountWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Stopped(handler) {
        if (!this.HasProp("__IMobileBroadbandAccountWatcher")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccountWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccountWatcher := IMobileBroadbandAccountWatcher(outPtr)
        }

        return this.__IMobileBroadbandAccountWatcher.add_Stopped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_Stopped(cookie) {
        if (!this.HasProp("__IMobileBroadbandAccountWatcher")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccountWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccountWatcher := IMobileBroadbandAccountWatcher(outPtr)
        }

        return this.__IMobileBroadbandAccountWatcher.remove_Stopped(cookie)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IMobileBroadbandAccountWatcher")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccountWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccountWatcher := IMobileBroadbandAccountWatcher(outPtr)
        }

        return this.__IMobileBroadbandAccountWatcher.get_Status()
    }

    /**
     * Starts the account watcher.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * When you start the account watcher, it first enumerates all Mobile Broadband Accounts and raises an [AccountAdded](mobilebroadbandaccountwatcher_accountadded.md) event for each account found. When the enumeration operation is completed, the account watcher raises the [EnumerationCompleted](mobilebroadbandaccountwatcher_enumerationcompleted.md) event. After the [EnumerationCompleted](mobilebroadbandaccountwatcher_enumerationcompleted.md) event is raised, the account watcher continues to raise account-related events ([AccountAdded](mobilebroadbandaccountwatcher_accountadded.md), [AccountUpdated](mobilebroadbandaccountwatcher_accountupdated.md), and [AccountRemoved](mobilebroadbandaccountwatcher_accountremoved.md)) until you call the [Stop](mobilebroadbandaccountwatcher_stop_1201535524.md) method.
     * 
     * Note that you do not need to explicitly stop and start the account watcher on App Suspend/Resume events. Instead, starting and starting the watcher is handled by the API itself.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccountwatcher.start
     */
    Start() {
        if (!this.HasProp("__IMobileBroadbandAccountWatcher")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccountWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccountWatcher := IMobileBroadbandAccountWatcher(outPtr)
        }

        return this.__IMobileBroadbandAccountWatcher.Start()
    }

    /**
     * Stops the account watcher.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * You can begin the process of stopping a [MobileBroadbandAccountWatcher](mobilebroadbandaccountwatcher.md) by calling the Stop method. When the [MobileBroadbandAccountWatcher](mobilebroadbandaccountwatcher.md) fully stops, the [Stopped](mobilebroadbandaccountwatcher_stopped.md) event is raised. When the [MobileBroadbandAccountWatcher](mobilebroadbandaccountwatcher.md) has been stopped, it no longer raises account-related events.
     * 
     * You can query the status of a watcher using the [Status](mobilebroadbandaccountwatcher_status.md) property to determine if the watcher was aborted due to an unexpected internal error condition.
     * 
     * Note that you do not need to explicitly stop and start the account watcher on App Suspend/Resume events. Instead, starting and starting the watcher is handled by the API itself.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccountwatcher.stop
     */
    Stop() {
        if (!this.HasProp("__IMobileBroadbandAccountWatcher")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccountWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccountWatcher := IMobileBroadbandAccountWatcher(outPtr)
        }

        return this.__IMobileBroadbandAccountWatcher.Stop()
    }

;@endregion Instance Methods
}
