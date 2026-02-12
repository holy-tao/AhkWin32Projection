#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialAnchorStore.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a collection of [SpatialAnchor](spatialanchor.md) objects stored by Windows on behalf of an app.
 * @remarks
 * This lets an app persist SpatialAnchors and then load them back again during a future app session. The app is responsible for keeping track of which identifiers represent which logical locations within the app, for example associating an anchor with a hologram that should be displayed there.
 * 
 * To request the app's SpatialAnchorStore, use the [SpatialAnchorManager](spatialanchormanager.md) class.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchorstore
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialAnchorStore extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialAnchorStore

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialAnchorStore.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets a map of all anchors saved in the store, with their identifiers as the keys.
     * @returns {IMapView<HSTRING, SpatialAnchor>} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchorstore.getallsavedanchors
     */
    GetAllSavedAnchors() {
        if (!this.HasProp("__ISpatialAnchorStore")) {
            if ((queryResult := this.QueryInterface(ISpatialAnchorStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAnchorStore := ISpatialAnchorStore(outPtr)
        }

        return this.__ISpatialAnchorStore.GetAllSavedAnchors()
    }

    /**
     * Persists an anchor to the store.
     * @remarks
     * This method may return false in future versions of Windows if a device has a per-app anchor persistence limit.
     * @param {HSTRING} id An identifier for the anchor. The identifier must be unique within your app.
     * @param {SpatialAnchor} anchor The anchor to save.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchorstore.trysave
     */
    TrySave(id, anchor) {
        if (!this.HasProp("__ISpatialAnchorStore")) {
            if ((queryResult := this.QueryInterface(ISpatialAnchorStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAnchorStore := ISpatialAnchorStore(outPtr)
        }

        return this.__ISpatialAnchorStore.TrySave(id, anchor)
    }

    /**
     * Removes a specific anchor from the store. The anchor is specified by its identifier.
     * @param {HSTRING} id The identifier of the anchor to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchorstore.remove
     */
    Remove(id) {
        if (!this.HasProp("__ISpatialAnchorStore")) {
            if ((queryResult := this.QueryInterface(ISpatialAnchorStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAnchorStore := ISpatialAnchorStore(outPtr)
        }

        return this.__ISpatialAnchorStore.Remove(id)
    }

    /**
     * Clears all anchors in the app's anchor store.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchorstore.clear
     */
    Clear() {
        if (!this.HasProp("__ISpatialAnchorStore")) {
            if ((queryResult := this.QueryInterface(ISpatialAnchorStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAnchorStore := ISpatialAnchorStore(outPtr)
        }

        return this.__ISpatialAnchorStore.Clear()
    }

;@endregion Instance Methods
}
