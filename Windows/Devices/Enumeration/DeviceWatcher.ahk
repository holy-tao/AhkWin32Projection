#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeviceWatcher.ahk
#Include .\IDeviceWatcher2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\DeviceWatcher.ahk
#Include .\DeviceInformation.ahk
#Include .\DeviceInformationUpdate.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Enumerates devices dynamically, so that the app receives notifications if devices are added, removed, or changed after the initial enumeration is complete.
 * @remarks
 * An app calls [Start](devicewatcher_start_1587696324.md) to begin the search for devices. During this initial enumeration, the DeviceWatcher raises an [Added](devicewatcher_added.md) event for each device that's found, until all devices are found. The DeviceWatcher raises an [EnumerationCompleted](devicewatcher_enumerationcompleted.md) event when the initial enumeration is complete, and continues to raise events if a device is added, updated, or removed.
 * 
 * The following diagram shows how the DeviceWatcher transitions between the states represented by [DeviceWatcherStatus](devicewatcherstatus.md) enumeration.
 * 
 * <img src="images/statediagram.png" alt="state diagram of DeviceWatcher states"></img>
 * 
 * The [Start](devicewatcher_start_1587696324.md) method can only be called when the DeviceWatcher is in the **Created**, **Stopped** or **Aborted** state. The [Status](devicewatcher_status.md) property indicates the DeviceWatcher state. When re-starting the watcher, wait for the [Stopped](devicewatcher_stopped.md) event before calling [Start](devicewatcher_start_1587696324.md).
 * 
 * [Stop](devicewatcher_stop_1201535524.md) transitions the DeviceWatcher to the **Stopping** state and completes immediately. The watcher will transition to the **Stopped** state once all events that are already in the process of being raised have completed.
 * 
 * Apps may wait for the [Stopped](devicewatcher_stopped.md) event if they need to know when the DeviceWatcher has stopped. Callers must wait for the [Stopped](devicewatcher_stopped.md) event before they can call [Start](devicewatcher_start_1587696324.md) to restart the watcher. Callers may unsubscribe from events if they do not want to receive any additional events after [Stop](devicewatcher_stop_1201535524.md) but do not want to wait for the [Stopped](devicewatcher_stopped.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicewatcher
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DeviceWatcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeviceWatcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeviceWatcher.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The status of the [DeviceWatcher](devicewatcher.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicewatcher.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Event that is raised when a device is added to the collection enumerated by the [DeviceWatcher](devicewatcher.md).
     * @remarks
     * > [!NOTE]
     * > An app must subscribe to all of the added, [removed](devicewatcher_removed.md), and [updated](devicewatcher_updated.md) events to be notified when there are device additions, removals or updates. If an app handles only the added event, it will not receive an update if a device is added to the system after the initial device enumeration completes.
     * @type {TypedEventHandler<DeviceWatcher, DeviceInformation>}
    */
    OnAdded {
        get {
            if(!this.HasProp("__OnAdded")){
                this.__OnAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{03c5a07b-990c-5d09-b0b8-5734eaa38222}"),
                    DeviceWatcher,
                    DeviceInformation
                )
                this.__OnAddedToken := this.add_Added(this.__OnAdded.iface)
            }
            return this.__OnAdded
        }
    }

    /**
     * Event that is raised when a device is updated in the collection of enumerated devices.
     * @remarks
     * > [!NOTE]
     * > An app must subscribe to all of the [added](devicewatcher_added.md), [removed](devicewatcher_removed.md), and updated events to be notified when there are device additions, removals or updates. If an app handles only the [added](devicewatcher_added.md) event, it will not receive an update if a device is added to the system after the initial device enumeration completes.
     * @type {TypedEventHandler<DeviceWatcher, DeviceInformationUpdate>}
    */
    OnUpdated {
        get {
            if(!this.HasProp("__OnUpdated")){
                this.__OnUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{906f1254-79ad-54fc-93c4-cdb99b437899}"),
                    DeviceWatcher,
                    DeviceInformationUpdate
                )
                this.__OnUpdatedToken := this.add_Updated(this.__OnUpdated.iface)
            }
            return this.__OnUpdated
        }
    }

    /**
     * Event that is raised when a device is removed from the collection of enumerated devices.
     * @remarks
     * > [!NOTE]
     * > An app must subscribe to all of the [added](devicewatcher_added.md), removed, and [updated](devicewatcher_updated.md) events to be notified when there are device additions, removals or updates. If an app handles only the [added](devicewatcher_added.md) event, it will not receive an update if a device is added to the system after the initial device enumeration completes.
     * @type {TypedEventHandler<DeviceWatcher, DeviceInformationUpdate>}
    */
    OnRemoved {
        get {
            if(!this.HasProp("__OnRemoved")){
                this.__OnRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{906f1254-79ad-54fc-93c4-cdb99b437899}"),
                    DeviceWatcher,
                    DeviceInformationUpdate
                )
                this.__OnRemovedToken := this.add_Removed(this.__OnRemoved.iface)
            }
            return this.__OnRemoved
        }
    }

    /**
     * Event that is raised when the enumeration of devices completes.
     * @type {TypedEventHandler<DeviceWatcher, IInspectable>}
    */
    OnEnumerationCompleted {
        get {
            if(!this.HasProp("__OnEnumerationCompleted")){
                this.__OnEnumerationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9234630f-1ff4-54f6-9e3f-ac20369b7725}"),
                    DeviceWatcher,
                    IInspectable
                )
                this.__OnEnumerationCompletedToken := this.add_EnumerationCompleted(this.__OnEnumerationCompleted.iface)
            }
            return this.__OnEnumerationCompleted
        }
    }

    /**
     * Event that is raised when the enumeration operation has been stopped.
     * @type {TypedEventHandler<DeviceWatcher, IInspectable>}
    */
    OnStopped {
        get {
            if(!this.HasProp("__OnStopped")){
                this.__OnStopped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9234630f-1ff4-54f6-9e3f-ac20369b7725}"),
                    DeviceWatcher,
                    IInspectable
                )
                this.__OnStoppedToken := this.add_Stopped(this.__OnStopped.iface)
            }
            return this.__OnStopped
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAddedToken")) {
            this.remove_Added(this.__OnAddedToken)
            this.__OnAdded.iface.Dispose()
        }

        if(this.HasProp("__OnUpdatedToken")) {
            this.remove_Updated(this.__OnUpdatedToken)
            this.__OnUpdated.iface.Dispose()
        }

        if(this.HasProp("__OnRemovedToken")) {
            this.remove_Removed(this.__OnRemovedToken)
            this.__OnRemoved.iface.Dispose()
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
     * @param {TypedEventHandler<DeviceWatcher, DeviceInformation>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Added(handler) {
        if (!this.HasProp("__IDeviceWatcher")) {
            if ((queryResult := this.QueryInterface(IDeviceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceWatcher := IDeviceWatcher(outPtr)
        }

        return this.__IDeviceWatcher.add_Added(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Added(token) {
        if (!this.HasProp("__IDeviceWatcher")) {
            if ((queryResult := this.QueryInterface(IDeviceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceWatcher := IDeviceWatcher(outPtr)
        }

        return this.__IDeviceWatcher.remove_Added(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DeviceWatcher, DeviceInformationUpdate>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Updated(handler) {
        if (!this.HasProp("__IDeviceWatcher")) {
            if ((queryResult := this.QueryInterface(IDeviceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceWatcher := IDeviceWatcher(outPtr)
        }

        return this.__IDeviceWatcher.add_Updated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Updated(token) {
        if (!this.HasProp("__IDeviceWatcher")) {
            if ((queryResult := this.QueryInterface(IDeviceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceWatcher := IDeviceWatcher(outPtr)
        }

        return this.__IDeviceWatcher.remove_Updated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DeviceWatcher, DeviceInformationUpdate>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Removed(handler) {
        if (!this.HasProp("__IDeviceWatcher")) {
            if ((queryResult := this.QueryInterface(IDeviceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceWatcher := IDeviceWatcher(outPtr)
        }

        return this.__IDeviceWatcher.add_Removed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Removed(token) {
        if (!this.HasProp("__IDeviceWatcher")) {
            if ((queryResult := this.QueryInterface(IDeviceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceWatcher := IDeviceWatcher(outPtr)
        }

        return this.__IDeviceWatcher.remove_Removed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DeviceWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EnumerationCompleted(handler) {
        if (!this.HasProp("__IDeviceWatcher")) {
            if ((queryResult := this.QueryInterface(IDeviceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceWatcher := IDeviceWatcher(outPtr)
        }

        return this.__IDeviceWatcher.add_EnumerationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EnumerationCompleted(token) {
        if (!this.HasProp("__IDeviceWatcher")) {
            if ((queryResult := this.QueryInterface(IDeviceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceWatcher := IDeviceWatcher(outPtr)
        }

        return this.__IDeviceWatcher.remove_EnumerationCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DeviceWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Stopped(handler) {
        if (!this.HasProp("__IDeviceWatcher")) {
            if ((queryResult := this.QueryInterface(IDeviceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceWatcher := IDeviceWatcher(outPtr)
        }

        return this.__IDeviceWatcher.add_Stopped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Stopped(token) {
        if (!this.HasProp("__IDeviceWatcher")) {
            if ((queryResult := this.QueryInterface(IDeviceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceWatcher := IDeviceWatcher(outPtr)
        }

        return this.__IDeviceWatcher.remove_Stopped(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IDeviceWatcher")) {
            if ((queryResult := this.QueryInterface(IDeviceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceWatcher := IDeviceWatcher(outPtr)
        }

        return this.__IDeviceWatcher.get_Status()
    }

    /**
     * Starts a search for devices, and subscribes to device enumeration events.
     * @remarks
     * An app calls Start to begin the search for devices. During this initial enumeration, the [DeviceWatcher](devicewatcher.md) raises an [Added](devicewatcher_added.md) event for each device that's found, until all devices are found. The [DeviceWatcher](devicewatcher.md) raises an [EnumerationCompleted](devicewatcher_enumerationcompleted.md) event when the initial enumeration is complete, and continues to raise events if a device is added, updated, or removed.
     * 
     * The Start method can only be called when the [DeviceWatcher](devicewatcher.md) is in the **Created**, **Stopped** or **Aborted** state. The [Status](devicewatcher_status.md) property indicates the [DeviceWatcher](devicewatcher.md) state. When re-starting the watcher, wait for the [Stopped](devicewatcher_stopped.md) event before calling Start. The following diagram shows how the [DeviceWatcher](devicewatcher.md) transitions between the states represented by [DeviceWatcherStatus](devicewatcherstatus.md) enumeration.
     * 
     * <img src="images/statediagram.png" alt="state diagram of DeviceWatcher states"/>
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicewatcher.start
     */
    Start() {
        if (!this.HasProp("__IDeviceWatcher")) {
            if ((queryResult := this.QueryInterface(IDeviceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceWatcher := IDeviceWatcher(outPtr)
        }

        return this.__IDeviceWatcher.Start()
    }

    /**
     * Stop raising the events that add, update and remove enumeration results.
     * @remarks
     * To stop a search for devices, an app calls Stop and enters the **Stopping** state. The [Stopped](devicewatcher_stopped.md) event is raised when the Stop operation completes and the [DeviceWatcher](devicewatcher.md) enters the **Stopped** state.
     * 
     * The following diagram shows how the [DeviceWatcher](devicewatcher.md) transitions between the states represented by [DeviceWatcherStatus](devicewatcherstatus.md) enumeration.
     * 
     * <img src="images/statediagram.png" alt="state diagram of DeviceWatcher states"></img>
     * 
     * This call transitions the [DeviceWatcher](devicewatcher.md) to the **Stopping** state and completes immediately. The watcher will transition to the **Stopped** state once all events that are already in the process of being raised have completed.
     * 
     * Callers may wait for the [Stopped](devicewatcher_stopped.md) event if they need to know when the [DeviceWatcher](devicewatcher.md) has stopped. Callers must wait for the [Stopped](devicewatcher_stopped.md) event before they can call [Start](devicewatcher_start_1587696324.md) to restart the watcher. Callers may unsubscribe from events if they do not want to receive any additional events after Stop but do not want to wait for the [Stopped](devicewatcher_stopped.md) event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicewatcher.stop
     */
    Stop() {
        if (!this.HasProp("__IDeviceWatcher")) {
            if ((queryResult := this.QueryInterface(IDeviceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceWatcher := IDeviceWatcher(outPtr)
        }

        return this.__IDeviceWatcher.Stop()
    }

    /**
     * Gets a [DeviceWatcherTrigger](../windows.applicationmodel.background/devicewatchertrigger.md) object monitoring for changes to the list of devices.
     * @param {IIterable<Integer>} requestedEventKinds A list of the specific updates you want to monitor.
     * @returns {DeviceWatcherTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicewatcher.getbackgroundtrigger
     */
    GetBackgroundTrigger(requestedEventKinds) {
        if (!this.HasProp("__IDeviceWatcher2")) {
            if ((queryResult := this.QueryInterface(IDeviceWatcher2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceWatcher2 := IDeviceWatcher2(outPtr)
        }

        return this.__IDeviceWatcher2.GetBackgroundTrigger(requestedEventKinds)
    }

;@endregion Instance Methods
}
