#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialPointerPose.ahk
#Include .\ISpatialPointerPose2.ahk
#Include .\ISpatialPointerPose3.ahk
#Include .\ISpatialPointerPoseStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the available spatial pointer poses, such as the user's head gaze, eye gaze and each motion controller's pointer pose, for use in targeting hand gestures, motion controller presses, and speech interactions.
 * @remarks
 * The **SpatialPointerPose** provides the set of pointing rays available at the time represented by the [Timestamp](spatialpointerpose_timestamp.md) property.
 * 
 * When targeting a spatial interaction, such as a hand gesture, motion controller press or speech interaction, apps should choose a pointing ray available from the interaction's SpatialPointerPose, based on the nature of the interaction's [SpatialInteractionSource](spatialinteractionsource.md):
 * 
 * * If the interaction source does not support pointing ([IsPointingSupported](spatialinteractionsource_ispointingsupported.md) is false), the app should target based on the user's head gaze, available through the [Head](spatialpointerpose_head.md) property.
 * * If the interaction source does support pointing ([IsPointingSupported](spatialinteractionsource_ispointingsupported.md) is true), the app may instead target based on the source's pointer pose, available through the [TryGetInteractionSourcePose](spatialpointerpose_trygetinteractionsourcepose_1162732260.md) method.
 * 
 * The app should then intersect the chosen pointing ray with its own holograms or with the spatial mapping mesh to render cursors and determine what the user is intending to interact with.
 * 
 * Once an interaction has started, relative motions of the hand or controller may be used to control the gesture, as with the [Manipulation](spatialgesturerecognizer_gesturesettings.md) or [Navigation](spatialgesturerecognizer_gesturesettings.md) gesture.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialpointerpose
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialPointerPose extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialPointerPose

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialPointerPose.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the head gaze and motion controller pointer poses for the specified timestamp.
     * @remarks
     * This will either be a timestamp from the past (when correlating with input events) or a timestamp from the future (when rendering a cursor along the user's predicted gaze for a [HolographicFramePrediction](../windows.graphics.holographic/holographicframeprediction.md)).
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system in which to express the pointer poses.
     * @param {PerceptionTimestamp} timestamp_ The timestamp, past or future.
     * @returns {SpatialPointerPose} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialpointerpose.trygetattimestamp
     */
    static TryGetAtTimestamp(coordinateSystem, timestamp_) {
        if (!SpatialPointerPose.HasProp("__ISpatialPointerPoseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Spatial.SpatialPointerPose")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialPointerPoseStatics.IID)
            SpatialPointerPose.__ISpatialPointerPoseStatics := ISpatialPointerPoseStatics(factoryPtr)
        }

        return SpatialPointerPose.__ISpatialPointerPoseStatics.TryGetAtTimestamp(coordinateSystem, timestamp_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the timestamp when the pointing rays are determined.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialpointerpose.timestamp
     * @type {PerceptionTimestamp} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the user's head gaze for this timestamp.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialpointerpose.head
     * @type {HeadPose} 
     */
    Head {
        get => this.get_Head()
    }

    /**
     * Gets the user's eye gaze for this timestamp.
     * @remarks
     * You can determine if spatial eye gaze is supported on this device by checking [EyesPose.IsSupported](../windows.perception.people/eyespose_issupported_930300905.md).
     * 
     * This property is for reasoning about spatial eye gaze in a headset.  For screen-space eye gaze relative to a monitor, see [GazeDevicePreview](../windows.devices.input.preview/gazedevicepreview.md) instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialpointerpose.eyes
     * @type {EyesPose} 
     */
    Eyes {
        get => this.get_Eyes()
    }

    /**
     * Gets whether the user's head gaze is being captured by system UI at the moment (preventing gaze-driven presses from being delivered to the view associated with this [SpatialPointerPose](spatialpointerpose.md)).
     * @remarks
     * While the user's head gaze is targeting non-modal interactive system UI, gaze-driven presses such as taps and speech "select" keywords are delivered to that system UI rather than to the visible immersive view.  
     * 
     * If an app continues to show its gaze cursor while head gaze is captured, users may believe such presses will activate the app's UI. Instead, they'll activate the system UI, which can cause confusion.
     * 
     * While this property is true, an app can hide its gaze cursor, letting users know that gaze-driven presses are not currently active within the app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialpointerpose.isheadcapturedbysystem
     * @type {Boolean} 
     */
    IsHeadCapturedBySystem {
        get => this.get_IsHeadCapturedBySystem()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PerceptionTimestamp} 
     */
    get_Timestamp() {
        if (!this.HasProp("__ISpatialPointerPose")) {
            if ((queryResult := this.QueryInterface(ISpatialPointerPose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialPointerPose := ISpatialPointerPose(outPtr)
        }

        return this.__ISpatialPointerPose.get_Timestamp()
    }

    /**
     * 
     * @returns {HeadPose} 
     */
    get_Head() {
        if (!this.HasProp("__ISpatialPointerPose")) {
            if ((queryResult := this.QueryInterface(ISpatialPointerPose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialPointerPose := ISpatialPointerPose(outPtr)
        }

        return this.__ISpatialPointerPose.get_Head()
    }

    /**
     * Gets the pointer pose for a particular spatial interaction source, such as a motion controller, at a given timestamp.
     * @remarks
     * The pointer pose represents the tip of a motion controller pointing forward.  This pose is best used to raycast when pointing at UI when you are rendering the controller model itself.
     * 
     * To examine the grip pose of a motion controller, examine the Position and Orientation properties directly on a [SpatialInteractionSourceLocation](spatialinteractionsourcelocation.md) instance, available from [SpatialInteractionSourceState.Properties](spatialinteractionsourcestate_properties.md).[TryGetLocation](spatialinteractionsourceproperties_trygetlocation_1434864230.md).
     * 
     * This method will return null if the specified spatial interaction source does not support pointing ([IsPointingSupported](spatialinteractionsource_ispointingsupported.md) is false) or if the source did not have positional tracking at that moment.
     * @param {SpatialInteractionSource} source The spatial interaction source for which a pointer pose should be determined.
     * @returns {SpatialPointerInteractionSourcePose} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialpointerpose.trygetinteractionsourcepose
     */
    TryGetInteractionSourcePose(source) {
        if (!this.HasProp("__ISpatialPointerPose2")) {
            if ((queryResult := this.QueryInterface(ISpatialPointerPose2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialPointerPose2 := ISpatialPointerPose2(outPtr)
        }

        return this.__ISpatialPointerPose2.TryGetInteractionSourcePose(source)
    }

    /**
     * 
     * @returns {EyesPose} 
     */
    get_Eyes() {
        if (!this.HasProp("__ISpatialPointerPose3")) {
            if ((queryResult := this.QueryInterface(ISpatialPointerPose3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialPointerPose3 := ISpatialPointerPose3(outPtr)
        }

        return this.__ISpatialPointerPose3.get_Eyes()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHeadCapturedBySystem() {
        if (!this.HasProp("__ISpatialPointerPose3")) {
            if ((queryResult := this.QueryInterface(ISpatialPointerPose3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialPointerPose3 := ISpatialPointerPose3(outPtr)
        }

        return this.__ISpatialPointerPose3.get_IsHeadCapturedBySystem()
    }

;@endregion Instance Methods
}
