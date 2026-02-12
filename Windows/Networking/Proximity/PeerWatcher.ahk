#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPeerWatcher.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PeerWatcher.ahk
#Include .\PeerInformation.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Dynamically discovers peer apps within wireless range.
 * @remarks
 * You can use the [FindAllPeersAsync](peerfinder_findallpeersasync_830195586.md) method to get a list of all peers within range. However, the [FindAllPeersAsync](peerfinder_findallpeersasync_830195586.md) method scans for peers once and then completes. Alternatively, you can use the PeerWatcher class to scan for peers and get updates as they are found and incrementally update your list of available peer apps. The PeerWatcher continuously scans for new peer apps within range and removes stale peer apps. You can update your list of peer apps by handling the [Added](peerwatcher_added.md) event, which occurs when a new peer app is found, and the [Removed](peerwatcher_removed.md) event which occurs when a stale peer app is removed. The PeerWatcher continues to scan until you call the Stop method, or the [PeerFinder.FindAllPeersAsync ](peerfinder_findallpeersasync_830195586.md) or [PeerFinder.ConnectAsync](peerfinder_connectasync_380619906.md) methods.
 * 
 * To create an instance of the PeerWatcher class, call the [PeerFinder.Start](peerfinder_start_119778276.md) method, and then call the [CreateWatcher](peerfinder_createwatcher_1506431823.md) method.
 * 
 * [!code-csharp[_StartPeerWatcher](../windows.networking.proximity/code/Proximity_PeerWatcher/cs/MainPage.xaml.cs#Snippet_StartPeerWatcher)]
 * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerwatcher
 * @namespace Windows.Networking.Proximity
 * @version WindowsRuntime 1.4
 */
class PeerWatcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPeerWatcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPeerWatcher.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current state of the [PeerWatcher](peerwatcher.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerwatcher.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Occurs when a peer app is found within wireless range.
     * @remarks
     * After you start the [PeerWatcher](peerwatcher.md)by calling the [Start](peerfinder_start_119778276.md)method, the Addedevent is raised for each peer app found within wireless range. The [PeerWatcher](peerwatcher.md)continues scanning for peer apps within range until you call the [Stop](peerwatcher_stop_1201535524.md)method. Using the Addedevent, you can display peer apps to the user as they are found.
     * 
     * [!code-csharp[_StartPeerWatcher](../windows.networking.proximity/code/Proximity_PeerWatcher/cs/MainPage.xaml.cs#Snippet_StartPeerWatcher)]
     * 
     * [!code-csharp[_PeerWatcherAdded](../windows.networking.proximity/code/Proximity_PeerWatcher/cs/MainPage.xaml.cs#Snippet_PeerWatcherAdded)]
     * @type {TypedEventHandler<PeerWatcher, PeerInformation>}
    */
    OnAdded {
        get {
            if(!this.HasProp("__OnAdded")){
                this.__OnAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ad674bbf-6281-5943-9772-e0fd7664d4e1}"),
                    PeerWatcher,
                    PeerInformation
                )
                this.__OnAddedToken := this.add_Added(this.__OnAdded.iface)
            }
            return this.__OnAdded
        }
    }

    /**
     * Occurs when a peer app is no longer within wireless range.
     * @remarks
     * The Removed event is raised when a peer app is removed from the collection of enumerated peer apps. This may happen if a user switches apps or if a device is no longer within range.
     * 
     * [!code-csharp[_StartPeerWatcher](../windows.networking.proximity/code/Proximity_PeerWatcher/cs/MainPage.xaml.cs#Snippet_StartPeerWatcher)]
     * 
     * [!code-csharp[_PeerWatcherRemoved](../windows.networking.proximity/code/Proximity_PeerWatcher/cs/MainPage.xaml.cs#Snippet_PeerWatcherRemoved)]
     * @type {TypedEventHandler<PeerWatcher, PeerInformation>}
    */
    OnRemoved {
        get {
            if(!this.HasProp("__OnRemoved")){
                this.__OnRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ad674bbf-6281-5943-9772-e0fd7664d4e1}"),
                    PeerWatcher,
                    PeerInformation
                )
                this.__OnRemovedToken := this.add_Removed(this.__OnRemoved.iface)
            }
            return this.__OnRemoved
        }
    }

    /**
     * Occurs when the [DisplayName](peerinformation_displayname.md) or [DiscoveryData](peerinformation_discoverydata.md) for a peer app within wireless range has changed.
     * @remarks
     * The Updated event is raised when the [DisplayName](peerinformation_displayname.md) or [DiscoveryData](peerinformation_discoverydata.md) for a peer app changes. You can use the [Id](peerinformation_id.md) property to uniquely identify the peer app and update your UI.
     * 
     * [!code-csharp[_StartPeerWatcher](../windows.networking.proximity/code/Proximity_PeerWatcher/cs/MainPage.xaml.cs#Snippet_StartPeerWatcher)]
     * 
     * [!code-csharp[_PeerWatcherUpdated](../windows.networking.proximity/code/Proximity_PeerWatcher/cs/MainPage.xaml.cs#Snippet_PeerWatcherUpdated)]
     * @type {TypedEventHandler<PeerWatcher, PeerInformation>}
    */
    OnUpdated {
        get {
            if(!this.HasProp("__OnUpdated")){
                this.__OnUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ad674bbf-6281-5943-9772-e0fd7664d4e1}"),
                    PeerWatcher,
                    PeerInformation
                )
                this.__OnUpdatedToken := this.add_Updated(this.__OnUpdated.iface)
            }
            return this.__OnUpdated
        }
    }

    /**
     * Occurs after a scan operation is complete and all peer apps within wireless range have been found.
     * @remarks
     * EnumerationCompleted event is raised when an enumeration looking for peer apps within range is complete. 
     * 
     * [!code-csharp[_StartPeerWatcher](../windows.networking.proximity/code/Proximity_PeerWatcher/cs/MainPage.xaml.cs#Snippet_StartPeerWatcher)]
     * 
     * [!code-csharp[_PeerWatcherEnumerationCompleted](../windows.networking.proximity/code/Proximity_PeerWatcher/cs/MainPage.xaml.cs#Snippet_PeerWatcherEnumerationCompleted)]
     * @type {TypedEventHandler<PeerWatcher, IInspectable>}
    */
    OnEnumerationCompleted {
        get {
            if(!this.HasProp("__OnEnumerationCompleted")){
                this.__OnEnumerationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f4979ea1-7e06-50a8-88dc-3f29524e4fdb}"),
                    PeerWatcher,
                    IInspectable
                )
                this.__OnEnumerationCompletedToken := this.add_EnumerationCompleted(this.__OnEnumerationCompleted.iface)
            }
            return this.__OnEnumerationCompleted
        }
    }

    /**
     * Occurs when the [PeerWatcher](peerwatcher.md) object has been stopped.
     * @remarks
     * You can call the [Stop](peerwatcher_stop_1201535524.md) method to stop the [PeerWatcher](peerwatcher.md) object. You can register for the Stopped event to be informed when the [PeerWatcher](peerwatcher.md) has stopped. You must wait for the Stopped event before you can call the [Start](peerwatcher_start_1587696324.md) method to restart the [PeerWatcher](peerwatcher.md).
     * 
     * [!code-csharp[_StartPeerWatcher](../windows.networking.proximity/code/Proximity_PeerWatcher/cs/MainPage.xaml.cs#Snippet_StartPeerWatcher)]
     * 
     * [!code-csharp[_PeerWatcherStopped](../windows.networking.proximity/code/Proximity_PeerWatcher/cs/MainPage.xaml.cs#Snippet_PeerWatcherStopped)]
     * @type {TypedEventHandler<PeerWatcher, IInspectable>}
    */
    OnStopped {
        get {
            if(!this.HasProp("__OnStopped")){
                this.__OnStopped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f4979ea1-7e06-50a8-88dc-3f29524e4fdb}"),
                    PeerWatcher,
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

        if(this.HasProp("__OnRemovedToken")) {
            this.remove_Removed(this.__OnRemovedToken)
            this.__OnRemoved.iface.Dispose()
        }

        if(this.HasProp("__OnUpdatedToken")) {
            this.remove_Updated(this.__OnUpdatedToken)
            this.__OnUpdated.iface.Dispose()
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
     * @param {TypedEventHandler<PeerWatcher, PeerInformation>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Added(handler) {
        if (!this.HasProp("__IPeerWatcher")) {
            if ((queryResult := this.QueryInterface(IPeerWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeerWatcher := IPeerWatcher(outPtr)
        }

        return this.__IPeerWatcher.add_Added(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Added(token) {
        if (!this.HasProp("__IPeerWatcher")) {
            if ((queryResult := this.QueryInterface(IPeerWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeerWatcher := IPeerWatcher(outPtr)
        }

        return this.__IPeerWatcher.remove_Added(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PeerWatcher, PeerInformation>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Removed(handler) {
        if (!this.HasProp("__IPeerWatcher")) {
            if ((queryResult := this.QueryInterface(IPeerWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeerWatcher := IPeerWatcher(outPtr)
        }

        return this.__IPeerWatcher.add_Removed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Removed(token) {
        if (!this.HasProp("__IPeerWatcher")) {
            if ((queryResult := this.QueryInterface(IPeerWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeerWatcher := IPeerWatcher(outPtr)
        }

        return this.__IPeerWatcher.remove_Removed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PeerWatcher, PeerInformation>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Updated(handler) {
        if (!this.HasProp("__IPeerWatcher")) {
            if ((queryResult := this.QueryInterface(IPeerWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeerWatcher := IPeerWatcher(outPtr)
        }

        return this.__IPeerWatcher.add_Updated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Updated(token) {
        if (!this.HasProp("__IPeerWatcher")) {
            if ((queryResult := this.QueryInterface(IPeerWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeerWatcher := IPeerWatcher(outPtr)
        }

        return this.__IPeerWatcher.remove_Updated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PeerWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EnumerationCompleted(handler) {
        if (!this.HasProp("__IPeerWatcher")) {
            if ((queryResult := this.QueryInterface(IPeerWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeerWatcher := IPeerWatcher(outPtr)
        }

        return this.__IPeerWatcher.add_EnumerationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EnumerationCompleted(token) {
        if (!this.HasProp("__IPeerWatcher")) {
            if ((queryResult := this.QueryInterface(IPeerWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeerWatcher := IPeerWatcher(outPtr)
        }

        return this.__IPeerWatcher.remove_EnumerationCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PeerWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Stopped(handler) {
        if (!this.HasProp("__IPeerWatcher")) {
            if ((queryResult := this.QueryInterface(IPeerWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeerWatcher := IPeerWatcher(outPtr)
        }

        return this.__IPeerWatcher.add_Stopped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Stopped(token) {
        if (!this.HasProp("__IPeerWatcher")) {
            if ((queryResult := this.QueryInterface(IPeerWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeerWatcher := IPeerWatcher(outPtr)
        }

        return this.__IPeerWatcher.remove_Stopped(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IPeerWatcher")) {
            if ((queryResult := this.QueryInterface(IPeerWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeerWatcher := IPeerWatcher(outPtr)
        }

        return this.__IPeerWatcher.get_Status()
    }

    /**
     * Begin dynamically searching for peer apps within wireless range.
     * @remarks
     * You must register an event handler for [Added](peerwatcher_added.md) event before calling the Start method.
     * 
     * You can call the [Stop](peerwatcher_stop_1201535524.md) method to stop dynamically searching for peer apps within wireless range.
     * 
     * You can use the [Status](peerwatcher_status.md) property to determine the status of the [PeerWatcher](peerwatcher.md) object. You cannot call the Start method if the [Status](peerwatcher_status.md) value is **Started**, **EnumerationCompleted**, or **Stopping.**
     * 
     * [!code-csharp[_StartPeerWatcher](../windows.networking.proximity/code/Proximity_PeerWatcher/cs/MainPage.xaml.cs#Snippet_StartPeerWatcher)]
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerwatcher.start
     */
    Start() {
        if (!this.HasProp("__IPeerWatcher")) {
            if ((queryResult := this.QueryInterface(IPeerWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeerWatcher := IPeerWatcher(outPtr)
        }

        return this.__IPeerWatcher.Start()
    }

    /**
     * Stop dynamically searching for peer apps within wireless range.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerwatcher.stop
     */
    Stop() {
        if (!this.HasProp("__IPeerWatcher")) {
            if ((queryResult := this.QueryInterface(IPeerWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeerWatcher := IPeerWatcher(outPtr)
        }

        return this.__IPeerWatcher.Stop()
    }

;@endregion Instance Methods
}
