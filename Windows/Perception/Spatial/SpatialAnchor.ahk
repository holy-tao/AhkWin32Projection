#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialAnchor.ahk
#Include .\ISpatialAnchor2.ahk
#Include .\ISpatialAnchorStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\SpatialAnchor.ahk
#Include .\SpatialAnchorRawCoordinateSystemAdjustedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a coordinate system that is strongly anchored to a point in the user's surroundings.
 * @remarks
 * You can create a SpatialAnchor at any position and orientation within the [SpatialCoordinateSystem](spatialcoordinatesystem.md) of your choosing. The device must be able to locate that coordinate system at the moment, and the system must not have reached its limit of spatial anchors.
 * 
 * Once defined, the coordinate system of a SpatialAnchor adjusts continually to retain the precise position and orientation of its initial location. You can then use this SpatialAnchor to render holograms that will appear fixed in the user's surroundings at that exact location.
 * 
 * The effects of the adjustments that keep the anchor in place are magnified as distance from the anchor increases. You should avoid rendering content relative to an anchor that is more than 3 meters from that anchor's origin.
 * 
 * You can persist a SpatialAnchor using the [SpatialAnchorStore](spatialanchorstore.md) class and then get it back in a future app session.
 * 
 * The [CoordinateSystem](spatialanchor_coordinatesystem.md) property gets a coordinate system that lets you place content relative to the anchor, with easing applied when the device adjusts the anchor's precise location.
 * 
 * Use the [RawCoordinateSystem](spatialanchor_rawcoordinatesystem.md) property and the corresponding [RawCoordinateSystemAdjusted](spatialanchor_rawcoordinatesystemadjusted.md) event to manage these adjustments yourself.
 * 
 * The coordinate system is right-handed, with +y up, +x to the right, and -z forward.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchor
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialAnchor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialAnchor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialAnchor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an anchor at a specific position within the specified coordinate system.
     * @param {SpatialCoordinateSystem} coordinateSystem The reference SpatialCoordinateSystem object.
     * @returns {SpatialAnchor} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchor.trycreaterelativeto
     */
    static TryCreateRelativeTo(coordinateSystem) {
        if (!SpatialAnchor.HasProp("__ISpatialAnchorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialAnchor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialAnchorStatics.IID)
            SpatialAnchor.__ISpatialAnchorStatics := ISpatialAnchorStatics(factoryPtr)
        }

        return SpatialAnchor.__ISpatialAnchorStatics.TryCreateRelativeTo(coordinateSystem)
    }

    /**
     * Creates an anchor at a specific position and orientation within the specified coordinate system.
     * 
     * This can return null if the system has reached its limit on spatial anchors. It may also return null if the specified coordinate system cannot be located this frame.
     * @param {SpatialCoordinateSystem} coordinateSystem The reference SpatialCoordinateSystem object.
     * @param {Vector3} position A point specified relative to the coordinate system of the source SpatialCoordinateSystem object.
     * @returns {SpatialAnchor} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchor.trycreaterelativeto
     */
    static TryCreateWithPositionRelativeTo(coordinateSystem, position) {
        if (!SpatialAnchor.HasProp("__ISpatialAnchorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialAnchor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialAnchorStatics.IID)
            SpatialAnchor.__ISpatialAnchorStatics := ISpatialAnchorStatics(factoryPtr)
        }

        return SpatialAnchor.__ISpatialAnchorStatics.TryCreateWithPositionRelativeTo(coordinateSystem, position)
    }

    /**
     * Creates an anchor at the origin of the specified coordinate system.
     * @remarks
     * This can return null if the system has reached its limit on spatial anchors. It may also return null if the specified coordinate system cannot be located this frame.
     * @param {SpatialCoordinateSystem} coordinateSystem The reference SpatialCoordinateSystem object.
     * @param {Vector3} position 
     * @param {Quaternion} orientation_ 
     * @returns {SpatialAnchor} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchor.trycreaterelativeto
     */
    static TryCreateWithPositionAndOrientationRelativeTo(coordinateSystem, position, orientation_) {
        if (!SpatialAnchor.HasProp("__ISpatialAnchorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialAnchor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialAnchorStatics.IID)
            SpatialAnchor.__ISpatialAnchorStatics := ISpatialAnchorStatics(factoryPtr)
        }

        return SpatialAnchor.__ISpatialAnchorStatics.TryCreateWithPositionAndOrientationRelativeTo(coordinateSystem, position, orientation_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the coordinate system of the anchor, with easing adjustments applied.
     * @remarks
     * This coordinate system lets you precisely place holograms near the anchor, with easing applied when the device adjusts the anchor's precise location.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchor.coordinatesystem
     * @type {SpatialCoordinateSystem} 
     */
    CoordinateSystem {
        get => this.get_CoordinateSystem()
    }

    /**
     * Gets the coordinate system of the anchor, without easing applied.
     * @remarks
     * This coordinate system lets you precisely place holograms near the anchor, with immediate updates when the device adjusts the anchor's precise location.
     * 
     * Use the corresponding [RawCoordinateSystemAdjusted](spatialanchor_rawcoordinatesystemadjusted.md) event to react when anchor adjustments occur.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchor.rawcoordinatesystem
     * @type {SpatialCoordinateSystem} 
     */
    RawCoordinateSystem {
        get => this.get_RawCoordinateSystem()
    }

    /**
     * Gets a value indicating whether the persisted anchor was removed by the user.
     * @remarks
     * The app should discard any other saved state that corresponds with this anchor.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchor.removedbyuser
     * @type {Boolean} 
     */
    RemovedByUser {
        get => this.get_RemovedByUser()
    }

    /**
     * Occurs when the device adjusts the anchor's precise location, which updates the [RawCoordinateSystem](spatialanchor_rawcoordinatesystem.md).
     * @remarks
     * The event arguments contain a transform representing the adjustment that was made.
     * @type {TypedEventHandler<SpatialAnchor, SpatialAnchorRawCoordinateSystemAdjustedEventArgs>}
    */
    OnRawCoordinateSystemAdjusted {
        get {
            if(!this.HasProp("__OnRawCoordinateSystemAdjusted")){
                this.__OnRawCoordinateSystemAdjusted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{fa43f9e4-3558-59c8-9a77-6e8b765adcc8}"),
                    SpatialAnchor,
                    SpatialAnchorRawCoordinateSystemAdjustedEventArgs
                )
                this.__OnRawCoordinateSystemAdjustedToken := this.add_RawCoordinateSystemAdjusted(this.__OnRawCoordinateSystemAdjusted.iface)
            }
            return this.__OnRawCoordinateSystemAdjusted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnRawCoordinateSystemAdjustedToken")) {
            this.remove_RawCoordinateSystemAdjusted(this.__OnRawCoordinateSystemAdjustedToken)
            this.__OnRawCoordinateSystemAdjusted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {SpatialCoordinateSystem} 
     */
    get_CoordinateSystem() {
        if (!this.HasProp("__ISpatialAnchor")) {
            if ((queryResult := this.QueryInterface(ISpatialAnchor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAnchor := ISpatialAnchor(outPtr)
        }

        return this.__ISpatialAnchor.get_CoordinateSystem()
    }

    /**
     * 
     * @returns {SpatialCoordinateSystem} 
     */
    get_RawCoordinateSystem() {
        if (!this.HasProp("__ISpatialAnchor")) {
            if ((queryResult := this.QueryInterface(ISpatialAnchor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAnchor := ISpatialAnchor(outPtr)
        }

        return this.__ISpatialAnchor.get_RawCoordinateSystem()
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialAnchor, SpatialAnchorRawCoordinateSystemAdjustedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RawCoordinateSystemAdjusted(handler) {
        if (!this.HasProp("__ISpatialAnchor")) {
            if ((queryResult := this.QueryInterface(ISpatialAnchor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAnchor := ISpatialAnchor(outPtr)
        }

        return this.__ISpatialAnchor.add_RawCoordinateSystemAdjusted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_RawCoordinateSystemAdjusted(cookie) {
        if (!this.HasProp("__ISpatialAnchor")) {
            if ((queryResult := this.QueryInterface(ISpatialAnchor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAnchor := ISpatialAnchor(outPtr)
        }

        return this.__ISpatialAnchor.remove_RawCoordinateSystemAdjusted(cookie)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RemovedByUser() {
        if (!this.HasProp("__ISpatialAnchor2")) {
            if ((queryResult := this.QueryInterface(ISpatialAnchor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAnchor2 := ISpatialAnchor2(outPtr)
        }

        return this.__ISpatialAnchor2.get_RemovedByUser()
    }

;@endregion Instance Methods
}
