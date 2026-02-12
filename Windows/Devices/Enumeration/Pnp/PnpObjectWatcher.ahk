#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPnpObjectWatcher.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\PnpObjectWatcher.ahk
#Include .\PnpObject.ahk
#Include .\PnpObjectUpdate.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * > [!IMPORTANT]
  * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
  * >
  * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
  * 
  * Raises events to notify the client that a [PnpObject](pnpobject.md) has been added, updated, or removed from an enumerated collection of Pnp device objects in an incremental and asynchronous way.
 * @remarks
 * An app calls [Start](pnpobjectwatcher_start_1587696324.md) to begin the search for devices. During this initial enumeration, the PnpObjectWatcher raises an [Added](pnpobjectwatcher_added.md) event for each device that's found, until all devices are found. The PnpObjectWatcher raises an [EnumerationCompleted](pnpobjectwatcher_enumerationcompleted.md) event when the initial enumeration is complete, and continues to raise events if a device is added, updated, or removed.
 * 
 * The following diagram shows how the PnpObjectWatcher transitions between the states represented by [DeviceWatcherStatus](../windows.devices.enumeration/devicewatcherstatus.md) enumeration.
 * 
 * <img src="images/statediagram.png" alt="state diagram of DeviceWatcher states"></img>
 * 
 * The [Start](pnpobjectwatcher_start_1587696324.md) method can only be called when the PnpObjectWatcher is in the **Created**, **Stopped** or **Aborted** state. The [Status](pnpobjectwatcher_status.md) property indicates the PnpObjectWatcher state. When re-starting the watcher, wait for the [Stopped](pnpobjectwatcher_stopped.md) event before calling [Start](pnpobjectwatcher_start_1587696324.md).
 * 
 * A call to [Stop](pnpobjectwatcher_stop_1201535524.md) transitions the PnpObjectWatcher to the **Stopping** state and completes immediately. The watcher will transition to the **Stopped** state once all events that are already in the process of being raised have completed.
 * 
 * After calling [Stop](pnpobjectwatcher_stop_1201535524.md), apps may wait for the [Stopped](pnpobjectwatcher_stopped.md) event if they need to know when the PnpObjectWatcher has stopped. Callers must wait for the [Stopped](pnpobjectwatcher_stopped.md) event before they can call [Start](pnpobjectwatcher_start_1587696324.md) to restart the watcher. Callers may unsubscribe from events if they do not want to receive any additional events after [Stop](pnpobjectwatcher_stop_1201535524.md) but do not want to wait for the [Stopped](pnpobjectwatcher_stopped.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.pnp.pnpobjectwatcher
 * @namespace Windows.Devices.Enumeration.Pnp
 * @version WindowsRuntime 1.4
 */
class PnpObjectWatcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPnpObjectWatcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPnpObjectWatcher.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
     * >
     * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
     * 
     * The status associated with the asynchronous operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.pnp.pnpobjectwatcher.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * > [!IMPORTANT]
     * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
     * >
     * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
     * 
     * Occurs when a [PnpObject](pnpobject.md) is added to the collection enumerated by the [PnpObjectWatcher](pnpobjectwatcher.md).
     * @type {TypedEventHandler<PnpObjectWatcher, PnpObject>}
    */
    OnAdded {
        get {
            if(!this.HasProp("__OnAdded")){
                this.__OnAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d578eed2-58e5-5825-8af2-12f89387b656}"),
                    PnpObjectWatcher,
                    PnpObject
                )
                this.__OnAddedToken := this.add_Added(this.__OnAdded.iface)
            }
            return this.__OnAdded
        }
    }

    /**
     * > [!IMPORTANT]
     * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
     * >
     * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
     * 
     * Occurs when the properties of a [PnpObject](pnpobject.md) in the collection enumerated by the [PnpObjectWatcher](pnpobjectwatcher.md) are updated.
     * @type {TypedEventHandler<PnpObjectWatcher, PnpObjectUpdate>}
    */
    OnUpdated {
        get {
            if(!this.HasProp("__OnUpdated")){
                this.__OnUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{af8f929d-8058-5c38-a3d8-30aa7a08b588}"),
                    PnpObjectWatcher,
                    PnpObjectUpdate
                )
                this.__OnUpdatedToken := this.add_Updated(this.__OnUpdated.iface)
            }
            return this.__OnUpdated
        }
    }

    /**
     * > [!IMPORTANT]
     * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
     * >
     * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
     * 
     * Occurs when a [PnpObject](pnpobject.md) is removed from the collection enumerated by the [PnpObjectWatcher](pnpobjectwatcher.md).
     * @type {TypedEventHandler<PnpObjectWatcher, PnpObjectUpdate>}
    */
    OnRemoved {
        get {
            if(!this.HasProp("__OnRemoved")){
                this.__OnRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{af8f929d-8058-5c38-a3d8-30aa7a08b588}"),
                    PnpObjectWatcher,
                    PnpObjectUpdate
                )
                this.__OnRemovedToken := this.add_Removed(this.__OnRemoved.iface)
            }
            return this.__OnRemoved
        }
    }

    /**
     * > [!IMPORTANT]
     * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
     * >
     * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
     * 
     * Occurs when the enumeration of Pnp device objects has been completed.
     * @type {TypedEventHandler<PnpObjectWatcher, IInspectable>}
    */
    OnEnumerationCompleted {
        get {
            if(!this.HasProp("__OnEnumerationCompleted")){
                this.__OnEnumerationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2ee2b4c9-b696-5ecc-b29b-f1e0ef5fe1f7}"),
                    PnpObjectWatcher,
                    IInspectable
                )
                this.__OnEnumerationCompletedToken := this.add_EnumerationCompleted(this.__OnEnumerationCompleted.iface)
            }
            return this.__OnEnumerationCompleted
        }
    }

    /**
     * > [!IMPORTANT]
     * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
     * >
     * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
     * 
     * Occurs when the [PnpObjectWatcher](pnpobjectwatcher.md) has stopped monitoring changes to the collection of Pnp device objects.
     * @type {TypedEventHandler<PnpObjectWatcher, IInspectable>}
    */
    OnStopped {
        get {
            if(!this.HasProp("__OnStopped")){
                this.__OnStopped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2ee2b4c9-b696-5ecc-b29b-f1e0ef5fe1f7}"),
                    PnpObjectWatcher,
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
     * @param {TypedEventHandler<PnpObjectWatcher, PnpObject>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Added(handler) {
        if (!this.HasProp("__IPnpObjectWatcher")) {
            if ((queryResult := this.QueryInterface(IPnpObjectWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPnpObjectWatcher := IPnpObjectWatcher(outPtr)
        }

        return this.__IPnpObjectWatcher.add_Added(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Added(token) {
        if (!this.HasProp("__IPnpObjectWatcher")) {
            if ((queryResult := this.QueryInterface(IPnpObjectWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPnpObjectWatcher := IPnpObjectWatcher(outPtr)
        }

        return this.__IPnpObjectWatcher.remove_Added(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PnpObjectWatcher, PnpObjectUpdate>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Updated(handler) {
        if (!this.HasProp("__IPnpObjectWatcher")) {
            if ((queryResult := this.QueryInterface(IPnpObjectWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPnpObjectWatcher := IPnpObjectWatcher(outPtr)
        }

        return this.__IPnpObjectWatcher.add_Updated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Updated(token) {
        if (!this.HasProp("__IPnpObjectWatcher")) {
            if ((queryResult := this.QueryInterface(IPnpObjectWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPnpObjectWatcher := IPnpObjectWatcher(outPtr)
        }

        return this.__IPnpObjectWatcher.remove_Updated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PnpObjectWatcher, PnpObjectUpdate>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Removed(handler) {
        if (!this.HasProp("__IPnpObjectWatcher")) {
            if ((queryResult := this.QueryInterface(IPnpObjectWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPnpObjectWatcher := IPnpObjectWatcher(outPtr)
        }

        return this.__IPnpObjectWatcher.add_Removed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Removed(token) {
        if (!this.HasProp("__IPnpObjectWatcher")) {
            if ((queryResult := this.QueryInterface(IPnpObjectWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPnpObjectWatcher := IPnpObjectWatcher(outPtr)
        }

        return this.__IPnpObjectWatcher.remove_Removed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PnpObjectWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EnumerationCompleted(handler) {
        if (!this.HasProp("__IPnpObjectWatcher")) {
            if ((queryResult := this.QueryInterface(IPnpObjectWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPnpObjectWatcher := IPnpObjectWatcher(outPtr)
        }

        return this.__IPnpObjectWatcher.add_EnumerationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EnumerationCompleted(token) {
        if (!this.HasProp("__IPnpObjectWatcher")) {
            if ((queryResult := this.QueryInterface(IPnpObjectWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPnpObjectWatcher := IPnpObjectWatcher(outPtr)
        }

        return this.__IPnpObjectWatcher.remove_EnumerationCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PnpObjectWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Stopped(handler) {
        if (!this.HasProp("__IPnpObjectWatcher")) {
            if ((queryResult := this.QueryInterface(IPnpObjectWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPnpObjectWatcher := IPnpObjectWatcher(outPtr)
        }

        return this.__IPnpObjectWatcher.add_Stopped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Stopped(token) {
        if (!this.HasProp("__IPnpObjectWatcher")) {
            if ((queryResult := this.QueryInterface(IPnpObjectWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPnpObjectWatcher := IPnpObjectWatcher(outPtr)
        }

        return this.__IPnpObjectWatcher.remove_Stopped(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IPnpObjectWatcher")) {
            if ((queryResult := this.QueryInterface(IPnpObjectWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPnpObjectWatcher := IPnpObjectWatcher(outPtr)
        }

        return this.__IPnpObjectWatcher.get_Status()
    }

    /**
     * > [!IMPORTANT]
     * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
     * >
     * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
     * 
     * Starts raising the events to inform the client that a [PnpObject](pnpobject.md) has been added, updated, or removed.
     * @remarks
     * An app calls Start to begin the search for devices. During this initial enumeration, the [PnpObjectWatcher](pnpobjectwatcher.md) raises an [Added](pnpobjectwatcher_added.md) event for each device that's found, until all devices are found. The [PnpObjectWatcher](pnpobjectwatcher.md) raises an [EnumerationCompleted](pnpobjectwatcher_enumerationcompleted.md) event when the initial enumeration is complete, and continues to raise events if a device is added, updated, or removed.
     * 
     * The Start method can only be called when the [PnpObjectWatcher](pnpobjectwatcher.md) is in the **Created**, **Stopped** or **Aborted** state. The [Status](pnpobjectwatcher_status.md) property indicates the [PnpObjectWatcher](pnpobjectwatcher.md) state. When re-starting the watcher, wait for the [Stopped](pnpobjectwatcher_stopped.md) event before calling Start.
     * 
     * The following diagram shows how the [PnpObjectWatcher](pnpobjectwatcher.md) transitions between the states represented by [DeviceWatcherStatus](../windows.devices.enumeration/devicewatcherstatus.md) enumeration.
     * 
     * <img src="images/statediagram.png" alt="state diagram of DeviceWatcher states"></img>
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.pnp.pnpobjectwatcher.start
     */
    Start() {
        if (!this.HasProp("__IPnpObjectWatcher")) {
            if ((queryResult := this.QueryInterface(IPnpObjectWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPnpObjectWatcher := IPnpObjectWatcher(outPtr)
        }

        return this.__IPnpObjectWatcher.Start()
    }

    /**
     * > [!IMPORTANT]
     * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
     * >
     * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
     * 
     * Stops raising the events to inform the client that a [PnpObject](pnpobject.md) has been added, updated, or removed.
     * @remarks
     * To stop a search for devices, an app calls Stop.
     * 
     * This call transitions the [PnpObjectWatcher](pnpobjectwatcher.md) to the **Stopping** state and completes immediately. The watcher will transition to the **Stopped** state once all events that are already in the process of being raised have completed.
     * 
     * Callers may wait for the [Stopped](pnpobjectwatcher_stopped.md) event if they need to know when the [PnpObjectWatcher](pnpobjectwatcher.md) has stopped. Callers must wait for the [Stopped](pnpobjectwatcher_stopped.md) event before they can call [Start](pnpobjectwatcher_start_1587696324.md) to restart the watcher. Callers may unsubscribe from events if they do not want to receive any additional events after Stop but do not want to wait for the [Stopped](pnpobjectwatcher_stopped.md) event.
     * 
     * The following diagram shows how the [PnpObjectWatcher](pnpobjectwatcher.md) transitions between the states represented by [DeviceWatcherStatus](../windows.devices.enumeration/devicewatcherstatus.md) enumeration.
     * 
     * <img src="images/statediagram.png" alt="state diagram of DeviceWatcher states"></img>
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.pnp.pnpobjectwatcher.stop
     */
    Stop() {
        if (!this.HasProp("__IPnpObjectWatcher")) {
            if ((queryResult := this.QueryInterface(IPnpObjectWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPnpObjectWatcher := IPnpObjectWatcher(outPtr)
        }

        return this.__IPnpObjectWatcher.Stop()
    }

;@endregion Instance Methods
}
