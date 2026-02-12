#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialGestureRecognizer.ahk
#Include .\ISpatialGestureRecognizerFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\SpatialGestureRecognizer.ahk
#Include .\SpatialRecognitionStartedEventArgs.ahk
#Include .\SpatialRecognitionEndedEventArgs.ahk
#Include .\SpatialTappedEventArgs.ahk
#Include .\SpatialHoldStartedEventArgs.ahk
#Include .\SpatialHoldCompletedEventArgs.ahk
#Include .\SpatialHoldCanceledEventArgs.ahk
#Include .\SpatialManipulationStartedEventArgs.ahk
#Include .\SpatialManipulationUpdatedEventArgs.ahk
#Include .\SpatialManipulationCompletedEventArgs.ahk
#Include .\SpatialManipulationCanceledEventArgs.ahk
#Include .\SpatialNavigationStartedEventArgs.ahk
#Include .\SpatialNavigationUpdatedEventArgs.ahk
#Include .\SpatialNavigationCompletedEventArgs.ahk
#Include .\SpatialNavigationCanceledEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Interprets user interactions from hands, motion controllers, and system voice commands to surface spatial gesture events, which users target using their gaze or a motion controller's pointing ray.
 * @remarks
 * Spatial gestures are a key form of input for Mixed Reality headsets such as HoloLens. By routing interactions from the [SpatialInteractionManager](spatialinteractionmanager.md) to a hologram's SpatialGestureRecognizer, apps can detect Tap, Hold, Manipulation, and Navigation events uniformly across hands, voice, and motion controllers.
 * 
 * Note that spatial gestures are not detected for input from gamepads, keyboards or mice.
 * 
 * SpatialGestureRecognizer performs only the minimal disambiguation between the set of gestures that you request. For example, if you request just Tap, the user may hold their finger down as long as they like and a Tap will still occur. If you request both Tap and Hold, after about a second of holding down their finger, the gesture will promote to a Hold and a Tap will no longer occur.
 * 
 * To use SpatialGestureRecognizer, handle the SpatialInteractionManager's [InteractionDetected](spatialinteractionmanager_interactiondetected.md) event and grab the [SpatialPointerPose](spatialpointerpose.md) exposed there. Use the user's gaze ray from this pose to intersect with the holograms and surface meshes in the user's surroundings, in order to determine what the user is intending to interact with. Then, route the [SpatialInteraction](spatialinteraction.md) in the event arguments to the target hologram's SpatialGestureRecognizer, using its [CaptureInteraction](spatialgesturerecognizer_captureinteraction_1961957315.md) method. This starts interpreting that interaction according to the [SpatialGestureSettings](spatialgesturesettings.md) set on that recognizer at creation time or by [TrySetGestureSettings](spatialgesturerecognizer_trysetgesturesettings_136776216.md).
 * 
 * When targeting a spatial interaction, such as a hand gesture, motion controller press or voice interaction, apps should choose a pointing ray available from the interaction's SpatialPointerPose, based on the nature of the interaction's [SpatialInteractionSource](spatialinteractionsource.md):
 * 
 * * If the interaction source does not support pointing ([IsPointingSupported](spatialinteractionsource_ispointingsupported.md) is false), the app should target based on the user's gaze, available through the [Head](spatialpointerpose_head.md) property.
 * * If the interaction source does support pointing ([IsPointingSupported](spatialinteractionsource_ispointingsupported.md) is true), the app may instead target based on the source's pointer pose, available through the [TryGetInteractionSourcePose](spatialpointerpose_trygetinteractionsourcepose_1162732260.md) method.
 * 
 * The app should then intersect the chosen pointing ray with its own holograms or with the spatial mapping mesh to render cursors and determine what the user is intending to interact with.
 * 
 * For applications using the gaze-and-commit input model, particularly on HoloLens (first gen), SpatialGestureRecognizer can be used to to enable composite gestures built on top of the 'select' event. By routing interactions from the SpatialInteractionManager to a hologram's SpatialGestureRecognizer, apps can detect Tap, Hold, Manipulation, and Navigation events uniformly across hands, voice, and spatial input devices, without having to handle presses and releases manually.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialgesturerecognizer
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialGestureRecognizer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialGestureRecognizer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialGestureRecognizer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new [SpatialGestureRecognizer](spatialgesturerecognizer.md) with the specified gesture settings.
     * @param {Integer} settings The gesture settings for the new recognizer.
     * @returns {SpatialGestureRecognizer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialgesturerecognizer.#ctor
     */
    static Create(settings) {
        if (!SpatialGestureRecognizer.HasProp("__ISpatialGestureRecognizerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Spatial.SpatialGestureRecognizer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialGestureRecognizerFactory.IID)
            SpatialGestureRecognizer.__ISpatialGestureRecognizerFactory := ISpatialGestureRecognizerFactory(factoryPtr)
        }

        return SpatialGestureRecognizer.__ISpatialGestureRecognizerFactory.Create(settings)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the current [SpatialGestureSettings](spatialgesturesettings.md) for this recognizer.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialgesturerecognizer.gesturesettings
     * @type {Integer} 
     */
    GestureSettings {
        get => this.get_GestureSettings()
    }

    /**
     * Occurs when gesture recognition begins (this is the first event to fire).
     * @remarks
     * The [SpatialRecognitionStartedEventArgs](spatialrecognitionstartedeventargs.md) event fires when there is no active gesture and the gesture recognizer is told to capture an interaction. Events only fire if the interaction can trigger at least one of the gestures requested in [SpatialGestureSettings](spatialgesturesettings.md).
     * 
     * For hand interactions, this event fires on finger press.
     * 
     * For speech interactions, this event fires when a system voice command such as "Select" is spoken.
     * 
     * For motion controllers, this event fires when the Select trigger or button is pressed.
     * @type {TypedEventHandler<SpatialGestureRecognizer, SpatialRecognitionStartedEventArgs>}
    */
    OnRecognitionStarted {
        get {
            if(!this.HasProp("__OnRecognitionStarted")){
                this.__OnRecognitionStarted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f2bd99d6-99fa-5599-a14a-1f7a7a92e3d7}"),
                    SpatialGestureRecognizer,
                    SpatialRecognitionStartedEventArgs
                )
                this.__OnRecognitionStartedToken := this.add_RecognitionStarted(this.__OnRecognitionStarted.iface)
            }
            return this.__OnRecognitionStarted
        }
    }

    /**
     * Occurs when gesture recognition ends, due to completion or cancellation of a gesture (this is the last event to fire).
     * @remarks
     * For hand interactions, the [SpatialRecognitionEndedEventArgs](spatialrecognitionendedeventargs.md) event fires on finger release.
     * 
     * For speech interactions, this event fires after a system voice command such as "Select" has been processed.
     * 
     * For motion controllers, this event fires when the Select trigger or button is released.
     * 
     * This event also fires if the relevant interaction source is lost during recognition.
     * @type {TypedEventHandler<SpatialGestureRecognizer, SpatialRecognitionEndedEventArgs>}
    */
    OnRecognitionEnded {
        get {
            if(!this.HasProp("__OnRecognitionEnded")){
                this.__OnRecognitionEnded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{afa7fad7-3fd7-5c81-8802-195c523f6e7b}"),
                    SpatialGestureRecognizer,
                    SpatialRecognitionEndedEventArgs
                )
                this.__OnRecognitionEndedToken := this.add_RecognitionEnded(this.__OnRecognitionEnded.iface)
            }
            return this.__OnRecognitionEnded
        }
    }

    /**
     * Occurs when a Tap or DoubleTap gesture is recognized.
     * @remarks
     * For hand interactions, the [SpatialTappedEventArgs](spatialtappedeventargs.md) event fires on finger release after a finger press.
     * 
     * For speech interactions, this event fires after the system voice command "Select" has been processed.
     * 
     * For motion controller interactions, this event fires when the Select trigger or button is released after being pressed.
     * @type {TypedEventHandler<SpatialGestureRecognizer, SpatialTappedEventArgs>}
    */
    OnTapped {
        get {
            if(!this.HasProp("__OnTapped")){
                this.__OnTapped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{630205a4-2f93-5022-b7b8-c43ed428498a}"),
                    SpatialGestureRecognizer,
                    SpatialTappedEventArgs
                )
                this.__OnTappedToken := this.add_Tapped(this.__OnTapped.iface)
            }
            return this.__OnTapped
        }
    }

    /**
     * Occurs when an interaction becomes a [Hold](spatialgesturesettings.md) gesture.
     * @remarks
     * For hand interactions, the [SpatialHoldStartedEventArgs](spatialholdstartedeventargs.md) event fires when a finger is held pressed for longer than the Hold time threshold.
     * 
     * For speech interactions, this event does not fire.
     * 
     * For motion controller interactions, this event fires when the Select trigger or button is held pressed for longer than the Hold time threshold.
     * @type {TypedEventHandler<SpatialGestureRecognizer, SpatialHoldStartedEventArgs>}
    */
    OnHoldStarted {
        get {
            if(!this.HasProp("__OnHoldStarted")){
                this.__OnHoldStarted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7537dd12-02b8-5132-8ff7-90c80ef454d1}"),
                    SpatialGestureRecognizer,
                    SpatialHoldStartedEventArgs
                )
                this.__OnHoldStartedToken := this.add_HoldStarted(this.__OnHoldStarted.iface)
            }
            return this.__OnHoldStarted
        }
    }

    /**
     * Occurs when a [Hold](spatialgesturesettings.md) gesture completes.
     * @remarks
     * For hand interactions, the [SpatialHoldCompletedEventArgs](spatialholdcompletedeventargs.md) event fires when the finger is released after [HoldStarted](spatialgesturerecognizer_holdstarted.md).
     * 
     * For speech interactions, this event does not fire.
     * 
     * For motion controller interactions, this event fires when the Select trigger or button is released after [HoldStarted](spatialgesturerecognizer_holdstarted.md).
     * @type {TypedEventHandler<SpatialGestureRecognizer, SpatialHoldCompletedEventArgs>}
    */
    OnHoldCompleted {
        get {
            if(!this.HasProp("__OnHoldCompleted")){
                this.__OnHoldCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e425d80e-8c18-5375-b600-1dd7a11dba5e}"),
                    SpatialGestureRecognizer,
                    SpatialHoldCompletedEventArgs
                )
                this.__OnHoldCompletedToken := this.add_HoldCompleted(this.__OnHoldCompleted.iface)
            }
            return this.__OnHoldCompleted
        }
    }

    /**
     * Occurs when a [Hold](spatialgesturesettings.md) gesture is canceled.
     * @remarks
     * For hand interactions, the [SpatialHoldCanceledEventArgs](spatialholdcanceledeventargs.md) event fires when the [HoldStarted](spatialgesturerecognizer_holdstarted.md) hand is lost during the gesture.
     * 
     * For speech interactions, this event does not fire.
     * 
     * For motion controller interactions, this event fires when the [HoldStarted](spatialgesturerecognizer_holdstarted.md) controller is lost during the gesture.
     * @type {TypedEventHandler<SpatialGestureRecognizer, SpatialHoldCanceledEventArgs>}
    */
    OnHoldCanceled {
        get {
            if(!this.HasProp("__OnHoldCanceled")){
                this.__OnHoldCanceled := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6a715963-c49f-5f3d-bfec-952700308860}"),
                    SpatialGestureRecognizer,
                    SpatialHoldCanceledEventArgs
                )
                this.__OnHoldCanceledToken := this.add_HoldCanceled(this.__OnHoldCanceled.iface)
            }
            return this.__OnHoldCanceled
        }
    }

    /**
     * Occurs when an interaction becomes a [Manipulation](spatialgesturesettings.md) gesture.
     * @remarks
     * For hand interactions, the [SpatialManipulationStartedEventArgs](spatialmanipulationstartedeventargs.md) event fires when a finger is pressed and then moves outside of the small Manipulation dead-zone.
     * 
     * For speech and motion controller interactions, this event does not fire.
     * @type {TypedEventHandler<SpatialGestureRecognizer, SpatialManipulationStartedEventArgs>}
    */
    OnManipulationStarted {
        get {
            if(!this.HasProp("__OnManipulationStarted")){
                this.__OnManipulationStarted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a123252b-cfe8-5cfb-b61c-f2dc011eb12e}"),
                    SpatialGestureRecognizer,
                    SpatialManipulationStartedEventArgs
                )
                this.__OnManipulationStartedToken := this.add_ManipulationStarted(this.__OnManipulationStarted.iface)
            }
            return this.__OnManipulationStarted
        }
    }

    /**
     * Occurs when a [Manipulation](spatialgesturesettings.md) gesture is updated due to hand movement.
     * @remarks
     * For hand interactions, the [SpatialManipulationUpdatedEventArgs](spatialmanipulationupdatedeventargs.md) event fires when the [ManipulationStarted](spatialgesturerecognizer_manipulationstarted.md) hand updates its position.
     * 
     * For speech and motion controller interactions, this event does not fire.
     * @type {TypedEventHandler<SpatialGestureRecognizer, SpatialManipulationUpdatedEventArgs>}
    */
    OnManipulationUpdated {
        get {
            if(!this.HasProp("__OnManipulationUpdated")){
                this.__OnManipulationUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{cecbe023-3c49-530e-a010-8c0c3cbd3088}"),
                    SpatialGestureRecognizer,
                    SpatialManipulationUpdatedEventArgs
                )
                this.__OnManipulationUpdatedToken := this.add_ManipulationUpdated(this.__OnManipulationUpdated.iface)
            }
            return this.__OnManipulationUpdated
        }
    }

    /**
     * Occurs when a [Manipulation](spatialgesturesettings.md) gesture is completed.
     * @remarks
     * For hand interactions, the [SpatialManipulationCompletedEventArgs](spatialmanipulationcompletedeventargs.md) event fires when the finger is released after a [ManipulationStarted](spatialgesturerecognizer_manipulationstarted.md) event.
     * 
     * For speech and motion controller interactions, this event does not fire.
     * @type {TypedEventHandler<SpatialGestureRecognizer, SpatialManipulationCompletedEventArgs>}
    */
    OnManipulationCompleted {
        get {
            if(!this.HasProp("__OnManipulationCompleted")){
                this.__OnManipulationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{10dac914-bea2-5d67-8607-dc470ea1dcd8}"),
                    SpatialGestureRecognizer,
                    SpatialManipulationCompletedEventArgs
                )
                this.__OnManipulationCompletedToken := this.add_ManipulationCompleted(this.__OnManipulationCompleted.iface)
            }
            return this.__OnManipulationCompleted
        }
    }

    /**
     * Occurs when a [Manipulation](spatialgesturesettings.md) gesture is canceled.
     * @remarks
     * For hand interactions, the [SpatialManipulationCanceledEventArgs](spatialmanipulationcanceledeventargs.md) event fires when the [ManipulationStarted](spatialgesturerecognizer_manipulationstarted.md) hand is lost during the gesture.
     * 
     * For speech and motion controller interactions, this event does not fire.
     * @type {TypedEventHandler<SpatialGestureRecognizer, SpatialManipulationCanceledEventArgs>}
    */
    OnManipulationCanceled {
        get {
            if(!this.HasProp("__OnManipulationCanceled")){
                this.__OnManipulationCanceled := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b92a6754-3946-5353-b8f9-2a07eb0e8886}"),
                    SpatialGestureRecognizer,
                    SpatialManipulationCanceledEventArgs
                )
                this.__OnManipulationCanceledToken := this.add_ManipulationCanceled(this.__OnManipulationCanceled.iface)
            }
            return this.__OnManipulationCanceled
        }
    }

    /**
     * Occurs when an interaction becomes a [Navigation](spatialgesturesettings.md) gesture.
     * @remarks
     * For hand interactions, the [SpatialNavigationStartedEventArgs](spatialnavigationstartedeventargs.md) event fires when a finger is pressed and then moves outside of the small Navigation dead-zone.
     * 
     * For voice interactions, this event does not fire.
     * 
     * For motion controller interactions, this event fires when the Select trigger or button is pressed followed by the controller moving outside of the small Navigation dead-zone.
     * @type {TypedEventHandler<SpatialGestureRecognizer, SpatialNavigationStartedEventArgs>}
    */
    OnNavigationStarted {
        get {
            if(!this.HasProp("__OnNavigationStarted")){
                this.__OnNavigationStarted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5419cadc-2600-527b-9398-1744318d0618}"),
                    SpatialGestureRecognizer,
                    SpatialNavigationStartedEventArgs
                )
                this.__OnNavigationStartedToken := this.add_NavigationStarted(this.__OnNavigationStarted.iface)
            }
            return this.__OnNavigationStarted
        }
    }

    /**
     * Occurs when a [Navigation](spatialgesturesettings.md) gesture is updated due to hand or motion controller movement.
     * @remarks
     * For hand interactions, the [SpatialNavigationUpdatedEventArgs](spatialnavigationupdatedeventargs.md) event fires when the [NavigationStarted](spatialgesturerecognizer_navigationstarted.md) hand updates its position.
     * 
     * For voice interactions, this event does not fire.
     * 
     * For motion controller interactions, this event fires when the [NavigationStarted](spatialgesturerecognizer_navigationstarted.md) controller is moved.
     * @type {TypedEventHandler<SpatialGestureRecognizer, SpatialNavigationUpdatedEventArgs>}
    */
    OnNavigationUpdated {
        get {
            if(!this.HasProp("__OnNavigationUpdated")){
                this.__OnNavigationUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a7216b90-c175-5a28-b500-a445f0751c5b}"),
                    SpatialGestureRecognizer,
                    SpatialNavigationUpdatedEventArgs
                )
                this.__OnNavigationUpdatedToken := this.add_NavigationUpdated(this.__OnNavigationUpdated.iface)
            }
            return this.__OnNavigationUpdated
        }
    }

    /**
     * Occurs when a [Navigation](spatialgesturesettings.md) gesture is completed.
     * @remarks
     * For hand interactions, the [SpatialNavigationCompletedEventArgs](spatialnavigationcompletedeventargs.md) event fires when the finger is released after a [NavigationStarted](spatialgesturerecognizer_navigationstarted.md) event.
     * 
     * For speech interactions, this event does not fire.
     * 
     * For motion controller interactions, this event fires when the Select trigger or button is released after a [NavigationStarted](spatialgesturerecognizer_navigationstarted.md) event.
     * @type {TypedEventHandler<SpatialGestureRecognizer, SpatialNavigationCompletedEventArgs>}
    */
    OnNavigationCompleted {
        get {
            if(!this.HasProp("__OnNavigationCompleted")){
                this.__OnNavigationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f0d459df-ebd3-5388-b0a9-5f44bcd6f58f}"),
                    SpatialGestureRecognizer,
                    SpatialNavigationCompletedEventArgs
                )
                this.__OnNavigationCompletedToken := this.add_NavigationCompleted(this.__OnNavigationCompleted.iface)
            }
            return this.__OnNavigationCompleted
        }
    }

    /**
     * Occurs when a [Navigation](spatialgesturesettings.md) gesture is canceled.
     * @remarks
     * For hand interactions, the [SpatialNavigationCanceledEventArgs](spatialnavigationcanceledeventargs.md) event fires when the [NavigationStarted](spatialgesturerecognizer_navigationstarted.md) hand is lost during the gesture.
     * 
     * For speech interactions, this event does not fire.
     * 
     * For motion controller interactions, this event fires when the [NavigationStarted](spatialgesturerecognizer_navigationstarted.md) controller is lost during the gesture.
     * @type {TypedEventHandler<SpatialGestureRecognizer, SpatialNavigationCanceledEventArgs>}
    */
    OnNavigationCanceled {
        get {
            if(!this.HasProp("__OnNavigationCanceled")){
                this.__OnNavigationCanceled := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9947ea8e-eb4d-5f93-9fd9-2ade6470bc5d}"),
                    SpatialGestureRecognizer,
                    SpatialNavigationCanceledEventArgs
                )
                this.__OnNavigationCanceledToken := this.add_NavigationCanceled(this.__OnNavigationCanceled.iface)
            }
            return this.__OnNavigationCanceled
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnRecognitionStartedToken")) {
            this.remove_RecognitionStarted(this.__OnRecognitionStartedToken)
            this.__OnRecognitionStarted.iface.Dispose()
        }

        if(this.HasProp("__OnRecognitionEndedToken")) {
            this.remove_RecognitionEnded(this.__OnRecognitionEndedToken)
            this.__OnRecognitionEnded.iface.Dispose()
        }

        if(this.HasProp("__OnTappedToken")) {
            this.remove_Tapped(this.__OnTappedToken)
            this.__OnTapped.iface.Dispose()
        }

        if(this.HasProp("__OnHoldStartedToken")) {
            this.remove_HoldStarted(this.__OnHoldStartedToken)
            this.__OnHoldStarted.iface.Dispose()
        }

        if(this.HasProp("__OnHoldCompletedToken")) {
            this.remove_HoldCompleted(this.__OnHoldCompletedToken)
            this.__OnHoldCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnHoldCanceledToken")) {
            this.remove_HoldCanceled(this.__OnHoldCanceledToken)
            this.__OnHoldCanceled.iface.Dispose()
        }

        if(this.HasProp("__OnManipulationStartedToken")) {
            this.remove_ManipulationStarted(this.__OnManipulationStartedToken)
            this.__OnManipulationStarted.iface.Dispose()
        }

        if(this.HasProp("__OnManipulationUpdatedToken")) {
            this.remove_ManipulationUpdated(this.__OnManipulationUpdatedToken)
            this.__OnManipulationUpdated.iface.Dispose()
        }

        if(this.HasProp("__OnManipulationCompletedToken")) {
            this.remove_ManipulationCompleted(this.__OnManipulationCompletedToken)
            this.__OnManipulationCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnManipulationCanceledToken")) {
            this.remove_ManipulationCanceled(this.__OnManipulationCanceledToken)
            this.__OnManipulationCanceled.iface.Dispose()
        }

        if(this.HasProp("__OnNavigationStartedToken")) {
            this.remove_NavigationStarted(this.__OnNavigationStartedToken)
            this.__OnNavigationStarted.iface.Dispose()
        }

        if(this.HasProp("__OnNavigationUpdatedToken")) {
            this.remove_NavigationUpdated(this.__OnNavigationUpdatedToken)
            this.__OnNavigationUpdated.iface.Dispose()
        }

        if(this.HasProp("__OnNavigationCompletedToken")) {
            this.remove_NavigationCompleted(this.__OnNavigationCompletedToken)
            this.__OnNavigationCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnNavigationCanceledToken")) {
            this.remove_NavigationCanceled(this.__OnNavigationCanceledToken)
            this.__OnNavigationCanceled.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialGestureRecognizer, SpatialRecognitionStartedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RecognitionStarted(handler) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.add_RecognitionStarted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RecognitionStarted(token) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.remove_RecognitionStarted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialGestureRecognizer, SpatialRecognitionEndedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RecognitionEnded(handler) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.add_RecognitionEnded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RecognitionEnded(token) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.remove_RecognitionEnded(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialGestureRecognizer, SpatialTappedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Tapped(handler) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.add_Tapped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Tapped(token) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.remove_Tapped(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialGestureRecognizer, SpatialHoldStartedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_HoldStarted(handler) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.add_HoldStarted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_HoldStarted(token) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.remove_HoldStarted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialGestureRecognizer, SpatialHoldCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_HoldCompleted(handler) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.add_HoldCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_HoldCompleted(token) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.remove_HoldCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialGestureRecognizer, SpatialHoldCanceledEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_HoldCanceled(handler) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.add_HoldCanceled(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_HoldCanceled(token) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.remove_HoldCanceled(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialGestureRecognizer, SpatialManipulationStartedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationStarted(handler) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.add_ManipulationStarted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ManipulationStarted(token) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.remove_ManipulationStarted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialGestureRecognizer, SpatialManipulationUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationUpdated(handler) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.add_ManipulationUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ManipulationUpdated(token) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.remove_ManipulationUpdated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialGestureRecognizer, SpatialManipulationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationCompleted(handler) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.add_ManipulationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ManipulationCompleted(token) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.remove_ManipulationCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialGestureRecognizer, SpatialManipulationCanceledEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationCanceled(handler) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.add_ManipulationCanceled(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ManipulationCanceled(token) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.remove_ManipulationCanceled(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialGestureRecognizer, SpatialNavigationStartedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NavigationStarted(handler) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.add_NavigationStarted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NavigationStarted(token) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.remove_NavigationStarted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialGestureRecognizer, SpatialNavigationUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NavigationUpdated(handler) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.add_NavigationUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NavigationUpdated(token) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.remove_NavigationUpdated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialGestureRecognizer, SpatialNavigationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NavigationCompleted(handler) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.add_NavigationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NavigationCompleted(token) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.remove_NavigationCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialGestureRecognizer, SpatialNavigationCanceledEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NavigationCanceled(handler) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.add_NavigationCanceled(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NavigationCanceled(token) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.remove_NavigationCanceled(token)
    }

    /**
     * Track all input events that occur as part of the specified interaction.
     * @remarks
     * To use [SpatialGestureRecognizer](spatialgesturerecognizer.md), handle the [SpatialInteractionManager](spatialinteractionmanager.md)'s [InteractionDetected](spatialinteractionmanager_interactiondetected.md) event. I that event handler, get the [SpatialPointerPose](spatialpointerpose.md) (for that point in time) by calling [TryGetPointerPose](spatialinteractiondetectedeventargs_trygetpointerpose_100002244.md). Get the user's gaze ray from the [SpatialPointerPose](spatialpointerpose.md) and intersect it with the holograms and surfaces in the user's surroundings (to determine what the user is intending to interact with). Then, pass the [SpatialInteraction](spatialinteraction.md) event argument to the target hologram's [SpatialGestureRecognizer](spatialgesturerecognizer.md), using the CaptureInteraction method. The interaction is then interpreted according to the [SpatialGestureSettings](spatialgesturesettings.md) set when the recognizer was created.
     * 
     * > [!NOTE]
     * > You can choose to have more than one [SpatialGestureRecognizer](spatialgesturerecognizer.md) capture the same interaction. In this case, events surface from both recognizers according to their [SpatialGestureSettings](spatialgesturesettings.md). For example, when you have one hologram that supports Tap, logically contained within a hologram that supports scrolling with NavigationRailsY, and you want to support both gestures when gazing at the inner hologram.
     * @param {SpatialInteraction} interaction The interaction to capture from the [InteractionDetected](spatialinteractionmanager_interactiondetected.md) event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialgesturerecognizer.captureinteraction
     */
    CaptureInteraction(interaction) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.CaptureInteraction(interaction)
    }

    /**
     * Cancels all in-progress gestures and abandons any captured interactions.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialgesturerecognizer.cancelpendinggestures
     */
    CancelPendingGestures() {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.CancelPendingGestures()
    }

    /**
     * Attempts to change the gesture settings for this recognizer.
     * @remarks
     * This method can only succeed if there are no gestures currently in progress.
     * @param {Integer} settings The new [SpatialGestureSettings](spatialgesturesettings.md) to switch to.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialgesturerecognizer.trysetgesturesettings
     */
    TrySetGestureSettings(settings) {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.TrySetGestureSettings(settings)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GestureSettings() {
        if (!this.HasProp("__ISpatialGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(ISpatialGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGestureRecognizer := ISpatialGestureRecognizer(outPtr)
        }

        return this.__ISpatialGestureRecognizer.get_GestureSettings()
    }

;@endregion Instance Methods
}
