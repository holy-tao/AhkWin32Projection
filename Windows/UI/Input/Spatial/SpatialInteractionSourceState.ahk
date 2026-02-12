#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialInteractionSourceState.ahk
#Include .\ISpatialInteractionSourceState2.ahk
#Include .\ISpatialInteractionSourceState3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a snapshot of the state of a spatial interaction source (hand, motion controller, or speech) at a given time.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialInteractionSourceState extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialInteractionSourceState

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialInteractionSourceState.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the interaction source that this state describes.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate.source
     * @type {SpatialInteractionSource} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * Gets advanced state of the interaction source.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate.properties
     * @type {SpatialInteractionSourceProperties} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets whether a hand or motion controller is experiencing any press.
     * @remarks
     * This can be because a hand has a finger pressed or a motion controller has any button pressed.
     * 
     * To determine which specific presses are occurring, inspect the state's more specific properties such as [IsSelectPressed](spatialinteractionsourcestate_isselectpressed.md), [IsMenuPressed](spatialinteractionsourcestate_ismenupressed.md) or [IsGrasped](spatialinteractionsourcestate_isgrasped.md).  If this source is a motion controller, there are further controller-specific properties to inspect within the state's [ControllerProperties](spatialinteractionsourcestate_controllerproperties.md).
     * 
     * Note that a voice "Select" causes an instant press and release, and so you cannot poll for a voice press using IsPressed, IsSelectPressed or SelectPressedValue.  Instead, use a [SpatialGestureRecognizer](spatialgesturerecognizer.md) and handle the [Tapped](spatialgesturerecognizer_tapped.md) event, or handle the [SourcePressed](spatialinteractionmanager_sourcepressed.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate.ispressed
     * @type {Boolean} 
     */
    IsPressed {
        get => this.get_IsPressed()
    }

    /**
     * Gets the timestamp at which this state snapshot was taken.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate.timestamp
     * @type {PerceptionTimestamp} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets whether a hand or motion controller is experiencing a primary Select press.
     * @remarks
     * Select represents the primary press for a spatial interaction source:
     * * For hands, a Select press represents the user's index finger in the down position.
     * * For motion controllers, a Select press represents the controller's index-finger trigger (or primary face button, if no trigger) being fully pressed.
     * * For voice, a Select press represents the user saying the system keyword "Select".
     * 
     * Note that a voice "Select" causes an instant press and release, and so you cannot poll for a voice press using IsPressed, IsSelectPressed or SelectPressedValue.  Instead, use a [SpatialGestureRecognizer](spatialgesturerecognizer.md) and handle the [Tapped](spatialgesturerecognizer_tapped.md) event, or handle the [SourcePressed](spatialinteractionmanager_sourcepressed.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate.isselectpressed
     * @type {Boolean} 
     */
    IsSelectPressed {
        get => this.get_IsSelectPressed()
    }

    /**
     * Gets whether a motion controller is experiencing a Menu press.
     * @remarks
     * For motion controllers, a Menu press represents the controller's Menu button being pressed.
     * 
     * For all other spatial interaction sources, IsMenuPressed will be false.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate.ismenupressed
     * @type {Boolean} 
     */
    IsMenuPressed {
        get => this.get_IsMenuPressed()
    }

    /**
     * Gets whether an input device detects a grasp/grab action (how users take direct action on objects in order to manipulate them).
     * @remarks
     * A [SpatialInteractionSource](spatialinteractionsource.md) represents one of three possible sources of input.
     * 
     * - [Hand](/windows/mixed-reality/hands-and-motion-controllers-in-directx#articulated-hand-tracking) - The user's hand, which supports different features based on the input device. This ranges from basic gestures on HoloLens to fully articulated hand tracking on HoloLens 2.
     * - [Controller](/windows/mixed-reality/hands-and-motion-controllers-in-directx#controller-specific-input-properties) - A motion controller, which supports input options such as select triggers, menu buttons, grasp buttons, palm triggers, touchpads, or thumbsticks.
     * - [Speech](/windows/mixed-reality/voice-input-in-directx) - System keywords such as "Select" (which represents a press and release gesture).
     * 
     * | Source | Support |
     * | ------ | ------- |
     * | Hololens hand gesture | None |
     * | Articulated hand gestures | Pinch or closed hand |
     * | Controller | Grab button pressed or hand squeezed |
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate.isgrasped
     * @type {Boolean} 
     */
    IsGrasped {
        get => this.get_IsGrasped()
    }

    /**
     * Gets the amount to which a hand or motion controller is experiencing a primary Select press, as a value between 0.0 and 1.0.
     * @remarks
     * SelectPressedValue ranges from 0.0 to 1.0, with 0.0 representing no Select press and 1.0 representing a full Select press.  [IsPressed](spatialinteractionsourcestate_ispressed.md) will only return true once the SelectPressedValue reaches 1.0.  If a given source can only detect an on/off state for Select presses, the value will always be 0.0 or 1.0.
     * 
     * Select represents the primary press for a spatial interaction source:
     * * For hands, a Select press represents the user's index finger in the down position.
     * * For motion controllers, a Select press represents the controller's index-finger trigger (or primary face button, if no trigger) being fully pressed.
     * * For voice, a Select press represents the user saying the system keyword "Select".
     * 
     * Note that a voice "Select" causes an instant press and release, and so you cannot poll for a voice press using IsPressed, IsSelectPressed or SelectPressedValue.  Instead, use a [SpatialGestureRecognizer](spatialgesturerecognizer.md) and handle the [Tapped](spatialgesturerecognizer_tapped.md) event, or handle the [SourcePressed](spatialinteractionmanager_sourcepressed.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate.selectpressedvalue
     * @type {Float} 
     */
    SelectPressedValue {
        get => this.get_SelectPressedValue()
    }

    /**
     * Gets state specific to motion controllers.
     * @remarks
     * This property will return null if this source is not a motion controller.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate.controllerproperties
     * @type {SpatialInteractionControllerProperties} 
     */
    ControllerProperties {
        get => this.get_ControllerProperties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SpatialInteractionSource} 
     */
    get_Source() {
        if (!this.HasProp("__ISpatialInteractionSourceState")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceState := ISpatialInteractionSourceState(outPtr)
        }

        return this.__ISpatialInteractionSourceState.get_Source()
    }

    /**
     * 
     * @returns {SpatialInteractionSourceProperties} 
     */
    get_Properties() {
        if (!this.HasProp("__ISpatialInteractionSourceState")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceState := ISpatialInteractionSourceState(outPtr)
        }

        return this.__ISpatialInteractionSourceState.get_Properties()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPressed() {
        if (!this.HasProp("__ISpatialInteractionSourceState")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceState := ISpatialInteractionSourceState(outPtr)
        }

        return this.__ISpatialInteractionSourceState.get_IsPressed()
    }

    /**
     * 
     * @returns {PerceptionTimestamp} 
     */
    get_Timestamp() {
        if (!this.HasProp("__ISpatialInteractionSourceState")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceState := ISpatialInteractionSourceState(outPtr)
        }

        return this.__ISpatialInteractionSourceState.get_Timestamp()
    }

    /**
     * Gets the available pointer poses, such as the user's head gaze, eye gaze and each motion controller's pointer pose, for the timestamp when this state snapshot was taken.
     * @remarks
     * When targeting a spatial interaction, such as a hand gesture, motion controller press or voice interaction, apps should choose a pointing ray available from the interaction's [SpatialPointerPose](spatialpointerpose.md), based on the nature of the interaction's [SpatialInteractionSource](spatialinteractionsource.md):
     * * If the interaction source does not support pointing ([IsPointingSupported](spatialinteractionsource_ispointingsupported.md) is false), the app should target based on the user's head gaze, available through the [Head](spatialpointerpose_head.md) property.
     * * If the interaction source does support pointing ([IsPointingSupported](spatialinteractionsource_ispointingsupported.md) is true), the app may instead target based on the source's pointer pose, available through the [TryGetInteractionSourcePose](spatialpointerpose_trygetinteractionsourcepose_1162732260.md) method.
     * 
     * The app should then intersect the chosen pointing ray with its own holograms or with the spatial mapping mesh to render cursors and determine what the user is intending to interact with.
     * 
     * Once an interaction has started, relative motions of the hand or controller may be used to control the gesture, as with the [Manipulation](spatialgesturerecognizer_gesturesettings.md) or [Navigation](spatialgesturerecognizer_gesturesettings.md) gesture.
     * 
     * This method will return null if the specified coordinate system cannot be located at the moment.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system in which to express the pointer poses.
     * @returns {SpatialPointerPose} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate.trygetpointerpose
     */
    TryGetPointerPose(coordinateSystem) {
        if (!this.HasProp("__ISpatialInteractionSourceState")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceState := ISpatialInteractionSourceState(outPtr)
        }

        return this.__ISpatialInteractionSourceState.TryGetPointerPose(coordinateSystem)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSelectPressed() {
        if (!this.HasProp("__ISpatialInteractionSourceState2")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceState2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceState2 := ISpatialInteractionSourceState2(outPtr)
        }

        return this.__ISpatialInteractionSourceState2.get_IsSelectPressed()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMenuPressed() {
        if (!this.HasProp("__ISpatialInteractionSourceState2")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceState2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceState2 := ISpatialInteractionSourceState2(outPtr)
        }

        return this.__ISpatialInteractionSourceState2.get_IsMenuPressed()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGrasped() {
        if (!this.HasProp("__ISpatialInteractionSourceState2")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceState2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceState2 := ISpatialInteractionSourceState2(outPtr)
        }

        return this.__ISpatialInteractionSourceState2.get_IsGrasped()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SelectPressedValue() {
        if (!this.HasProp("__ISpatialInteractionSourceState2")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceState2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceState2 := ISpatialInteractionSourceState2(outPtr)
        }

        return this.__ISpatialInteractionSourceState2.get_SelectPressedValue()
    }

    /**
     * 
     * @returns {SpatialInteractionControllerProperties} 
     */
    get_ControllerProperties() {
        if (!this.HasProp("__ISpatialInteractionSourceState2")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceState2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceState2 := ISpatialInteractionSourceState2(outPtr)
        }

        return this.__ISpatialInteractionSourceState2.get_ControllerProperties()
    }

    /**
     * Gets the poses of the user's joints for this hand.
     * @returns {HandPose} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate.trygethandpose
     */
    TryGetHandPose() {
        if (!this.HasProp("__ISpatialInteractionSourceState3")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceState3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceState3 := ISpatialInteractionSourceState3(outPtr)
        }

        return this.__ISpatialInteractionSourceState3.TryGetHandPose()
    }

;@endregion Instance Methods
}
