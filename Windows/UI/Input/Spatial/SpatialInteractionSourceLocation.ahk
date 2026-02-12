#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialInteractionSourceLocation.ahk
#Include .\ISpatialInteractionSourceLocation2.ahk
#Include .\ISpatialInteractionSourceLocation3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the grip pose and pointer pose of a hand or motion controller.
 * @remarks
 * Windows Mixed Reality supports motion controllers in a variety of form factors, with each controller's design differing in its relationship between the user's hand position and the natural "forward" direction that apps should use for pointing when rendering the controller.
 * 
 * To better represent these controllers, there are two kinds of poses you can investigate for each interaction source.
 * 
 * The grip pose represents the location of either the palm of a hand detected by a HoloLens, or the palm holding a motion controller.  On immersive headsets, this pose is best used to render the user's hand or an object held in the user's hand, such as a sword or gun.  The grip pose is represented by the position, orientation and velocity properties directly within this type.
 * 
 * The pointer pose represents the tip of a motion controller pointing forward.  This pose is best used to raycast when pointing at UI when you are rendering the controller model itself.  The pointer pose can be accessed through the SourcePointerPose property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcelocation
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialInteractionSourceLocation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialInteractionSourceLocation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialInteractionSourceLocation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the grip pose position, representing the position of the user's hand, either directly or where it holds a motion controller.
     * @remarks
     * This position is distinct from the motion controller's pointing ray, which has its origin at the tip of the controller.  The pointing ray for a controller is available through the SourcePointerPose property.
     * 
     * Note that position is only available for an interaction source if it can be correlated with the specified coordinate system.
     * 
     * Interactions from interaction sources that do not support pointing should be targeted using gaze, not using the controller as an "air mouse".
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcelocation.position
     * @type {IReference<Vector3>} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets the velocity of a hand or motion controller.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcelocation.velocity
     * @type {IReference<Vector3>} 
     */
    Velocity {
        get => this.get_Velocity()
    }

    /**
     * Gets the grip pose orientation, representing the orientation of the user's hand as it holds a motion controller.
     * @remarks
     * This orientation is distinct from a motion controller's pointing ray, which points forward from the tip of the controller.  The pointing ray for a controller is available through the SourcePointerPose property.
     * 
     * Note that orientation is only available for an interaction source if it can correlated with the specified coordinate system.  Motion controllers that do not expose pointer poses do not expose orientation either.
     * 
     * Interactions from interaction sources that do not support pointing should be targeted using gaze, not using the controller as an "air mouse".
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcelocation.orientation
     * @type {IReference<Quaternion>} 
     */
    Orientation {
        get => this.get_Orientation()
    }

    /**
     * Gets the accuracy of an interaction source's positional tracking.
     * @remarks
     * When a visually-tracked motion controller loses tracking, the system may continue to synthesize a position, with the precise mechanism of synthesis varying based on the tracking technology.  Apps may check this property to determine when the position does not represent the nominal positional accuracy for that controller.
     * 
     * For example, an app may choose to accept all positions when pointing at menus or interacting with world objects.  Then, when the user starts painting in the world around them, the app may choose to accept only positions with a High accuracy, to ensure the quality of the painting remains high.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcelocation.positionaccuracy
     * @type {Integer} 
     */
    PositionAccuracy {
        get => this.get_PositionAccuracy()
    }

    /**
     * Gets the angular velocity of a hand or motion controller.
     * @remarks
     * The angular velocity is expressed in an axis-angle representation.  The unit vector is the axis of rotation and the magnitude is the angular speed in radians per second, following the right-hand rule.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcelocation.angularvelocity
     * @type {IReference<Vector3>} 
     */
    AngularVelocity {
        get => this.get_AngularVelocity()
    }

    /**
     * Gets the pointer pose for a particular spatial interaction source, such as a motion controller, at a given timestamp.
     * @remarks
     * The pointer pose represents the tip of a motion controller pointing forward.  This pose is best used to raycast when pointing at UI when you are rendering the controller model itself.
     * 
     * To examine the grip pose of a motion controller, examine the Position and Orientation properties directly on the SpatialInteractionSourceLocation instance.
     * 
     * This property will return null if the specified spatial interaction source does not support pointing ([IsPointingSupported](spatialinteractionsource_ispointingsupported.md) is false).
     * 
     * This property can return null, for example, when the spatial interaction source lost position or orientation tracking, in which case SpatialInteractionSourceLocation.Position or Orientation can also be null at the same time.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcelocation.sourcepointerpose
     * @type {SpatialPointerInteractionSourcePose} 
     */
    SourcePointerPose {
        get => this.get_SourcePointerPose()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<Vector3>} 
     */
    get_Position() {
        if (!this.HasProp("__ISpatialInteractionSourceLocation")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceLocation := ISpatialInteractionSourceLocation(outPtr)
        }

        return this.__ISpatialInteractionSourceLocation.get_Position()
    }

    /**
     * 
     * @returns {IReference<Vector3>} 
     */
    get_Velocity() {
        if (!this.HasProp("__ISpatialInteractionSourceLocation")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceLocation := ISpatialInteractionSourceLocation(outPtr)
        }

        return this.__ISpatialInteractionSourceLocation.get_Velocity()
    }

    /**
     * 
     * @returns {IReference<Quaternion>} 
     */
    get_Orientation() {
        if (!this.HasProp("__ISpatialInteractionSourceLocation2")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceLocation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceLocation2 := ISpatialInteractionSourceLocation2(outPtr)
        }

        return this.__ISpatialInteractionSourceLocation2.get_Orientation()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionAccuracy() {
        if (!this.HasProp("__ISpatialInteractionSourceLocation3")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceLocation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceLocation3 := ISpatialInteractionSourceLocation3(outPtr)
        }

        return this.__ISpatialInteractionSourceLocation3.get_PositionAccuracy()
    }

    /**
     * 
     * @returns {IReference<Vector3>} 
     */
    get_AngularVelocity() {
        if (!this.HasProp("__ISpatialInteractionSourceLocation3")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceLocation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceLocation3 := ISpatialInteractionSourceLocation3(outPtr)
        }

        return this.__ISpatialInteractionSourceLocation3.get_AngularVelocity()
    }

    /**
     * 
     * @returns {SpatialPointerInteractionSourcePose} 
     */
    get_SourcePointerPose() {
        if (!this.HasProp("__ISpatialInteractionSourceLocation3")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceLocation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceLocation3 := ISpatialInteractionSourceLocation3(outPtr)
        }

        return this.__ISpatialInteractionSourceLocation3.get_SourcePointerPose()
    }

;@endregion Instance Methods
}
