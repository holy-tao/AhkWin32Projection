#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGestureRecognizer.ahk
#Include .\IGestureRecognizer2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\GestureRecognizer.ahk
#Include .\TappedEventArgs.ahk
#Include .\RightTappedEventArgs.ahk
#Include .\HoldingEventArgs.ahk
#Include .\DraggingEventArgs.ahk
#Include .\ManipulationStartedEventArgs.ahk
#Include .\ManipulationUpdatedEventArgs.ahk
#Include .\ManipulationInertiaStartingEventArgs.ahk
#Include .\ManipulationCompletedEventArgs.ahk
#Include .\CrossSlidingEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides gesture and manipulation recognition, event listeners, and settings.
 * @remarks
 * You can create a gesture object for each appropriate element when your app starts. However, this approach might not scale well depending on the number of gesture objects you need to create (for example, a jigsaw puzzle with hundreds of pieces).
 * 
 * In this case, you can create gesture objects dynamically on a [pointerdown](/previous-versions/windows/internet-explorer/ie-developer/platform-apis/jj191898(v=vs.85)) event and destroy them on an [MSGestureEnd](/previous-versions/windows/internet-explorer/ie-developer/platform-apis/jj191886(v=vs.85)) event. This approach scales well, but does incur some overhead due to creating and releasing these objects.
 * 
 * Alternatively, you can statically allocate and dynamically manage a pool of reusable gesture objects.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * 
 * For more detail on how to use cross-slide functionality, see [Guidelines for cross-slide](/windows/uwp/input-and-devices/guidelines-for-cross-slide). The threshold distances used by the cross-slide interaction are shown in the following diagram.
 * 
 * <img src="images/crossslide_threshold.png" border="1" width="536" height="276" alt="Screen shot showing the select and drag and drop processes." />
 * 
 * The [PivotRadius](gesturerecognizer_pivotradius.md) and [PivotCenter](gesturerecognizer_pivotcenter.md) properties are used only when single pointer input is detected. They have no effect on multiple pointer input. The value for these properties should be updated regularly during the interaction.
 * 
 * Rotation is supported by a GestureRecognizer only when [manipulationRotate](gesturesettings.md) is set through the [GestureSettings](gesturerecognizer_gesturesettings.md) property.
 * 
 * Rotation is not supported for single pointer input if the value of [PivotRadius](gesturerecognizer_pivotradius.md) is set to 0.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class GestureRecognizer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGestureRecognizer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGestureRecognizer.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates the gesture and manipulation settings supported by an application.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.gesturesettings
     * @type {Integer} 
     */
    GestureSettings {
        get => this.get_GestureSettings()
        set => this.put_GestureSettings(value)
    }

    /**
     * Gets a value that indicates whether a manipulation is still being processed during inertia (no input points are active).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.isinertial
     * @type {Boolean} 
     */
    IsInertial {
        get => this.get_IsInertial()
    }

    /**
     * Gets a value that indicates whether an interaction is being processed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.isactive
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

    /**
     * Gets or sets a value that indicates whether visual feedback is displayed during an interaction.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.showgesturefeedback
     * @type {Boolean} 
     */
    ShowGestureFeedback {
        get => this.get_ShowGestureFeedback()
        set => this.put_ShowGestureFeedback(value)
    }

    /**
     * Gets or sets the center point for a rotation interaction when single pointer input is detected.
     * 
     * 
     * 
     * 
     * <!--•	GestureRecognizer.PivotRadius/Center properties: “rotation manipulation”  single finger rotation manipulation (especially in “Setting the value of PivotRadius to 0 disables support for the rotation manipulation”)-->
     * 
     * <!--•	GestureRecognizer.PivotCenter – This is just to support single input rotation.  Should also set PivotRadius too and have ManipulationRotations enabled.  This value needs to be constantly updated during a manipulation to give the updated center of the manipulated UI.  Units are in PointerPoint values being sent to the GestureRecognizer.
     * •	GestureRecognizer.PivotRadius – Again this is just used to support single input rotation manipulations.  Units are in the PointerPoint DIP values.
     * -->
     * 
     * <!--•	GestureRecognizer.PivotCenter – This is for single-finger rotation support only.  It doesn’t affect 2+ finger manipulations.  Same with PivotRadius.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.pivotcenter
     * @type {POINT} 
     */
    PivotCenter {
        get => this.get_PivotCenter()
        set => this.put_PivotCenter(value)
    }

    /**
     * Gets or sets the radius, from the [PivotCenter](gesturerecognizer_pivotcenter.md) to the pointer input, for a rotation interaction when single pointer input is detected.
     * 
     * 
     * 
     * 
     * <!--• GestureRecognizer.PivotRadius/Center properties: “rotation manipulation”  single finger rotation manipulation (especially in “Setting the value of PivotRadius to 0 disables support for the rotation manipulation”)-->
     * 
     * <!--• GestureRecognizer.PivotCenter – This is just to support single input rotation.  Should also set PivotRadius too and have ManipulationRotations enabled.  This value needs to be constantly updated during a manipulation to give the updated center of the manipulated UI.  Units are in PointerPoint values being sent to the GestureRecognizer.
     * • GestureRecognizer.PivotRadius – Again this is just used to support single input rotation manipulations.  Units are in the PointerPoint DIP values.
     * -->
     * 
     * <!--• GestureRecognizer.PivotCenter – This is for single-finger rotation support only.  It doesn’t affect 2+ finger manipulations.  Same with PivotRadius.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.pivotradius
     * @type {Float} 
     */
    PivotRadius {
        get => this.get_PivotRadius()
        set => this.put_PivotRadius(value)
    }

    /**
     * Gets or sets a value that indicates the rate of deceleration from the start of inertia to the end of inertia (when the translation manipulation is complete).
     * @remarks
     * If [InertiaTranslationDisplacement](gesturerecognizer_inertiatranslationdisplacement.md) is assigned a value, InertiaTranslationDeceleration is ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.inertiatranslationdeceleration
     * @type {Float} 
     */
    InertiaTranslationDeceleration {
        get => this.get_InertiaTranslationDeceleration()
        set => this.put_InertiaTranslationDeceleration(value)
    }

    /**
     * Gets or sets a value that indicates the rate of deceleration from the start of inertia to the end of inertia (when the rotation manipulation is complete).
     * @remarks
     * If [InertiaRotationAngle](gesturerecognizer_inertiarotationangle.md) is assigned a value, InertiaRotationDeceleration is ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.inertiarotationdeceleration
     * @type {Float} 
     */
    InertiaRotationDeceleration {
        get => this.get_InertiaRotationDeceleration()
        set => this.put_InertiaRotationDeceleration(value)
    }

    /**
     * Gets or sets a value that indicates the rate of deceleration from the start of inertia to the end of inertia (when the resizing, or expansion, manipulation is complete).
     * @remarks
     * If [InertiaExpansion](gesturerecognizer_inertiaexpansion.md) is assigned a value, InertiaExpansionDeceleration is ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.inertiaexpansiondeceleration
     * @type {Float} 
     */
    InertiaExpansionDeceleration {
        get => this.get_InertiaExpansionDeceleration()
        set => this.put_InertiaExpansionDeceleration(value)
    }

    /**
     * Gets or sets a value that indicates the relative change in the screen location of an object from the start of inertia to the end of inertia (when the translation manipulation is complete).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.inertiatranslationdisplacement
     * @type {Float} 
     */
    InertiaTranslationDisplacement {
        get => this.get_InertiaTranslationDisplacement()
        set => this.put_InertiaTranslationDisplacement(value)
    }

    /**
     * Gets or sets a value that indicates the final angle of rotation of an object at the end of inertia (when the rotation manipulation is complete).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.inertiarotationangle
     * @type {Float} 
     */
    InertiaRotationAngle {
        get => this.get_InertiaRotationAngle()
        set => this.put_InertiaRotationAngle(value)
    }

    /**
     * Gets or sets a value that indicates the relative change in size of an object from the start of inertia to the end of inertia (when resizing, or scaling, is complete).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.inertiaexpansion
     * @type {Float} 
     */
    InertiaExpansion {
        get => this.get_InertiaExpansion()
        set => this.put_InertiaExpansion(value)
    }

    /**
     * Gets or sets a value that indicates whether the exact distance from initial contact to end of the interaction is reported. By default, a small distance threshold is subtracted from the first delta reported by the system. This distance threshold is intended to account for slight movements of the contact when processing a tap gesture. If this flag is set, the distance threshold is not subtracted from the first delta.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.manipulationexact
     * @type {Boolean} 
     */
    ManipulationExact {
        get => this.get_ManipulationExact()
        set => this.put_ManipulationExact(value)
    }

    /**
     * Gets or sets values that indicate the distance thresholds for a [CrossSliding](gesturerecognizer_crosssliding.md) interaction.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.crossslidethresholds
     * @type {CrossSlideThresholds} 
     */
    CrossSlideThresholds {
        get => this.get_CrossSlideThresholds()
        set => this.put_CrossSlideThresholds(value)
    }

    /**
     * Gets or sets a value that indicates whether the cross-slide axis is horizontal.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.crossslidehorizontally
     * @type {Boolean} 
     */
    CrossSlideHorizontally {
        get => this.get_CrossSlideHorizontally()
        set => this.put_CrossSlideHorizontally(value)
    }

    /**
     * Gets or sets a value that indicates whether the exact distance from initial contact to end of the cross-slide interaction is reported.By default, a small distance threshold is subtracted from the first position reported by the system for cross-slide interactions. If this flag is set, the distance threshold is not subtracted from the initial position.
     * 
     * > [!NOTE]
     * > This distance threshold is intended to account for any slight movement of the contact after initial detection. It helps the system differentiate between cross-sliding and panning, and helps ensure that a tap gesture is not interpreted as either.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.crossslideexact
     * @type {Boolean} 
     */
    CrossSlideExact {
        get => this.get_CrossSlideExact()
        set => this.put_CrossSlideExact(value)
    }

    /**
     * Gets or sets a value that indicates whether manipulations during inertia are generated automatically.
     * @remarks
     * If the value for AutoProcessInertia is set to false, applications must call [ProcessInertia](gesturerecognizer_processinertia_1198131147.md) to handle events during inertia.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.autoprocessinertia
     * @type {Boolean} 
     */
    AutoProcessInertia {
        get => this.get_AutoProcessInertia()
        set => this.put_AutoProcessInertia(value)
    }

    /**
     * Gets a set of properties that are associated with the wheel button of a mouse device.
     * @remarks
     * The properties exposed through MouseWheelParameters are used in conjunction with the **Wheel** settings in the **Mouse** control panel to define the UI experience when using the wheel button.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.mousewheelparameters
     * @type {MouseWheelParameters} 
     */
    MouseWheelParameters {
        get => this.get_MouseWheelParameters()
    }

    /**
     * Gets or sets the minimum number of contact points needed to recognize a [Windows.UI.Input.GestureRecognizer.Tapped](gesturerecognizer_tapped.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.tapmincontactcount
     * @type {Integer} 
     */
    TapMinContactCount {
        get => this.get_TapMinContactCount()
        set => this.put_TapMinContactCount(value)
    }

    /**
     * Gets or sets the maximum number of contact points needed to recognize a [Windows.UI.Input.GestureRecognizer.Tapped](gesturerecognizer_tapped.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.tapmaxcontactcount
     * @type {Integer} 
     */
    TapMaxContactCount {
        get => this.get_TapMaxContactCount()
        set => this.put_TapMaxContactCount(value)
    }

    /**
     * Gets or sets the minimum number of contact points needed to recognize a [Windows.UI.Input.GestureRecognizer.Holding](gesturerecognizer_holding.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.holdmincontactcount
     * @type {Integer} 
     */
    HoldMinContactCount {
        get => this.get_HoldMinContactCount()
        set => this.put_HoldMinContactCount(value)
    }

    /**
     * Gets or sets the maximum number of contact points needed to recognize a [Windows.UI.Input.GestureRecognizer.Holding](gesturerecognizer_holding.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.holdmaxcontactcount
     * @type {Integer} 
     */
    HoldMaxContactCount {
        get => this.get_HoldMaxContactCount()
        set => this.put_HoldMaxContactCount(value)
    }

    /**
     * Gets or sets the radius of the contact points recognized for the [Windows.UI.Input.GestureRecognizer.Holding](gesturerecognizer_holding.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.holdradius
     * @type {Float} 
     */
    HoldRadius {
        get => this.get_HoldRadius()
        set => this.put_HoldRadius(value)
    }

    /**
     * Gets or sets the time threshold at which the contacts are recognized for the [Windows.UI.Input.GestureRecognizer.Holding](gesturerecognizer_holding.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.holdstartdelay
     * @type {TimeSpan} 
     */
    HoldStartDelay {
        get => this.get_HoldStartDelay()
        set => this.put_HoldStartDelay(value)
    }

    /**
     * Gets or sets the minimum number of contact points needed to recognize a translation (or panning) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.translationmincontactcount
     * @type {Integer} 
     */
    TranslationMinContactCount {
        get => this.get_TranslationMinContactCount()
        set => this.put_TranslationMinContactCount(value)
    }

    /**
     * Gets or sets the maximum number of contact points needed to recognize a translation (or panning) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.translationmaxcontactcount
     * @type {Integer} 
     */
    TranslationMaxContactCount {
        get => this.get_TranslationMaxContactCount()
        set => this.put_TranslationMaxContactCount(value)
    }

    /**
     * Occurs when the pointer input is interpreted as a tap gesture.
     * @type {TypedEventHandler<GestureRecognizer, TappedEventArgs>}
    */
    OnTapped {
        get {
            if(!this.HasProp("__OnTapped")){
                this.__OnTapped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{27f3ad57-8994-5712-8b83-a93ba17c03c2}"),
                    GestureRecognizer,
                    TappedEventArgs
                )
                this.__OnTappedToken := this.add_Tapped(this.__OnTapped.iface)
            }
            return this.__OnTapped
        }
    }

    /**
     * Occurs when the pointer input is interpreted as a right-tap gesture, regardless of input device.
     * + Right mouse button click
     * + Pen barrel button click
     * + Touch or pen press and hold
     * @remarks
     * Listen for this event when you want to display a context menu.
     * @type {TypedEventHandler<GestureRecognizer, RightTappedEventArgs>}
    */
    OnRightTapped {
        get {
            if(!this.HasProp("__OnRightTapped")){
                this.__OnRightTapped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{8420d242-ba34-5b17-92f3-8f767f1d0de4}"),
                    GestureRecognizer,
                    RightTappedEventArgs
                )
                this.__OnRightTappedToken := this.add_RightTapped(this.__OnRightTapped.iface)
            }
            return this.__OnRightTapped
        }
    }

    /**
     * Occurs when a user performs a press and hold gesture (with a single touch, mouse, or pen/stylus contact).
     * @remarks
     * To support Holding with touch and pen/stylus input, specify [Hold](gesturesettings.md) in the [GestureSettings](gesturerecognizer_gesturesettings.md) property.
     * 
     * To support Holding with mouse input, specify [HoldWithMouse](gesturesettings.md) in the [GestureSettings](gesturerecognizer_gesturesettings.md) property.
     * 
     * The Holding event is fired twice: Once when holding starts ([started](holdingstate.md)) and again when holding ends ([completed](holdingstate.md) or [canceled](holdingstate.md)).
     * @type {TypedEventHandler<GestureRecognizer, HoldingEventArgs>}
    */
    OnHolding {
        get {
            if(!this.HasProp("__OnHolding")){
                this.__OnHolding := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0027bdf5-6948-53f7-afbe-d4d8fe500feb}"),
                    GestureRecognizer,
                    HoldingEventArgs
                )
                this.__OnHoldingToken := this.add_Holding(this.__OnHolding.iface)
            }
            return this.__OnHolding
        }
    }

    /**
     * Occurs when a user performs a [slide](/windows/uwp/input-and-devices/guidelines-for-cross-slide) or [swipe](/windows/uwp/input-and-devices/guidelines-for-cross-slide) gesture with a mouse or pen/stylus (single contact).
     * @remarks
     * [Drag](gesturesettings.md) must be set in the [GestureSettings](gesturerecognizer_gesturesettings.md) property to support Dragging.
     * @type {TypedEventHandler<GestureRecognizer, DraggingEventArgs>}
    */
    OnDragging {
        get {
            if(!this.HasProp("__OnDragging")){
                this.__OnDragging := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{be7cca42-98dd-5d72-9e91-976113d7985e}"),
                    GestureRecognizer,
                    DraggingEventArgs
                )
                this.__OnDraggingToken := this.add_Dragging(this.__OnDragging.iface)
            }
            return this.__OnDragging
        }
    }

    /**
     * Occurs when one or more input points have been initiated and subsequent motion (translation, expansion, or rotation) has begun.
     * @type {TypedEventHandler<GestureRecognizer, ManipulationStartedEventArgs>}
    */
    OnManipulationStarted {
        get {
            if(!this.HasProp("__OnManipulationStarted")){
                this.__OnManipulationStarted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{110d75c8-ba5e-5462-8b2d-4a1582574b61}"),
                    GestureRecognizer,
                    ManipulationStartedEventArgs
                )
                this.__OnManipulationStartedToken := this.add_ManipulationStarted(this.__OnManipulationStarted.iface)
            }
            return this.__OnManipulationStarted
        }
    }

    /**
     * Occurs after one or more input points have been initiated and subsequent motion (translation, expansion, or rotation) is under way.
     * @type {TypedEventHandler<GestureRecognizer, ManipulationUpdatedEventArgs>}
    */
    OnManipulationUpdated {
        get {
            if(!this.HasProp("__OnManipulationUpdated")){
                this.__OnManipulationUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{eb5216f5-020a-5e40-9c4b-48912c690e2d}"),
                    GestureRecognizer,
                    ManipulationUpdatedEventArgs
                )
                this.__OnManipulationUpdatedToken := this.add_ManipulationUpdated(this.__OnManipulationUpdated.iface)
            }
            return this.__OnManipulationUpdated
        }
    }

    /**
     * Occurs when all contact points are lifted during a manipulation and the velocity of the manipulation is significant enough to initiate inertia behavior (translation, expansion, or rotation continue after the input pointers are lifted).
     * @remarks
     * Inertia is the tendency of an object to resist any change in its state of rest or its velocity.
     * 
     * This event is raised before inertia processing.
     * 
     * Inertia behavior for this manipulation can be customized in the handler for this event. For example, inertia can be set to end after a specific distance or UI is displayed.
     * 
     * > [!NOTE]
     * > These settings cannot be customized after the event.
     * @type {TypedEventHandler<GestureRecognizer, ManipulationInertiaStartingEventArgs>}
    */
    OnManipulationInertiaStarting {
        get {
            if(!this.HasProp("__OnManipulationInertiaStarting")){
                this.__OnManipulationInertiaStarting := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{350a72ab-34a5-5193-913d-3d4c5983842c}"),
                    GestureRecognizer,
                    ManipulationInertiaStartingEventArgs
                )
                this.__OnManipulationInertiaStartingToken := this.add_ManipulationInertiaStarting(this.__OnManipulationInertiaStarting.iface)
            }
            return this.__OnManipulationInertiaStarting
        }
    }

    /**
     * Occurs when the input points are lifted and all subsequent motion (translation, expansion, or rotation) through inertia has ended.
     * @type {TypedEventHandler<GestureRecognizer, ManipulationCompletedEventArgs>}
    */
    OnManipulationCompleted {
        get {
            if(!this.HasProp("__OnManipulationCompleted")){
                this.__OnManipulationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c24f5605-3059-52cc-bdf3-7098146d34d7}"),
                    GestureRecognizer,
                    ManipulationCompletedEventArgs
                )
                this.__OnManipulationCompletedToken := this.add_ManipulationCompleted(this.__OnManipulationCompleted.iface)
            }
            return this.__OnManipulationCompleted
        }
    }

    /**
     * Occurs when a user performs a [slide](/windows/uwp/input-and-devices/guidelines-for-cross-slide) or [swipe](/windows/uwp/input-and-devices/guidelines-for-cross-slide) gesture (through a single touch contact) within a content area that supports panning along a single axis only. The gesture must occur in a direction that is perpendicular to this panning axis.
     * 
     * > [!NOTE]
     * > A swipe is a short sliding gesture that results in a selection action while the longer slide gesture crosses a distance threshold and results in a rearrange action. The swipe and slide gestures are demonstrated in the following diagram.
     * <img src="images/crossslide_mechanism.png" width="534" height="180" alt="Diagram showing the select and drag actions." />
     * 
     * 
     * <!--kbridge: Font details: Segoe UI Symbol 11pt RGB: 214/31/126-->
     * @remarks
     * [CrossSlide](gesturesettings.md) must be set in the [GestureSettings](gesturerecognizer_gesturesettings.md) property to support CrossSliding.
     * 
     * CrossSliding distance thresholds are disabled by default. Use [CrossSlideThresholds](gesturerecognizer_crossslidethresholds.md) to set these values.
     * @type {TypedEventHandler<GestureRecognizer, CrossSlidingEventArgs>}
    */
    OnCrossSliding {
        get {
            if(!this.HasProp("__OnCrossSliding")){
                this.__OnCrossSliding := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1fc1eb70-0c26-5cf0-9e50-843a34083613}"),
                    GestureRecognizer,
                    CrossSlidingEventArgs
                )
                this.__OnCrossSlidingToken := this.add_CrossSliding(this.__OnCrossSliding.iface)
            }
            return this.__OnCrossSliding
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of a [GestureRecognizer](gesturerecognizer.md) object.
     * @remarks
     * The following is a list of default [GestureRecognizer](gesturerecognizer.md) property values. 
     * + [AutoProcessInertia](gesturerecognizer_autoprocessinertia.md): true
     * + [CrossSlideExact](gesturerecognizer_crossslidehorizontally.md): false
     * + [CrossSlideHorizontally](gesturerecognizer_crossslidehorizontally.md): false
     * + [CrossSlideThresholds](gesturerecognizer_crossslidethresholds.md): 0.0 for all values
     * + [GestureSettings](gesturerecognizer_gesturesettings.md): None
     * + [InertiaExpansion](gesturerecognizer_inertiaexpansion.md): 0.0 (system default used)
     * + [InertiaExpansionDeceleration](gesturerecognizer_inertiaexpansiondeceleration.md): 0.0 (system default used)
     * + [InertiaRotationAngle](gesturerecognizer_inertiarotationangle.md): 0.0 (system default used)
     * + [InertiaRotationDeceleration](gesturerecognizer_inertiarotationdeceleration.md): 0.0 (system default used)
     * + [InertiaTranslationDeceleration](gesturerecognizer_inertiatranslationdeceleration.md): 0.0 (system default used)
     * + [InertiaTranslationDisplacement](gesturerecognizer_inertiatranslationdisplacement.md): 0.0 (system default used)
     * + [IsActive](gesturerecognizer_isactive.md): false
     * + [IsInertial](gesturerecognizer_isinertial.md): false
     * + [ManipulationExact](gesturerecognizer_manipulationexact.md): false
     * + [MouseWheelParameters](gesturerecognizer_mousewheelparameters.md): system defaults used.
     * + [PivotCenter](gesturerecognizer_pivotcenter.md): (0,0)
     * + [PivotRadius](gesturerecognizer_pivotradius.md): 0
     * + [ShowGestureFeedback](gesturerecognizer_showgesturefeedback.md): true
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.GestureRecognizer")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnTappedToken")) {
            this.remove_Tapped(this.__OnTappedToken)
            this.__OnTapped.iface.Dispose()
        }

        if(this.HasProp("__OnRightTappedToken")) {
            this.remove_RightTapped(this.__OnRightTappedToken)
            this.__OnRightTapped.iface.Dispose()
        }

        if(this.HasProp("__OnHoldingToken")) {
            this.remove_Holding(this.__OnHoldingToken)
            this.__OnHolding.iface.Dispose()
        }

        if(this.HasProp("__OnDraggingToken")) {
            this.remove_Dragging(this.__OnDraggingToken)
            this.__OnDragging.iface.Dispose()
        }

        if(this.HasProp("__OnManipulationStartedToken")) {
            this.remove_ManipulationStarted(this.__OnManipulationStartedToken)
            this.__OnManipulationStarted.iface.Dispose()
        }

        if(this.HasProp("__OnManipulationUpdatedToken")) {
            this.remove_ManipulationUpdated(this.__OnManipulationUpdatedToken)
            this.__OnManipulationUpdated.iface.Dispose()
        }

        if(this.HasProp("__OnManipulationInertiaStartingToken")) {
            this.remove_ManipulationInertiaStarting(this.__OnManipulationInertiaStartingToken)
            this.__OnManipulationInertiaStarting.iface.Dispose()
        }

        if(this.HasProp("__OnManipulationCompletedToken")) {
            this.remove_ManipulationCompleted(this.__OnManipulationCompletedToken)
            this.__OnManipulationCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnCrossSlidingToken")) {
            this.remove_CrossSliding(this.__OnCrossSlidingToken)
            this.__OnCrossSliding.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GestureSettings() {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.get_GestureSettings()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_GestureSettings(value) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.put_GestureSettings(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInertial() {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.get_IsInertial()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.get_IsActive()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowGestureFeedback() {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.get_ShowGestureFeedback()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShowGestureFeedback(value) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.put_ShowGestureFeedback(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_PivotCenter() {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.get_PivotCenter()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_PivotCenter(value) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.put_PivotCenter(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PivotRadius() {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.get_PivotRadius()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PivotRadius(value) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.put_PivotRadius(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InertiaTranslationDeceleration() {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.get_InertiaTranslationDeceleration()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_InertiaTranslationDeceleration(value) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.put_InertiaTranslationDeceleration(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InertiaRotationDeceleration() {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.get_InertiaRotationDeceleration()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_InertiaRotationDeceleration(value) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.put_InertiaRotationDeceleration(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InertiaExpansionDeceleration() {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.get_InertiaExpansionDeceleration()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_InertiaExpansionDeceleration(value) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.put_InertiaExpansionDeceleration(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InertiaTranslationDisplacement() {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.get_InertiaTranslationDisplacement()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_InertiaTranslationDisplacement(value) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.put_InertiaTranslationDisplacement(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InertiaRotationAngle() {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.get_InertiaRotationAngle()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_InertiaRotationAngle(value) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.put_InertiaRotationAngle(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InertiaExpansion() {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.get_InertiaExpansion()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_InertiaExpansion(value) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.put_InertiaExpansion(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ManipulationExact() {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.get_ManipulationExact()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ManipulationExact(value) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.put_ManipulationExact(value)
    }

    /**
     * 
     * @returns {CrossSlideThresholds} 
     */
    get_CrossSlideThresholds() {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.get_CrossSlideThresholds()
    }

    /**
     * 
     * @param {CrossSlideThresholds} value 
     * @returns {HRESULT} 
     */
    put_CrossSlideThresholds(value) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.put_CrossSlideThresholds(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CrossSlideHorizontally() {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.get_CrossSlideHorizontally()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CrossSlideHorizontally(value) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.put_CrossSlideHorizontally(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CrossSlideExact() {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.get_CrossSlideExact()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CrossSlideExact(value) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.put_CrossSlideExact(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoProcessInertia() {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.get_AutoProcessInertia()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoProcessInertia(value) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.put_AutoProcessInertia(value)
    }

    /**
     * 
     * @returns {MouseWheelParameters} 
     */
    get_MouseWheelParameters() {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.get_MouseWheelParameters()
    }

    /**
     * Identifies whether a tap can still be interpreted as the second tap of a double tap gesture.
     * @remarks
     * This method supports [GestureRecognizer](gesturerecognizer.md) object pool management, where [GestureRecognizer](gesturerecognizer.md) objects are dynamically assigned to a set of UI elements.
     * 
     * Specifically, [GestureRecognizer](gesturerecognizer.md) objects can be recycled for UI elements that do not support or can no longer process a double tap gesture. For example, if CanBeDoubleTap returns true for the most recent [PointerPoint](pointerpoint.md), it’s not safe to recycle the [GestureRecognizer](gesturerecognizer.md) because a double tap is still a viable interaction based on subsequent input. If CanBeDoubleTap returns false, the [GestureRecognizer](gesturerecognizer.md) can be safely recycled.
     * 
     * This method is not required if [GestureRecognizer](gesturerecognizer.md) object pool management is not implemented.
     * @param {PointerPoint} value The last input pointer.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.canbedoubletap
     */
    CanBeDoubleTap(value) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.CanBeDoubleTap(value)
    }

    /**
     * Processes pointer input and raises the [GestureRecognizer](gesturerecognizer.md) events appropriate to a pointer down action for the gestures and manipulations specified by the [GestureSettings](gesturerecognizer_gesturesettings.md) property.
     * 
     * 
     * 
     * 
     * <!--Performs gesture detection and manipulation calculations based on pointer input, and raises various gesture/manipulation events.-->
     * 
     * <!--GestureRecognizer – The ProcessMoveEvents description sounds like it will raise pointer events.  You might want to word it “and raises the various GestureRecognizer events based on the pointer moved events”.  Same thing goes for the other Process* methods.-->
     * 
     * <!--GestureRecognizer.ProcessFoo() -  For all of the process methods, we should say something like, “processes the given input and raises gesture events as appropriate.”  The current wording is a little confusing – we don’t really have “pointer detected events” (on GR at least) or “pointer removed events”.-->
     * 
     * 
     * 
     * <!--This method is used to send PointerPoint input to the GestureRecognizer.  This is used with the ProcessMoves, ProcessUp and ProcessMouseWheel methods to send input to the GestureRecognizer to be recognized and triggered the various gesture events that have been configured via the GestureSettings flags.-->
     * @param {PointerPoint} value The input point.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.processdownevent
     */
    ProcessDownEvent(value) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.ProcessDownEvent(value)
    }

    /**
     * Processes pointer input and raises the [GestureRecognizer](gesturerecognizer.md) events appropriate to a pointer move action for the gestures and manipulations specified by the [GestureSettings](gesturerecognizer_gesturesettings.md) property.
     * @param {IVector<PointerPoint>} value The pointer location history based on the [PointerId](pointerpoint_pointerid.md) . If no history is available then the value is the current location of the input pointer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.processmoveevents
     */
    ProcessMoveEvents(value) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.ProcessMoveEvents(value)
    }

    /**
     * Processes pointer input and raises the [GestureRecognizer](gesturerecognizer.md) events appropriate to a pointer up action for the gestures and manipulations specified by the [GestureSettings](gesturerecognizer_gesturesettings.md) property.
     * @param {PointerPoint} value The input point.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.processupevent
     */
    ProcessUpEvent(value) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.ProcessUpEvent(value)
    }

    /**
     * Processes pointer input and raises the [GestureRecognizer](gesturerecognizer.md) events appropriate to a mouse wheel action for the gestures and manipulations specified by the [GestureSettings](gesturerecognizer_gesturesettings.md) property.
     * @param {PointerPoint} value The input point.
     * @param {Boolean} isShiftKeyDown True if the Shift key is pressed; otherwise false.
     * @param {Boolean} isControlKeyDown True if the Ctrl key is pressed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.processmousewheelevent
     */
    ProcessMouseWheelEvent(value, isShiftKeyDown, isControlKeyDown) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.ProcessMouseWheelEvent(value, isShiftKeyDown, isControlKeyDown)
    }

    /**
     * Performs inertia calculations and raises the various inertia events.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.processinertia
     */
    ProcessInertia() {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.ProcessInertia()
    }

    /**
     * Causes the gesture recognizer to finalize an interaction.
     * @remarks
     * This method sets [IsActive](gesturerecognizer_isactive.md) and [IsInertial](gesturerecognizer_isinertial.md) to false, based on the current state of the interaction. Depending on the interaction one of the following events is raised:
     * + A [ManipulationCompleted](gesturerecognizer_manipulationcompleted.md) event.
     * + A [CrossSliding](gesturerecognizer_crosssliding.md) event with a [CrossSlidingState](crossslidingeventargs_crossslidingstate.md) of [Completed](crossslidingstate.md).
     * + A [Holding](gesturerecognizer_holding.md) event with a [HoldingState](holdingeventargs_holdingstate.md) of [Completed](holdingstate.md).
     * + A [Dragging](gesturerecognizer_dragging.md) event with a [DraggingState](draggingeventargs_draggingstate.md) of [Completed](draggingstate.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.gesturerecognizer.completegesture
     */
    CompleteGesture() {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.CompleteGesture()
    }

    /**
     * 
     * @param {TypedEventHandler<GestureRecognizer, TappedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Tapped(handler) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.add_Tapped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Tapped(token) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.remove_Tapped(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GestureRecognizer, RightTappedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RightTapped(handler) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.add_RightTapped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RightTapped(token) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.remove_RightTapped(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GestureRecognizer, HoldingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Holding(handler) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.add_Holding(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Holding(token) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.remove_Holding(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GestureRecognizer, DraggingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Dragging(handler) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.add_Dragging(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Dragging(token) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.remove_Dragging(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GestureRecognizer, ManipulationStartedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationStarted(handler) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.add_ManipulationStarted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ManipulationStarted(token) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.remove_ManipulationStarted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GestureRecognizer, ManipulationUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationUpdated(handler) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.add_ManipulationUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ManipulationUpdated(token) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.remove_ManipulationUpdated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GestureRecognizer, ManipulationInertiaStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationInertiaStarting(handler) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.add_ManipulationInertiaStarting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ManipulationInertiaStarting(token) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.remove_ManipulationInertiaStarting(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GestureRecognizer, ManipulationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationCompleted(handler) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.add_ManipulationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ManipulationCompleted(token) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.remove_ManipulationCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GestureRecognizer, CrossSlidingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CrossSliding(handler) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.add_CrossSliding(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CrossSliding(token) {
        if (!this.HasProp("__IGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer := IGestureRecognizer(outPtr)
        }

        return this.__IGestureRecognizer.remove_CrossSliding(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TapMinContactCount() {
        if (!this.HasProp("__IGestureRecognizer2")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer2 := IGestureRecognizer2(outPtr)
        }

        return this.__IGestureRecognizer2.get_TapMinContactCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TapMinContactCount(value) {
        if (!this.HasProp("__IGestureRecognizer2")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer2 := IGestureRecognizer2(outPtr)
        }

        return this.__IGestureRecognizer2.put_TapMinContactCount(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TapMaxContactCount() {
        if (!this.HasProp("__IGestureRecognizer2")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer2 := IGestureRecognizer2(outPtr)
        }

        return this.__IGestureRecognizer2.get_TapMaxContactCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TapMaxContactCount(value) {
        if (!this.HasProp("__IGestureRecognizer2")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer2 := IGestureRecognizer2(outPtr)
        }

        return this.__IGestureRecognizer2.put_TapMaxContactCount(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HoldMinContactCount() {
        if (!this.HasProp("__IGestureRecognizer2")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer2 := IGestureRecognizer2(outPtr)
        }

        return this.__IGestureRecognizer2.get_HoldMinContactCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HoldMinContactCount(value) {
        if (!this.HasProp("__IGestureRecognizer2")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer2 := IGestureRecognizer2(outPtr)
        }

        return this.__IGestureRecognizer2.put_HoldMinContactCount(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HoldMaxContactCount() {
        if (!this.HasProp("__IGestureRecognizer2")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer2 := IGestureRecognizer2(outPtr)
        }

        return this.__IGestureRecognizer2.get_HoldMaxContactCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HoldMaxContactCount(value) {
        if (!this.HasProp("__IGestureRecognizer2")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer2 := IGestureRecognizer2(outPtr)
        }

        return this.__IGestureRecognizer2.put_HoldMaxContactCount(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HoldRadius() {
        if (!this.HasProp("__IGestureRecognizer2")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer2 := IGestureRecognizer2(outPtr)
        }

        return this.__IGestureRecognizer2.get_HoldRadius()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_HoldRadius(value) {
        if (!this.HasProp("__IGestureRecognizer2")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer2 := IGestureRecognizer2(outPtr)
        }

        return this.__IGestureRecognizer2.put_HoldRadius(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_HoldStartDelay() {
        if (!this.HasProp("__IGestureRecognizer2")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer2 := IGestureRecognizer2(outPtr)
        }

        return this.__IGestureRecognizer2.get_HoldStartDelay()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_HoldStartDelay(value) {
        if (!this.HasProp("__IGestureRecognizer2")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer2 := IGestureRecognizer2(outPtr)
        }

        return this.__IGestureRecognizer2.put_HoldStartDelay(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TranslationMinContactCount() {
        if (!this.HasProp("__IGestureRecognizer2")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer2 := IGestureRecognizer2(outPtr)
        }

        return this.__IGestureRecognizer2.get_TranslationMinContactCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TranslationMinContactCount(value) {
        if (!this.HasProp("__IGestureRecognizer2")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer2 := IGestureRecognizer2(outPtr)
        }

        return this.__IGestureRecognizer2.put_TranslationMinContactCount(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TranslationMaxContactCount() {
        if (!this.HasProp("__IGestureRecognizer2")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer2 := IGestureRecognizer2(outPtr)
        }

        return this.__IGestureRecognizer2.get_TranslationMaxContactCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TranslationMaxContactCount(value) {
        if (!this.HasProp("__IGestureRecognizer2")) {
            if ((queryResult := this.QueryInterface(IGestureRecognizer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGestureRecognizer2 := IGestureRecognizer2(outPtr)
        }

        return this.__IGestureRecognizer2.put_TranslationMaxContactCount(value)
    }

;@endregion Instance Methods
}
