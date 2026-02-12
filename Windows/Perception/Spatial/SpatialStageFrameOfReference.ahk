#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialStageFrameOfReference.ahk
#Include .\ISpatialStageFrameOfReferenceStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a spatial stage, defined by the user to establish the physical space in which they intend to use a Mixed Reality headset.
 * @remarks
 * A spatial stage consists minimally of a floor-level coordinate system whose origin is chosen by the user, representing the logical center of the area in which they intend to use their Mixed Reality headset.  This floor-level coordinate system enables apps to present standing-scale experiences.
 * 
 * Optionally, the user may also define a movement boundary, representing the open area in which they intend to walk while using the headset.  This movement boundary enables apps to present room-scale experiences.
 * 
 * If the user has not defined a spatial stage, an app may call the [RequestNewStageAsync](spatialstageframeofreference_requestnewstageasync_1196621824.md) method to guide the user through system UI that will allow them to define one.
 * 
 * On HoloLens, an app may also build standing-scale or room-scale experiences using spatial mapping.  Spatial mapping enables the developer to analyze the user's surroundings and determine the locations of the user's walls and floors using the [SpatialSurfaceObserver](../windows.perception.spatial.surfaces/spatialsurfaceobserver.md) type, even if the user has not defined a stage manually.  Inspect the [SpatialSurfaceObserver.IsSupported](../windows.perception.spatial.surfaces/spatialsurfaceobserver_issupported_930300905.md) property to determine if the current device supports spatial mapping.
 * 
 * Coordinate systems returned by the stage are right-handed, with +y up, +x to the right, and -z forward.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialstageframeofreference
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialStageFrameOfReference extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialStageFrameOfReference

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialStageFrameOfReference.IID

    /**
     * Gets the current spatial stage, if one has been defined by the user.
     * @remarks
     * This property will return null if the user has not defined a spatial stage.  On HoloLens, users are not yet able to define a spatial stage.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialstageframeofreference.current
     * @type {SpatialStageFrameOfReference} 
     */
    static Current {
        get => SpatialStageFrameOfReference.get_Current()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {SpatialStageFrameOfReference} 
     */
    static get_Current() {
        if (!SpatialStageFrameOfReference.HasProp("__ISpatialStageFrameOfReferenceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialStageFrameOfReference")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialStageFrameOfReferenceStatics.IID)
            SpatialStageFrameOfReference.__ISpatialStageFrameOfReferenceStatics := ISpatialStageFrameOfReferenceStatics(factoryPtr)
        }

        return SpatialStageFrameOfReference.__ISpatialStageFrameOfReferenceStatics.get_Current()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_CurrentChanged(handler) {
        if (!SpatialStageFrameOfReference.HasProp("__ISpatialStageFrameOfReferenceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialStageFrameOfReference")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialStageFrameOfReferenceStatics.IID)
            SpatialStageFrameOfReference.__ISpatialStageFrameOfReferenceStatics := ISpatialStageFrameOfReferenceStatics(factoryPtr)
        }

        return SpatialStageFrameOfReference.__ISpatialStageFrameOfReferenceStatics.add_CurrentChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    static remove_CurrentChanged(cookie) {
        if (!SpatialStageFrameOfReference.HasProp("__ISpatialStageFrameOfReferenceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialStageFrameOfReference")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialStageFrameOfReferenceStatics.IID)
            SpatialStageFrameOfReference.__ISpatialStageFrameOfReferenceStatics := ISpatialStageFrameOfReferenceStatics(factoryPtr)
        }

        return SpatialStageFrameOfReference.__ISpatialStageFrameOfReferenceStatics.remove_CurrentChanged(cookie)
    }

    /**
     * Shows system UI to guide the user in defining a new stage to replace the current stage.
     * @remarks
     * This API must be called from within an ASTA thread (also known as a UI thread).
     * @returns {IAsyncOperation<SpatialStageFrameOfReference>} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialstageframeofreference.requestnewstageasync
     */
    static RequestNewStageAsync() {
        if (!SpatialStageFrameOfReference.HasProp("__ISpatialStageFrameOfReferenceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialStageFrameOfReference")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialStageFrameOfReferenceStatics.IID)
            SpatialStageFrameOfReference.__ISpatialStageFrameOfReferenceStatics := ISpatialStageFrameOfReferenceStatics(factoryPtr)
        }

        return SpatialStageFrameOfReference.__ISpatialStageFrameOfReferenceStatics.RequestNewStageAsync()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a floor-level coordinate system located at the stage origin defined by the user.
     * @remarks
     * The coordinate system is right-handed, with +y up, +x to the right, and -z forward.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialstageframeofreference.coordinatesystem
     * @type {SpatialCoordinateSystem} 
     */
    CoordinateSystem {
        get => this.get_CoordinateSystem()
    }

    /**
     * Gets the extent to which the user can move while wearing their headset.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialstageframeofreference.movementrange
     * @type {Integer} 
     */
    MovementRange {
        get => this.get_MovementRange()
    }

    /**
     * Gets the extent to which the user can look around with their headset.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialstageframeofreference.lookdirectionrange
     * @type {Integer} 
     */
    LookDirectionRange {
        get => this.get_LookDirectionRange()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SpatialCoordinateSystem} 
     */
    get_CoordinateSystem() {
        if (!this.HasProp("__ISpatialStageFrameOfReference")) {
            if ((queryResult := this.QueryInterface(ISpatialStageFrameOfReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialStageFrameOfReference := ISpatialStageFrameOfReference(outPtr)
        }

        return this.__ISpatialStageFrameOfReference.get_CoordinateSystem()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MovementRange() {
        if (!this.HasProp("__ISpatialStageFrameOfReference")) {
            if ((queryResult := this.QueryInterface(ISpatialStageFrameOfReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialStageFrameOfReference := ISpatialStageFrameOfReference(outPtr)
        }

        return this.__ISpatialStageFrameOfReference.get_MovementRange()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LookDirectionRange() {
        if (!this.HasProp("__ISpatialStageFrameOfReference")) {
            if ((queryResult := this.QueryInterface(ISpatialStageFrameOfReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialStageFrameOfReference := ISpatialStageFrameOfReference(outPtr)
        }

        return this.__ISpatialStageFrameOfReference.get_LookDirectionRange()
    }

    /**
     * Gets a floor-level coordinate system at the user's current position and orientation.
     * @remarks
     * The coordinate system is right-handed, with +y up, +x to the right, and -z forward.
     * @param {SpatialLocator} locator_ The spatial locator with the position and orientation to use as the origin for the returned coordinate system.
     * @returns {SpatialCoordinateSystem} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialstageframeofreference.getcoordinatesystematcurrentlocation
     */
    GetCoordinateSystemAtCurrentLocation(locator_) {
        if (!this.HasProp("__ISpatialStageFrameOfReference")) {
            if ((queryResult := this.QueryInterface(ISpatialStageFrameOfReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialStageFrameOfReference := ISpatialStageFrameOfReference(outPtr)
        }

        return this.__ISpatialStageFrameOfReference.GetCoordinateSystemAtCurrentLocation(locator_)
    }

    /**
     * Gets the boundary vertices of the open area defined by the user where they intend to move while using their headset.
     * @remarks
     * This method will return null if the user has not defined movement bounds. (i.e. if [MovementRange](spatialstageframeofreference_movementrange.md) is NoMovement)
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system in which to express the boundary vertices.
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} The boundary vertices.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialstageframeofreference.trygetmovementbounds
     */
    TryGetMovementBounds(coordinateSystem, value) {
        if (!this.HasProp("__ISpatialStageFrameOfReference")) {
            if ((queryResult := this.QueryInterface(ISpatialStageFrameOfReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialStageFrameOfReference := ISpatialStageFrameOfReference(outPtr)
        }

        return this.__ISpatialStageFrameOfReference.TryGetMovementBounds(coordinateSystem, value)
    }

;@endregion Instance Methods
}
