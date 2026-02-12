#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialEntityWatcher.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\SpatialEntityWatcher.ahk
#Include .\SpatialEntityAddedEventArgs.ahk
#Include .\SpatialEntityUpdatedEventArgs.ahk
#Include .\SpatialEntityRemovedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Monitors changes to the set of entities that participants add, update, or remove within a spatial entity store, and provides notifications when that set changes.
 * @remarks
 * > [!IMPORTANT]
 * > The [SpatialEntityStore](spatialentitystore.md) approach of synchronizing spatial anchors between devices is not currently supported.  Consider using [Azure Spatial Anchors](/azure/spatial-anchors) instead.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentitywatcher
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialEntityWatcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialEntityWatcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialEntityWatcher.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the operational status of the spatial entity watcher.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentitywatcher.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * The event that is raised when a new spatial entity is added to the store by a participant.
     * @type {TypedEventHandler<SpatialEntityWatcher, SpatialEntityAddedEventArgs>}
    */
    OnAdded {
        get {
            if(!this.HasProp("__OnAdded")){
                this.__OnAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f8edae01-6a30-52cc-b543-8abdb26529b4}"),
                    SpatialEntityWatcher,
                    SpatialEntityAddedEventArgs
                )
                this.__OnAddedToken := this.add_Added(this.__OnAdded.iface)
            }
            return this.__OnAdded
        }
    }

    /**
     * The event that is raised when an existing spatial entity has its metadata updated by a participant.
     * @remarks
     * Note that adjustments to the position of a spatial anchor that occur as the device learns more about its environment are not represented by this Updated event.  Apps should react to changes to the anchor's coordinate system each frame, just as is necessary for local anchors.
     * @type {TypedEventHandler<SpatialEntityWatcher, SpatialEntityUpdatedEventArgs>}
    */
    OnUpdated {
        get {
            if(!this.HasProp("__OnUpdated")){
                this.__OnUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a15fd0c0-8a0a-5a7d-897a-f206cc509190}"),
                    SpatialEntityWatcher,
                    SpatialEntityUpdatedEventArgs
                )
                this.__OnUpdatedToken := this.add_Updated(this.__OnUpdated.iface)
            }
            return this.__OnUpdated
        }
    }

    /**
     * The event that is raised when a spatial entity is removed from the store by a participant.
     * @type {TypedEventHandler<SpatialEntityWatcher, SpatialEntityRemovedEventArgs>}
    */
    OnRemoved {
        get {
            if(!this.HasProp("__OnRemoved")){
                this.__OnRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{36f982ad-eaa2-5263-861e-2acf030c9e17}"),
                    SpatialEntityWatcher,
                    SpatialEntityRemovedEventArgs
                )
                this.__OnRemovedToken := this.add_Removed(this.__OnRemoved.iface)
            }
            return this.__OnRemoved
        }
    }

    /**
     * The event that is raised when the initial replay of prior changes to the spatial entity store has completed.
     * @type {TypedEventHandler<SpatialEntityWatcher, IInspectable>}
    */
    OnEnumerationCompleted {
        get {
            if(!this.HasProp("__OnEnumerationCompleted")){
                this.__OnEnumerationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{50171823-30a9-5938-9f3b-358d86169f2e}"),
                    SpatialEntityWatcher,
                    IInspectable
                )
                this.__OnEnumerationCompletedToken := this.add_EnumerationCompleted(this.__OnEnumerationCompleted.iface)
            }
            return this.__OnEnumerationCompleted
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

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__ISpatialEntityWatcher")) {
            if ((queryResult := this.QueryInterface(ISpatialEntityWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialEntityWatcher := ISpatialEntityWatcher(outPtr)
        }

        return this.__ISpatialEntityWatcher.get_Status()
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialEntityWatcher, SpatialEntityAddedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Added(handler) {
        if (!this.HasProp("__ISpatialEntityWatcher")) {
            if ((queryResult := this.QueryInterface(ISpatialEntityWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialEntityWatcher := ISpatialEntityWatcher(outPtr)
        }

        return this.__ISpatialEntityWatcher.add_Added(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Added(token) {
        if (!this.HasProp("__ISpatialEntityWatcher")) {
            if ((queryResult := this.QueryInterface(ISpatialEntityWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialEntityWatcher := ISpatialEntityWatcher(outPtr)
        }

        return this.__ISpatialEntityWatcher.remove_Added(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialEntityWatcher, SpatialEntityUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Updated(handler) {
        if (!this.HasProp("__ISpatialEntityWatcher")) {
            if ((queryResult := this.QueryInterface(ISpatialEntityWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialEntityWatcher := ISpatialEntityWatcher(outPtr)
        }

        return this.__ISpatialEntityWatcher.add_Updated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Updated(token) {
        if (!this.HasProp("__ISpatialEntityWatcher")) {
            if ((queryResult := this.QueryInterface(ISpatialEntityWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialEntityWatcher := ISpatialEntityWatcher(outPtr)
        }

        return this.__ISpatialEntityWatcher.remove_Updated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialEntityWatcher, SpatialEntityRemovedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Removed(handler) {
        if (!this.HasProp("__ISpatialEntityWatcher")) {
            if ((queryResult := this.QueryInterface(ISpatialEntityWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialEntityWatcher := ISpatialEntityWatcher(outPtr)
        }

        return this.__ISpatialEntityWatcher.add_Removed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Removed(token) {
        if (!this.HasProp("__ISpatialEntityWatcher")) {
            if ((queryResult := this.QueryInterface(ISpatialEntityWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialEntityWatcher := ISpatialEntityWatcher(outPtr)
        }

        return this.__ISpatialEntityWatcher.remove_Removed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialEntityWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EnumerationCompleted(handler) {
        if (!this.HasProp("__ISpatialEntityWatcher")) {
            if ((queryResult := this.QueryInterface(ISpatialEntityWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialEntityWatcher := ISpatialEntityWatcher(outPtr)
        }

        return this.__ISpatialEntityWatcher.add_EnumerationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EnumerationCompleted(token) {
        if (!this.HasProp("__ISpatialEntityWatcher")) {
            if ((queryResult := this.QueryInterface(ISpatialEntityWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialEntityWatcher := ISpatialEntityWatcher(outPtr)
        }

        return this.__ISpatialEntityWatcher.remove_EnumerationCompleted(token)
    }

    /**
     * Starts watching for changes to the set of spatial entities in the store.
     * @remarks
     * This will replay any changes to the spatial entity store that occurred before the app called Start.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentitywatcher.start
     */
    Start() {
        if (!this.HasProp("__ISpatialEntityWatcher")) {
            if ((queryResult := this.QueryInterface(ISpatialEntityWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialEntityWatcher := ISpatialEntityWatcher(outPtr)
        }

        return this.__ISpatialEntityWatcher.Start()
    }

    /**
     * Stops watching for changes to the set of spatial entities in the store.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentitywatcher.stop
     */
    Stop() {
        if (!this.HasProp("__ISpatialEntityWatcher")) {
            if ((queryResult := this.QueryInterface(ISpatialEntityWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialEntityWatcher := ISpatialEntityWatcher(outPtr)
        }

        return this.__ISpatialEntityWatcher.Stop()
    }

;@endregion Instance Methods
}
