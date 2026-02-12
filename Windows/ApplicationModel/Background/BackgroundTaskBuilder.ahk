#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTaskBuilder.ahk
#Include .\IBackgroundTaskBuilder2.ahk
#Include .\IBackgroundTaskBuilder3.ahk
#Include .\IBackgroundTaskBuilder4.ahk
#Include .\IBackgroundTaskBuilder5.ahk
#Include .\IBackgroundTaskBuilder6.ahk
#Include .\IBackgroundTaskBuilderStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a background task to register with the system.
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * 
 * If your background task requires network connectivity, be aware of the following:
 * 
 * ** Network related triggers**
 * 
 * - Use a [SocketActivityTrigger](socketactivitytrigger.md) to activate the background task when a packet is received and you need to perform a short-lived task. After performing the task, the background task should terminate to save power.
 * - Use a [ControlChannelTrigger](../windows.networking.sockets/controlchanneltrigger.md) to activate the background task when a packet is received and you need to perform a long-lived task.
 * 
 * ** Network related conditions and flags**
 * 
 * - Add the **InternetAvailable** condition ([BackgroundTaskBuilder.AddCondition](backgroundtaskbuilder_addcondition_1258521593.md)) to your background task to delay triggering the background task until the network stack is running. This condition saves power because the background task won't execute until network access is available. This condition does not provide real-time activation.
 * 
 * Regardless of the trigger you use, set [IsNetworkRequested](backgroundtaskbuilder_isnetworkrequested.md) on your background task to ensure that the network stays up while the background task runs. This tells the background task infrastructure to keep the network up while the task is executing, even if the device has entered Connected Standby mode. If your background task does not use **IsNetworkRequested**, then your background task will not be able to access the network when in Connected Standby mode (for example, when a phone's screen is turned off.)
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskbuilder
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class BackgroundTaskBuilder extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundTaskBuilder

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundTaskBuilder.IID

    /**
     * Gets a value that indicates whether the device supports running background tasks in modern standby mode.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskbuilder.isrunningtaskinstandbysupported
     * @type {Boolean} 
     */
    static IsRunningTaskInStandbySupported {
        get => BackgroundTaskBuilder.get_IsRunningTaskInStandbySupported()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsRunningTaskInStandbySupported() {
        if (!BackgroundTaskBuilder.HasProp("__IBackgroundTaskBuilderStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundTaskBuilder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundTaskBuilderStatics.IID)
            BackgroundTaskBuilder.__IBackgroundTaskBuilderStatics := IBackgroundTaskBuilderStatics(factoryPtr)
        }

        return BackgroundTaskBuilder.__IBackgroundTaskBuilderStatics.get_IsRunningTaskInStandbySupported()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the class that performs the work of a background task.
     * @remarks
     * > **UWP app using C++, C#, or Visual Basic**
     * > The task entry point class must implement the [IBackgroundTask](ibackgroundtask.md) interface. The system calls [IBackgroundTask::Run ](ibackgroundtask_run_2017283929.md) when the background task is triggered. In addition, the class must be specified in the `<Extensions>` section of the application's manifest as `<Extension Category="windows.backgroundTasks" EntryPoint="appNamespace.appClassName">`.The task entry point class can be implemented in the same process as the application's foreground component (in-proc); however, it cannot run on any of the application's foreground threads because the application might be suspended when the background task is triggered. For best results, implement the class in a separate process (out-of-proc) to decouple it from the application's foreground components and allow the system to manage the application's processes more efficiently.
     * 
     * > **UWP app using JavaScript**
     * > The entry point for a JavaScript background task is a JavaScript start page. See [WebUIBackgroundTaskInstance.current](../windows.ui.webui/webuibackgroundtaskinstance_current.md) for more information.Note that JavaScript background tasks must call [close()](/previous-versions/windows/internet-explorer/ie-developer/dev-guides/hh673568(v=vs.85)) to terminate when they are done, so they don't continue to consume the user's memory and battery.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskbuilder.taskentrypoint
     * @type {HSTRING} 
     */
    TaskEntryPoint {
        get => this.get_TaskEntryPoint()
        set => this.put_TaskEntryPoint(value)
    }

    /**
     * Gets or sets the name of a background task.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskbuilder.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Indicates whether the background task will be canceled if at least one of its required conditions is no longer met.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskbuilder.cancelonconditionloss
     * @type {Boolean} 
     */
    CancelOnConditionLoss {
        get => this.get_CancelOnConditionLoss()
        set => this.put_CancelOnConditionLoss(value)
    }

    /**
     * Indicates whether to keep the network up while running the background task.
     * @remarks
     * This property is applicable to desktops computers on which disconnected standby is implemented. Setting this property to `true` keeps the network up while the background task is executing, even if the device has entered Connected Standby mode.
     * 
     * The WinMain application components in Desktop Bridge applications may not execute code in disconnected standby or connected standby. WinMain components using [COM background tasks](/windows/uwp/launch-resume/create-and-register-a-winmain-background-task) will not observe any behavioral differences when setting this flag.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskbuilder.isnetworkrequested
     * @type {Boolean} 
     */
    IsNetworkRequested {
        get => this.get_IsNetworkRequested()
        set => this.put_IsNetworkRequested(value)
    }

    /**
     * Gets and sets the group identifier.
     * @remarks
     * To reduce collisions with other group identifiers, consider including your domain name in the group identifier. For example: `"com.contoso.appname.tasks"`. Or use the string form of a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskbuilder.taskgroup
     * @type {BackgroundTaskRegistrationGroup} 
     */
    TaskGroup {
        get => this.get_TaskGroup()
        set => this.put_TaskGroup(value)
    }

    /**
     * Gets or sets a value that indicates whether the background task can run in standby mode.
     * @remarks
     * The property allows developers to opt-in a background task registration to run in modern standby. When using the [BackgroundTaskBuilder.Register(string)](backgroundtaskbuilder_register_1223384297.md) overload, running tasks in modern standby is not requested by default.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskbuilder.allowrunningtaskinstandby
     * @type {Boolean} 
     */
    AllowRunningTaskInStandby {
        get => this.get_AllowRunningTaskInStandby()
        set => this.put_AllowRunningTaskInStandby(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [BackgroundTaskBuilder](backgroundtaskbuilder.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundTaskBuilder")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TaskEntryPoint(value) {
        if (!this.HasProp("__IBackgroundTaskBuilder")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskBuilder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskBuilder := IBackgroundTaskBuilder(outPtr)
        }

        return this.__IBackgroundTaskBuilder.put_TaskEntryPoint(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TaskEntryPoint() {
        if (!this.HasProp("__IBackgroundTaskBuilder")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskBuilder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskBuilder := IBackgroundTaskBuilder(outPtr)
        }

        return this.__IBackgroundTaskBuilder.get_TaskEntryPoint()
    }

    /**
     * Sets the event trigger for a background task.
     * @remarks
     * In addition to specifying the type of event trigger for a background task, an application must also enable background tasks that use the event trigger type in the `<Extensions><Extension><BackgroundTasks>` section of its manifest. Valid types include the following:
     * 
     * + `<Task Type="audio"/>`
     * + `<Task Type="timer"/>`
     * + `<Task Type="systemEvent"/>`
     * + `<Task Type="pushNotification"/>`
     * + `<Task Type="realTimeCommunication"/>`
     * 
     * If the background task type is not specified or specified incorrectly in the manifest, calls that attempt to use that kind of background task will fail.
     * 
     * List of triggers:
     * 
     * | Trigger | Description |
     * |----------|---------------|
     * | [ActivitySensorTrigger](activitysensortrigger.md) | Used when your application needs to respond to the activity sensor. |
     * | [AppBroadcastTrigger](appbroadcasttrigger.md) | Trigger a background task to run when an application starts gameplay broadcasting. |
     * | [ApplicationTrigger](applicationtrigger.md) | Trigger a background tasks from within your application. |
     * | [AppointmentStoreNotificationTrigger](appointmentstorenotificationtrigger.md) | Trigger to launch a background task for processing changes to the appointment store. |
     * | [BluetoothLEAdvertisementPublisherTrigger](bluetoothleadvertisementpublishertrigger.md) | Represents a trigger that is registered to advertise a Bluetooth LE advertisement in the background. |
     * | [CachedFileUpdaterTrigger](cachedfileupdatertrigger.md) | Trigger a background task to enable the Cached File Updater contract. |
     * | [ChatMessageNotificationTrigger](chatmessagenotificationtrigger.md) | Represents a trigger that is activated when there is a notification for a text message. |
     * | [ChatMessageReceivedNotificationTrigger](chatmessagereceivednotificationtrigger.md) | Represents a trigger that launches a background task that handles any incoming message that might need to be filtered according to its content. |
     * | [CommunicaionBlockingAppSetAsActiveTrigger](communicationblockingappsetasactivetrigger.md) | Represents a trigger to activate a communication blocking application when it is selected as the preferred blocking app. |
     * | [ContactStoreNotificationTrigger](contactstorenotificationtrigger.md) | Represents a trigger that launches a background task for processing changes to the contacts store. |
     * | [ContentPrefetchTrigger](contentprefetchtrigger.md) | Provides the ability to run custom handlers when prefetching web resources. |
     * | [CustomSystemEventTrigger](customsystemeventtrigger.md) | A custom system trigger that you can define . |
     * | [DeviceConnectionChangeTrigger](deviceconnectionchangetrigger.md) | Represents an event that an application can trigger to initiate a long-running update (firmware or settings) of a device. |
     * | [DeviceManufacturerNotificationTrigger](devicemanufacturernotificationtrigger.md) | Represents an event that an application can trigger to initiate a long-running update (firmware or settings) of a device. |
     * | [DeviceUseTrigger](deviceusetrigger.md) | Represents an event that a Windows Runtime app can trigger to initiate a long-running operation with a device or sensor. |
     * | [EmailStoreNotificationTrigger](emailstorenotificationtrigger.md) | Represents a trigger that enables notification of changes to the email store. |
     * | [GattCharacteristicNotificationTrigger](gattcharacteristicnotificationtrigger.md) | Represents a trigger that launches a background task when an incoming change notification is received for a Bluetooth LE GATT characteristic. |
     * | [GattServiceProviderTrigger](gattserviceprovidertrigger.md) | Constructs a Generic Attributes (GATT) service that can be persisted in the background. |
     * | [GeovisitTrigger](geovisittrigger.md) | Represents an event that triggers a Visits-related background task. |
     * | [LocationTrigger](locationtrigger.md) | Represents a location event that triggers a background task. This is used for Geofencing. |
     * | [MaintenanceTrigger](maintenancetrigger.md) | Represents a maintenance trigger which runs only when the system is connected to AC power. |
     * | [MediaProcessingTrigger](mediaprocessingtrigger.md) | Represents a trigger that launches a background task for performing media processing. |
     * | [MobileBroadbandDeviceServiceNotificationTrigger](mobilebroadbanddeviceservicenotificationtrigger.md) | Represents a trigger that activates when the network sends SIM tool commands. Apps receiving this notification then process the SIM tool commands. |
     * | [MobileBroadbandPcoDataChangeTrigger](mobilebroadbandpcodatachangetrigger.md) | Represents a cellular protocol configuration option change event that triggers a background task to run. |
     * | [MobileBroadbandPinLockStateChangeTrigger](mobilebroadbandpinlockstatechangetrigger.md) | Represents a trigger that indicates when the SIM PIN lock state has changed. |
     * | [MobileBroadbandRadioStateChangeTrigger](mobilebroadbandradiostatechangetrigger.md) | Represents a trigger that indicates when mobile broadband radio state has changed. For example, this trigger activates when a mobile device transitions to or from airplane mode. |
     * | [MobileBroadbandRegistrationStateChangeTrigger](mobilebroadbandregistrationstatechangetrigger.md) | Represents a trigger that indicates when mobile broadband registration state has changed. For example, this trigger activates when a mobile device transitions to or from Roaming. |
     * | [NetworkOperatorDataUsageTrigger](networkoperatordatausagetrigger.md) | Represents a trigger that launches a background task when the local data counters estimate that usage (bytes sent and received) on the mobile broadband interface has changed by an actionable threshold. |
     * | [NetworkOperatorHotspotAuthenticationTrigger](networkoperatorhotspotauthenticationtrigger.md) | Represents a mobile network operator hotspot authentication trigger. |
     * | [NetworkOperatorNotificationTrigger](networkoperatornotificationtrigger.md) | Represents a mobile network operator notification trigger. |
     * | [PaymentAppCanMakePaymentTrigger](paymentappcanmakepaymenttrigger.md) | Represents a PaymentAppCanMakePayment trigger. |
     * | [PhoneTrigger](phonetrigger.md) | Represents a phone event that triggers a background task. |
     * | [PushNotificationTrigger](pushnotificationtrigger.md) | Represents a trigger that invokes a background work item on the app in response to the receipt of a raw notification. |
     * | [RcsEndUserMessageAvailableTrigger](rcsendusermessageavailabletrigger.md) | Represents a trigger that launches a background task when a new Rich Communication Services (RCS) message is available. |
     * | [RfcommConnectionTrigger](rfcommconnectiontrigger.md) | Represents a trigger that launches a background task when an RFCOMM inbound or outbound connections are established. |
     * | [SecondaryAuthenticationFactorAuthenticationTrigger](secondaryauthenticationfactorauthenticationtrigger.md) | Represents a trigger that launches a background task on behalf of a companion device. |
     * | [SensorDataThresholdTrigger](sensordatathresholdtrigger.md) | Represents a trigger that responds when a threshold limit for a sensor is crossed. |
     * | [SmartCardTrigger](smartcardtrigger.md) | Represents an event triggered by a smart card. |
     * | [SmsMessageReceivedTrigger](smsmessagereceivedtrigger.md) | Represents a trigger that is raised when an SMS message has arrived. |
     * | [SocketActivityTrigger](socketactivitytrigger.md) | Represents a trigger that launches a background task for handling socket activity. |
     * | [StorageLibraryChangeTrackerTrigger](storagelibrarychangetrackertrigger.md) | Represents a file change within a StorageFolder that triggers a background task to run. |
     * | [StorageLibraryContentChangedTrigger](storagelibrarycontentchangedtrigger.md) | Creates a trigger that will fire when a file is changed in a specified library. |
     * | [SystemCondition](systemcondition.md) | Represents a system condition that must be in effect for a background task to run. |
     * | [SystemTrigger](systemtrigger.md) | Represents a system event that triggers a background task to run. |
     * | [TetheringEntitlementCheckTrigger](tetheringentitlementchecktrigger.md) | Represents a tethering event that triggers a background task to run. |
     * | [TimeTrigger](timetrigger.md) | Represents a time event that triggers a background task to run. |
     * | [ToastNotificationActionTrigger](toastnotificationactiontrigger.md) | Represents an event that causes a background task to run when the user performs an action on an interactive toast notification. |
     * | [ToastNotificationHistoryChangedTrigger](toastnotificationhistorychangedtrigger.md) | Represents an event that causes a background task to run when the history of toast notifications for the app is cleared, when one or more toast notifications are added to or removed from the notification history for the app, or when one or more toast notifications for the app expire and are removed from the notification history. |
     * | [UserNotificationChangedTrigger](usernotificationchangedtrigger.md) | Represents a trigger that fires when a UserNotification is added or removed. |
     * @param {IBackgroundTrigger} trigger An instance of an event trigger object such as a [SystemTrigger](systemtrigger.md), [TimeTrigger](timetrigger.md), or [NetworkOperatorNotificationTrigger](networkoperatornotificationtrigger.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskbuilder.settrigger
     */
    SetTrigger(trigger) {
        if (!this.HasProp("__IBackgroundTaskBuilder")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskBuilder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskBuilder := IBackgroundTaskBuilder(outPtr)
        }

        return this.__IBackgroundTaskBuilder.SetTrigger(trigger)
    }

    /**
     * Adds a condition to a background task.
     * @remarks
     * AddCondition can be called more than once to specify more than one condition for a background task. All specified conditions must be met before the system will schedule the task.
     * @param {IBackgroundCondition} condition An instance of a [SystemCondition](systemcondition.md) object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskbuilder.addcondition
     */
    AddCondition(condition) {
        if (!this.HasProp("__IBackgroundTaskBuilder")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskBuilder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskBuilder := IBackgroundTaskBuilder(outPtr)
        }

        return this.__IBackgroundTaskBuilder.AddCondition(condition)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IBackgroundTaskBuilder")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskBuilder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskBuilder := IBackgroundTaskBuilder(outPtr)
        }

        return this.__IBackgroundTaskBuilder.put_Name(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IBackgroundTaskBuilder")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskBuilder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskBuilder := IBackgroundTaskBuilder(outPtr)
        }

        return this.__IBackgroundTaskBuilder.get_Name()
    }

    /**
     * Registers a background task with the specified task name with the system.
     * @remarks
     * When using this **BackgroundTaskBuilder.Register(string)** overload, running tasks in modern standby is not requested by default.
     * 
     * The task must have an event trigger for the **Register** method to succeed. The system schedules the background task when its trigger event occurs and all of its conditions have been met.
     * 
     * If there are existing background task registrations with the same name, they are unregistered before registering this new task. This method permits multiple threads to concurrently register tasks with the same name using this method, and that may result in duplicate background task registrations. Use care (e.g., appropriate locking) when invoking this method concurrently. Duplicate registrations may cause task instances to execute concurrently.
     * 
     * An out-of-process background task must also specify a task entry point. A Win32 COM background task must specify a task entry point CLSID using [SetTaskEntryPointClsid(GUID)](backgroundtaskbuilder_settaskentrypointclsid_451828578.md).
     * 
     * See [Create and register an in-process background task](/windows/uwp/launch-resume/create-and-register-an-inproc-background-task), [Create and register an out-of-process background task](/windows/uwp/launch-resume/create-and-register-a-background-task), and [Create and register a Win32 COM background task](/windows/uwp/launch-resume/create-and-register-a-winmain-background-task) for details about registering each kind of task.
     * @returns {BackgroundTaskRegistration} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskbuilder.register
     */
    Register() {
        if (!this.HasProp("__IBackgroundTaskBuilder")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskBuilder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskBuilder := IBackgroundTaskBuilder(outPtr)
        }

        return this.__IBackgroundTaskBuilder.Register()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CancelOnConditionLoss(value) {
        if (!this.HasProp("__IBackgroundTaskBuilder2")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskBuilder2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskBuilder2 := IBackgroundTaskBuilder2(outPtr)
        }

        return this.__IBackgroundTaskBuilder2.put_CancelOnConditionLoss(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CancelOnConditionLoss() {
        if (!this.HasProp("__IBackgroundTaskBuilder2")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskBuilder2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskBuilder2 := IBackgroundTaskBuilder2(outPtr)
        }

        return this.__IBackgroundTaskBuilder2.get_CancelOnConditionLoss()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsNetworkRequested(value) {
        if (!this.HasProp("__IBackgroundTaskBuilder3")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskBuilder3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskBuilder3 := IBackgroundTaskBuilder3(outPtr)
        }

        return this.__IBackgroundTaskBuilder3.put_IsNetworkRequested(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsNetworkRequested() {
        if (!this.HasProp("__IBackgroundTaskBuilder3")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskBuilder3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskBuilder3 := IBackgroundTaskBuilder3(outPtr)
        }

        return this.__IBackgroundTaskBuilder3.get_IsNetworkRequested()
    }

    /**
     * 
     * @returns {BackgroundTaskRegistrationGroup} 
     */
    get_TaskGroup() {
        if (!this.HasProp("__IBackgroundTaskBuilder4")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskBuilder4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskBuilder4 := IBackgroundTaskBuilder4(outPtr)
        }

        return this.__IBackgroundTaskBuilder4.get_TaskGroup()
    }

    /**
     * 
     * @param {BackgroundTaskRegistrationGroup} value 
     * @returns {HRESULT} 
     */
    put_TaskGroup(value) {
        if (!this.HasProp("__IBackgroundTaskBuilder4")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskBuilder4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskBuilder4 := IBackgroundTaskBuilder4(outPtr)
        }

        return this.__IBackgroundTaskBuilder4.put_TaskGroup(value)
    }

    /**
     * Assigns a COM CLSID entry point using an existing BackgroundTaskBuilder object.
     * @remarks
     * For classic COM CLSID activations, the CLSID to activate is specified via SetTaskEntryPointClsid method during registration. The COM registration must identify an out-of-process COM server (i.e. LocalServer32).
     * @param {Guid} TaskEntryPoint The name of the application-defined TaskEntryPoint class.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskbuilder.settaskentrypointclsid
     */
    SetTaskEntryPointClsid(TaskEntryPoint) {
        if (!this.HasProp("__IBackgroundTaskBuilder5")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskBuilder5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskBuilder5 := IBackgroundTaskBuilder5(outPtr)
        }

        return this.__IBackgroundTaskBuilder5.SetTaskEntryPointClsid(TaskEntryPoint)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowRunningTaskInStandby() {
        if (!this.HasProp("__IBackgroundTaskBuilder6")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskBuilder6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskBuilder6 := IBackgroundTaskBuilder6(outPtr)
        }

        return this.__IBackgroundTaskBuilder6.get_AllowRunningTaskInStandby()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowRunningTaskInStandby(value) {
        if (!this.HasProp("__IBackgroundTaskBuilder6")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskBuilder6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskBuilder6 := IBackgroundTaskBuilder6(outPtr)
        }

        return this.__IBackgroundTaskBuilder6.put_AllowRunningTaskInStandby(value)
    }

    /**
     * Validates the background task that has been configured with the [SetTrigger](backgroundtaskbuilder_settrigger_2125876510.md) method. This method is called by the system to determine whether the background task meets the requirements to run.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskbuilder.validate
     */
    Validate() {
        if (!this.HasProp("__IBackgroundTaskBuilder6")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskBuilder6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskBuilder6 := IBackgroundTaskBuilder6(outPtr)
        }

        return this.__IBackgroundTaskBuilder6.Validate()
    }

    /**
     * Registers a background task with the system.
     * @remarks
     * The task must have an event trigger for the Register method to succeed. The system schedules the background task when its trigger event occurs and all of its conditions have been met.
     * 
     * An out-of-process background task must also specify a task entry point. See [Create and register an in-process background task](/windows/uwp/launch-resume/create-and-register-an-inproc-background-task) and [Create and register an out-of-process background task](/windows/uwp/launch-resume/create-and-register-a-background-task) for details about registering each kind of task.
     * @param {HSTRING} taskName 
     * @returns {BackgroundTaskRegistration} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskbuilder.register
     */
    Register1(taskName) {
        if (!this.HasProp("__IBackgroundTaskBuilder6")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskBuilder6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskBuilder6 := IBackgroundTaskBuilder6(outPtr)
        }

        return this.__IBackgroundTaskBuilder6.Register(taskName)
    }

;@endregion Instance Methods
}
