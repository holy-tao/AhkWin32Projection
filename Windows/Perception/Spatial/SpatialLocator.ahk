#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialLocator.ahk
#Include .\ISpatialLocatorStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\SpatialLocator.ahk
#Include .\SpatialLocatorPositionalTrackingDeactivatingEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides access to the location of a device that's tracked relative to the user's surroundings, such as a HoloLens or other Mixed Reality headset.
 * @remarks
 * The SpatialLocator class represents a device whose position and orientation can be tracked by Windows relative to the user's surroundings. A SpatialLocator instance is the source for locator-attached and stationary frames of reference. On a Mixed Reality headset such as HoloLens, these frames of reference can be used for holographic rendering and for reasoning about surfaces in the world around the device.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocator
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialLocator extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialLocator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialLocator.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the SpatialLocator instance that tracks the location of the current device, such as a HoloLens, relative to the user's surroundings.
     * @returns {SpatialLocator} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocator.getdefault
     */
    static GetDefault() {
        if (!SpatialLocator.HasProp("__ISpatialLocatorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialLocator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialLocatorStatics.IID)
            SpatialLocator.__ISpatialLocatorStatics := ISpatialLocatorStatics(factoryPtr)
        }

        return SpatialLocator.__ISpatialLocatorStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the current state of the device's spatial location system.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocator.locatability
     * @type {Integer} 
     */
    Locatability {
        get => this.get_Locatability()
    }

    /**
     * Occurs when the state of the spatial location system changes.
     * @type {TypedEventHandler<SpatialLocator, IInspectable>}
    */
    OnLocatabilityChanged {
        get {
            if(!this.HasProp("__OnLocatabilityChanged")){
                this.__OnLocatabilityChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{dbb08ab5-6b40-55fb-83d3-50d5373a3b20}"),
                    SpatialLocator,
                    IInspectable
                )
                this.__OnLocatabilityChangedToken := this.add_LocatabilityChanged(this.__OnLocatabilityChanged.iface)
            }
            return this.__OnLocatabilityChanged
        }
    }

    /**
     * Occurs when the device's spatial location system is deactivating due to inactivity.
     * @type {TypedEventHandler<SpatialLocator, SpatialLocatorPositionalTrackingDeactivatingEventArgs>}
    */
    OnPositionalTrackingDeactivating {
        get {
            if(!this.HasProp("__OnPositionalTrackingDeactivating")){
                this.__OnPositionalTrackingDeactivating := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{34bf236c-e5d6-501f-8693-bc1d8d431d7e}"),
                    SpatialLocator,
                    SpatialLocatorPositionalTrackingDeactivatingEventArgs
                )
                this.__OnPositionalTrackingDeactivatingToken := this.add_PositionalTrackingDeactivating(this.__OnPositionalTrackingDeactivating.iface)
            }
            return this.__OnPositionalTrackingDeactivating
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnLocatabilityChangedToken")) {
            this.remove_LocatabilityChanged(this.__OnLocatabilityChangedToken)
            this.__OnLocatabilityChanged.iface.Dispose()
        }

        if(this.HasProp("__OnPositionalTrackingDeactivatingToken")) {
            this.remove_PositionalTrackingDeactivating(this.__OnPositionalTrackingDeactivatingToken)
            this.__OnPositionalTrackingDeactivating.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Locatability() {
        if (!this.HasProp("__ISpatialLocator")) {
            if ((queryResult := this.QueryInterface(ISpatialLocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocator := ISpatialLocator(outPtr)
        }

        return this.__ISpatialLocator.get_Locatability()
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialLocator, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LocatabilityChanged(handler) {
        if (!this.HasProp("__ISpatialLocator")) {
            if ((queryResult := this.QueryInterface(ISpatialLocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocator := ISpatialLocator(outPtr)
        }

        return this.__ISpatialLocator.add_LocatabilityChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_LocatabilityChanged(cookie) {
        if (!this.HasProp("__ISpatialLocator")) {
            if ((queryResult := this.QueryInterface(ISpatialLocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocator := ISpatialLocator(outPtr)
        }

        return this.__ISpatialLocator.remove_LocatabilityChanged(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialLocator, SpatialLocatorPositionalTrackingDeactivatingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PositionalTrackingDeactivating(handler) {
        if (!this.HasProp("__ISpatialLocator")) {
            if ((queryResult := this.QueryInterface(ISpatialLocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocator := ISpatialLocator(outPtr)
        }

        return this.__ISpatialLocator.add_PositionalTrackingDeactivating(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PositionalTrackingDeactivating(cookie) {
        if (!this.HasProp("__ISpatialLocator")) {
            if ((queryResult := this.QueryInterface(ISpatialLocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocator := ISpatialLocator(outPtr)
        }

        return this.__ISpatialLocator.remove_PositionalTrackingDeactivating(cookie)
    }

    /**
     * Returns a SpatialLocation representing the device's location at the specified timestamp. The coordinates within are expressed relative to the supplied coordinate system. If the device cannot be located in that coordinate system at the specified timestamp, the return value will be null. This can happen when the device has lost tracking, for example.
     * @param {PerceptionTimestamp} timestamp_ The timestamp at which to locate the device.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system in which to express the location's coordinates.
     * @returns {SpatialLocation} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocator.trylocateattimestamp
     */
    TryLocateAtTimestamp(timestamp_, coordinateSystem) {
        if (!this.HasProp("__ISpatialLocator")) {
            if ((queryResult := this.QueryInterface(ISpatialLocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocator := ISpatialLocator(outPtr)
        }

        return this.__ISpatialLocator.TryLocateAtTimestamp(timestamp_, coordinateSystem)
    }

    /**
     * Creates a frame of reference that's positionally attached to this SpatialLocator with the current orientation as its fixed heading and with its origin offset by the specified relative position.
     * @returns {SpatialLocatorAttachedFrameOfReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocator.createattachedframeofreferenceatcurrentheading
     */
    CreateAttachedFrameOfReferenceAtCurrentHeading() {
        if (!this.HasProp("__ISpatialLocator")) {
            if ((queryResult := this.QueryInterface(ISpatialLocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocator := ISpatialLocator(outPtr)
        }

        return this.__ISpatialLocator.CreateAttachedFrameOfReferenceAtCurrentHeading()
    }

    /**
     * Creates a frame of reference that's positionally attached to this SpatialLocator with the current orientation as its fixed heading and with its origin offset and rotated by the specified relative position and orientation.
     * @param {Vector3} relativePosition The positional offset of the origin of the frame of reference, expressed within its coordinate system.
     * @returns {SpatialLocatorAttachedFrameOfReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocator.createattachedframeofreferenceatcurrentheading
     */
    CreateAttachedFrameOfReferenceAtCurrentHeadingWithPosition(relativePosition) {
        if (!this.HasProp("__ISpatialLocator")) {
            if ((queryResult := this.QueryInterface(ISpatialLocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocator := ISpatialLocator(outPtr)
        }

        return this.__ISpatialLocator.CreateAttachedFrameOfReferenceAtCurrentHeadingWithPosition(relativePosition)
    }

    /**
     * Creates a frame of reference that's positionally attached to this SpatialLocator with the supplied heading in radians relative to the current orientation and with its origin offset by the specified relative position and orientation.
     * @param {Vector3} relativePosition The positional offset of the origin of the frame of reference, expressed within its coordinate system.
     * @param {Quaternion} relativeOrientation The rotation of the origin of the frame of reference, relative to the direction of the heading.
     * @returns {SpatialLocatorAttachedFrameOfReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocator.createattachedframeofreferenceatcurrentheading
     */
    CreateAttachedFrameOfReferenceAtCurrentHeadingWithPositionAndOrientation(relativePosition, relativeOrientation) {
        if (!this.HasProp("__ISpatialLocator")) {
            if ((queryResult := this.QueryInterface(ISpatialLocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocator := ISpatialLocator(outPtr)
        }

        return this.__ISpatialLocator.CreateAttachedFrameOfReferenceAtCurrentHeadingWithPositionAndOrientation(relativePosition, relativeOrientation)
    }

    /**
     * Creates a frame of reference that's positionally attached to this SpatialLocator with the current orientation as its fixed heading.
     * @param {Vector3} relativePosition 
     * @param {Quaternion} relativeOrientation 
     * @param {Float} relativeHeadingInRadians 
     * @returns {SpatialLocatorAttachedFrameOfReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocator.createattachedframeofreferenceatcurrentheading
     */
    CreateAttachedFrameOfReferenceAtCurrentHeadingWithPositionAndOrientationAndRelativeHeading(relativePosition, relativeOrientation, relativeHeadingInRadians) {
        if (!this.HasProp("__ISpatialLocator")) {
            if ((queryResult := this.QueryInterface(ISpatialLocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocator := ISpatialLocator(outPtr)
        }

        return this.__ISpatialLocator.CreateAttachedFrameOfReferenceAtCurrentHeadingWithPositionAndOrientationAndRelativeHeading(relativePosition, relativeOrientation, relativeHeadingInRadians)
    }

    /**
     * Creates a frame of reference that remains stationary relative to the user's surroundings, with its initial origin at the specified offset from the SpatialLocator's current location.
     * @returns {SpatialStationaryFrameOfReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocator.createstationaryframeofreferenceatcurrentlocation
     */
    CreateStationaryFrameOfReferenceAtCurrentLocation() {
        if (!this.HasProp("__ISpatialLocator")) {
            if ((queryResult := this.QueryInterface(ISpatialLocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocator := ISpatialLocator(outPtr)
        }

        return this.__ISpatialLocator.CreateStationaryFrameOfReferenceAtCurrentLocation()
    }

    /**
     * Creates a frame of reference that remains stationary relative to the user's surroundings, with its initial origin at the specified offset from the SpatialLocator's current location, and then rotated at the specified rotation.
     * @param {Vector3} relativePosition The positional offset of the origin of the frame of reference, expressed within its coordinate system.
     * @returns {SpatialStationaryFrameOfReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocator.createstationaryframeofreferenceatcurrentlocation
     */
    CreateStationaryFrameOfReferenceAtCurrentLocationWithPosition(relativePosition) {
        if (!this.HasProp("__ISpatialLocator")) {
            if ((queryResult := this.QueryInterface(ISpatialLocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocator := ISpatialLocator(outPtr)
        }

        return this.__ISpatialLocator.CreateStationaryFrameOfReferenceAtCurrentLocationWithPosition(relativePosition)
    }

    /**
     * Creates a frame of reference that remains stationary relative to the user's surroundings, with its initial origin at the specified offset from the SpatialLocator's current location along the specified relative heading in radians, and then rotated at the specified rotation.
     * @param {Vector3} relativePosition The positional offset of the origin of the frame of reference, expressed within its coordinate system.
     * @param {Quaternion} relativeOrientation The rotation of the origin of the frame of reference, relative to the direction of the heading.
     * @returns {SpatialStationaryFrameOfReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocator.createstationaryframeofreferenceatcurrentlocation
     */
    CreateStationaryFrameOfReferenceAtCurrentLocationWithPositionAndOrientation(relativePosition, relativeOrientation) {
        if (!this.HasProp("__ISpatialLocator")) {
            if ((queryResult := this.QueryInterface(ISpatialLocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocator := ISpatialLocator(outPtr)
        }

        return this.__ISpatialLocator.CreateStationaryFrameOfReferenceAtCurrentLocationWithPositionAndOrientation(relativePosition, relativeOrientation)
    }

    /**
     * Creates a frame of reference that remains stationary relative to the user's surroundings, with its initial origin at the SpatialLocator's current location.
     * @param {Vector3} relativePosition 
     * @param {Quaternion} relativeOrientation 
     * @param {Float} relativeHeadingInRadians 
     * @returns {SpatialStationaryFrameOfReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocator.createstationaryframeofreferenceatcurrentlocation
     */
    CreateStationaryFrameOfReferenceAtCurrentLocationWithPositionAndOrientationAndRelativeHeading(relativePosition, relativeOrientation, relativeHeadingInRadians) {
        if (!this.HasProp("__ISpatialLocator")) {
            if ((queryResult := this.QueryInterface(ISpatialLocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocator := ISpatialLocator(outPtr)
        }

        return this.__ISpatialLocator.CreateStationaryFrameOfReferenceAtCurrentLocationWithPositionAndOrientationAndRelativeHeading(relativePosition, relativeOrientation, relativeHeadingInRadians)
    }

;@endregion Instance Methods
}
