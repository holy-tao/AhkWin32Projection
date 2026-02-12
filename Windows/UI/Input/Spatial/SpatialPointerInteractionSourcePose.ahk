#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialPointerInteractionSourcePose.ahk
#Include .\ISpatialPointerInteractionSourcePose2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a motion controller's pointer pose in relation to its surroundings.
 * @remarks
 * Windows Mixed Reality supports motion controllers in a variety of form factors, with each controller's design differing in its relationship between the user's hand position and the natural "forward" direction that apps should use for pointing when rendering the controller.
 * 
 * To better represent these controllers, there are two kinds of poses you can investigate for each interaction source.
 * 
 * The grip pose represents the location of either the palm of a hand detected by a HoloLens, or the palm holding a motion controller.  On immersive headsets, this pose is best used to render the user's hand or an object held in the user's hand, such as a sword or gun.  The grip pose is represented by the position, orientation and velocity properties directly within this type.
 * 
 * The pointer pose represents the tip of a motion controller pointing forward.  This pose is best used to raycast when pointing at UI when you are rendering the controller model itself.  The pointer pose can be accessed through the SourcePointerPose property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialpointerinteractionsourcepose
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialPointerInteractionSourcePose extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialPointerInteractionSourcePose

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialPointerInteractionSourcePose.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the position of the motion controller's pointer pose in the specified coordinate system.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialpointerinteractionsourcepose.position
     * @type {Vector3} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets the forward direction of the motion controller's pointer pose in the specified coordinate system, as a unit vector.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialpointerinteractionsourcepose.forwarddirection
     * @type {Vector3} 
     */
    ForwardDirection {
        get => this.get_ForwardDirection()
    }

    /**
     * Gets the up direction that orients the motion controller's pointer pose in the specified coordinate system, as a unit vector.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialpointerinteractionsourcepose.updirection
     * @type {Vector3} 
     */
    UpDirection {
        get => this.get_UpDirection()
    }

    /**
     * Gets the orientation of the motion controller's pointer pose in the specified coordinate system.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialpointerinteractionsourcepose.orientation
     * @type {Quaternion} 
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialpointerinteractionsourcepose.positionaccuracy
     * @type {Integer} 
     */
    PositionAccuracy {
        get => this.get_PositionAccuracy()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Position() {
        if (!this.HasProp("__ISpatialPointerInteractionSourcePose")) {
            if ((queryResult := this.QueryInterface(ISpatialPointerInteractionSourcePose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialPointerInteractionSourcePose := ISpatialPointerInteractionSourcePose(outPtr)
        }

        return this.__ISpatialPointerInteractionSourcePose.get_Position()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_ForwardDirection() {
        if (!this.HasProp("__ISpatialPointerInteractionSourcePose")) {
            if ((queryResult := this.QueryInterface(ISpatialPointerInteractionSourcePose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialPointerInteractionSourcePose := ISpatialPointerInteractionSourcePose(outPtr)
        }

        return this.__ISpatialPointerInteractionSourcePose.get_ForwardDirection()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_UpDirection() {
        if (!this.HasProp("__ISpatialPointerInteractionSourcePose")) {
            if ((queryResult := this.QueryInterface(ISpatialPointerInteractionSourcePose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialPointerInteractionSourcePose := ISpatialPointerInteractionSourcePose(outPtr)
        }

        return this.__ISpatialPointerInteractionSourcePose.get_UpDirection()
    }

    /**
     * 
     * @returns {Quaternion} 
     */
    get_Orientation() {
        if (!this.HasProp("__ISpatialPointerInteractionSourcePose2")) {
            if ((queryResult := this.QueryInterface(ISpatialPointerInteractionSourcePose2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialPointerInteractionSourcePose2 := ISpatialPointerInteractionSourcePose2(outPtr)
        }

        return this.__ISpatialPointerInteractionSourcePose2.get_Orientation()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionAccuracy() {
        if (!this.HasProp("__ISpatialPointerInteractionSourcePose2")) {
            if ((queryResult := this.QueryInterface(ISpatialPointerInteractionSourcePose2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialPointerInteractionSourcePose2 := ISpatialPointerInteractionSourcePose2(outPtr)
        }

        return this.__ISpatialPointerInteractionSourcePose2.get_PositionAccuracy()
    }

;@endregion Instance Methods
}
