#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\CompositionObject.ahk
#Include .\IInteractionTracker.ahk
#Include .\IInteractionTracker2.ahk
#Include .\IInteractionTracker3.ahk
#Include .\IInteractionTracker4.ahk
#Include .\IInteractionTracker5.ahk
#Include .\IInteractionTrackerStatics.ahk
#Include .\IInteractionTrackerStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Handles the logic of input that can be used as targets in ExpressionAnimations—typically to drive the motion of visuals based on input.
 * @remarks
 * **InteractionTracker** is a state machine that can be driven by active input, or by explicit calls to update or animate its properties. The **InteractionTracker** class is intended to enable input to drive [CompositionAnimation](../windows.ui.composition/compositionanimation.md)s for custom interaction experiences. In order to build interactive experiences, it is necessary to associate one or more [VisualInteractionSource](visualinteractionsource.md)s with the **InteractionTracker**.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class InteractionTracker extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInteractionTracker

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInteractionTracker.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [InteractionTracker](interactiontracker.md).
     * 
     * This Create method will instantiate an [InteractionTracker](interactiontracker.md). After creating the [InteractionTracker](interactiontracker.md) setting the properties, attaching a [VisualInteractionSource](visualinteractionsource.md), and referencing position or scale in an [ExpressionAnimation](../windows.ui.composition/expressionanimation.md), active input can drive the [ExpressionAnimation](../windows.ui.composition/expressionanimation.md).
     * @param {Compositor} compositor_ The compositor to use when creating the [InteractionTracker](interactiontracker.md).
     * @returns {InteractionTracker} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.create
     */
    static Create(compositor_) {
        if (!InteractionTracker.HasProp("__IInteractionTrackerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Interactions.InteractionTracker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInteractionTrackerStatics.IID)
            InteractionTracker.__IInteractionTrackerStatics := IInteractionTrackerStatics(factoryPtr)
        }

        return InteractionTracker.__IInteractionTrackerStatics.Create(compositor_)
    }

    /**
     * Creates an instance of [InteractionTracker](interactiontracker.md) with the specified owner.
     * 
     * This Create method will instantiate an [InteractionTracker](interactiontracker.md) with an owner for registering for callbacks. After creating the [InteractionTracker](interactiontracker.md) setting the properties, attaching a [VisualInteractionSource](visualinteractionsource.md), and referencing position or scale in an [ExpressionAnimation](../windows.ui.composition/expressionanimation.md), active input can drive the [ExpressionAnimation](../windows.ui.composition/expressionanimation.md). Creating the [InteractionTracker](interactiontracker.md) with an owner is only required if the application needs to receive callbacks regarding state and values of the [InteractionTracker](interactiontracker.md).
     * @param {Compositor} compositor_ The compositor to use to create the instance of [InteractionTracker](interactiontracker.md).
     * @param {IInteractionTrackerOwner} owner The [InteractionTracker](interactiontracker.md) owner to associate with the created [InteractionTracker](interactiontracker.md).
     * @returns {InteractionTracker} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.createwithowner
     */
    static CreateWithOwner(compositor_, owner) {
        if (!InteractionTracker.HasProp("__IInteractionTrackerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Interactions.InteractionTracker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInteractionTrackerStatics.IID)
            InteractionTracker.__IInteractionTrackerStatics := IInteractionTrackerStatics(factoryPtr)
        }

        return InteractionTracker.__IInteractionTrackerStatics.CreateWithOwner(compositor_, owner)
    }

    /**
     * Sets the binding axis mode between two interaction trackers.
     * @remarks
     * Both interaction trackers (_boundTracker1_, _boundTracker2_) must come from the same Compositor.
     * 
     * Pass **None** as the _axisMode_ parameter to remove an existing binding mode.
     * @param {InteractionTracker} boundTracker1 The first interaction tracker in the binding.
     * @param {InteractionTracker} boundTracker2 The second interaction tracker in the binding.
     * @param {Integer} axisMode The axis that is being bound.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.setbindingmode
     */
    static SetBindingMode(boundTracker1, boundTracker2, axisMode) {
        if (!InteractionTracker.HasProp("__IInteractionTrackerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Interactions.InteractionTracker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInteractionTrackerStatics2.IID)
            InteractionTracker.__IInteractionTrackerStatics2 := IInteractionTrackerStatics2(factoryPtr)
        }

        return InteractionTracker.__IInteractionTrackerStatics2.SetBindingMode(boundTracker1, boundTracker2, axisMode)
    }

    /**
     * Retrieves the binding axis mode between two interaction trackers.
     * @param {InteractionTracker} boundTracker1 The first interaction tracker in the binding.
     * @param {InteractionTracker} boundTracker2 The second interaction tracker in the binding.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.getbindingmode
     */
    static GetBindingMode(boundTracker1, boundTracker2) {
        if (!InteractionTracker.HasProp("__IInteractionTrackerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Interactions.InteractionTracker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInteractionTrackerStatics2.IID)
            InteractionTracker.__IInteractionTrackerStatics2 := IInteractionTrackerStatics2(factoryPtr)
        }

        return InteractionTracker.__IInteractionTrackerStatics2.GetBindingMode(boundTracker1, boundTracker2)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * A collection of objects that generate interactions.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.interactionsources
     * @type {CompositionInteractionSourceCollection} 
     */
    InteractionSources {
        get => this.get_InteractionSources()
    }

    /**
     * Boolean value indicating whether position rounding is currently suggested.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.ispositionroundingsuggested
     * @type {Boolean} 
     */
    IsPositionRoundingSuggested {
        get => this.get_IsPositionRoundingSuggested()
    }

    /**
     * The maximum position allowed for the [InteractionTracker](interactiontracker.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.maxposition
     * @type {Vector3} 
     */
    MaxPosition {
        get => this.get_MaxPosition()
        set => this.put_MaxPosition(value)
    }

    /**
     * The maximum scale for the [InteractionTracker](interactiontracker.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.maxscale
     * @type {Float} 
     */
    MaxScale {
        get => this.get_MaxScale()
        set => this.put_MaxScale(value)
    }

    /**
     * The minimum position allowed for the [InteractionTracker](interactiontracker.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.minposition
     * @type {Vector3} 
     */
    MinPosition {
        get => this.get_MinPosition()
        set => this.put_MinPosition(value)
    }

    /**
     * The minimum scale for the [InteractionTracker](interactiontracker.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.minscale
     * @type {Float} 
     */
    MinScale {
        get => this.get_MinScale()
        set => this.put_MinScale(value)
    }

    /**
     * Natural resting position for the [InteractionTracker](interactiontracker.md).
     * 
     * The NaturalRestingPosition property is the calculated position that [InteractionTracker](interactiontracker.md) will come to a stop at without accounting for boundaries or inertia modifiers. This property is often useful for actions like virtualization in a scrolling experience, where it is important to know the location of where [InteractionTracker](interactiontracker.md) will stop. There are two main use cases for using the NaturalRestingPosition property: Retrieving its current value in the [InertiaStateEntered](iinteractiontrackerowner_inertiastateentered_615555038.md) event args or referencing this property in an [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) when creating things like inertia modifiers.
     * @remarks
     * The two use cases described in the code snippet above are the primary uses of the NaturalRestingPosition property. Although you may be tempted to reference this property off [InteractionTracker](interactiontracker.md) like any other object.property relationship, you will not always get the most up-to-date value. It is recommended in this situation that you listen for the [InertiaStateEntered](iinteractiontrackerowner_inertiastateentered_615555038.md) event and grab the latest value from the arguments.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.naturalrestingposition
     * @type {Vector3} 
     */
    NaturalRestingPosition {
        get => this.get_NaturalRestingPosition()
    }

    /**
     * Natural resting scale for the [InteractionTracker](interactiontracker.md).
     * 
     * The NaturalRestingScale property is the calculated scale position that [InteractionTracker](interactiontracker.md) will come to a stop at without accounting for boundaries or inertia modifiers. This property is often useful for actions like virtualization in a scrolling experience, where it is important to know the location of where [InteractionTracker](interactiontracker.md) will stop. There are two main use cases for using the NaturalRestingScale property: Retrieving its current value in the [InertiaStateEntered](iinteractiontrackerowner_inertiastateentered_615555038.md) event args or referencing this property in an [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) when creating things like inertia modifiers.
     * @remarks
     * The two use cases described in the code snippet are the primary uses of the NaturalRestingScale property. Although you may be tempted to reference this property off [InteractionTracker](interactiontracker.md) like any other object.property relationship, you will not always get the most up-to-date value. It is recommended in this situation that you listen for the [InertiaStateEntered](iinteractiontrackerowner_inertiastateentered_615555038.md) event and grab the latest value from the arguments.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.naturalrestingscale
     * @type {Float} 
     */
    NaturalRestingScale {
        get => this.get_NaturalRestingScale()
    }

    /**
     * The [IInteractionTrackerOwner](iinteractiontrackerowner.md) associated with the [InteractionTracker](interactiontracker.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.owner
     * @type {IInteractionTrackerOwner} 
     */
    Owner {
        get => this.get_Owner()
    }

    /**
     * The output position calculated by the [InteractionTracker](interactiontracker.md). The current position is a relative value. During the Idle and CustomAnimation states, it will always be between the values specified in the MinPosition and MaxPosition properties. The InteractionTracker’s position property can go outside this range during the Interacting and Inertia states in order to show a bounce or resistance at the boundary.
     * 
     * The position property of the InteractionTracker is a Vector3 representing position in the X, Y, and Z axis. The X and Y channels are the only components that will be updated by the InteractionTracker at this point. The channels of this Vector3 will not fluctuate outside of 0 (the default value) if the MinPosition and MaxPosition are not set.
     * @remarks
     * The [InteractionTracker](interactiontracker.md) position is populated either by active input through the [VisualInteractionSource](visualinteractionsource.md) or by direct calls to update the position. Active vertical or horizontal panning will respectively update the Y and X channels of the Vector3. All calls to animate or update the position accept Vector3 input and each channel can be evaluated individually. The position property used in an ExpressionAnimation will always reflect the current position of the [InteractionTracker](interactiontracker.md) taking into account factors such as boundaries and inertia modifiers.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.position
     * @type {Vector3} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Inertia decay rate for position. Range is from 0 to 1.
     * 
     * The PositionInertiaDecayRate property defines the rate at which [InteractionTracker](interactiontracker.md) will slow to a stop when it has entered Inertia and position is changing. The closer to 1, the faster [InteractionTracker](interactiontracker.md) will slow to a stop and vice versa. Defined as a Vector3, each component represents the inertia decay rate for x, y, z accordingly.
     * @remarks
     * Below is a graph of the equation that models the PositionInertiaDecayRate property against the position from the starting position of [InteractionTracker](interactiontracker.md) after entering inertia. Note that as the value of the property approaches 1, the impact of inertia increases more significantly.
     * 
     * In the graph, time is on the X axis, and position from the start of the interaction is on the Y. Notice that with a much larger value (closer to 1), the position from start is much smaller and plateaus earlier.
     * 
     * <img src="images/inertiavalues.png" alt="Slopes of inertia values with decay rates of 0.9, 0.6, 0.4, and 0.2." />
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.positioninertiadecayrate
     * @type {IReference<Vector3>} 
     */
    PositionInertiaDecayRate {
        get => this.get_PositionInertiaDecayRate()
        set => this.put_PositionInertiaDecayRate(value)
    }

    /**
     * The velocity currently applied to position.
     * 
     * The PositionVelocityInPixelsPerSecond property represents the current position velocity of [InteractionTracker](interactiontracker.md) while in Inertia. There are two main use cases for this property: Retrieving the position velocity of [InteractionTracker](interactiontracker.md) right after an interaction has occurred or reference the most current velocity of [InteractionTracker](interactiontracker.md) in an [ExpressionAnimation](../windows.ui.composition/expressionanimation.md).
     * @remarks
     * When accessing the PositionVelocityInPixelsPerSecond property from the [InertiaStateEntered](iinteractiontrackerowner_inertiastateentered_615555038.md) event, you will be retrieving a snapshot of the calculated velocity based on the interaction. This event will only fire once after the interaction has occurred.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.positionvelocityinpixelspersecond
     * @type {Vector3} 
     */
    PositionVelocityInPixelsPerSecond {
        get => this.get_PositionVelocityInPixelsPerSecond()
    }

    /**
     * The output scale calculated by the [InteractionTracker](interactiontracker.md). The current scale is a relative value that depends on the values specified in the [MinScale](interactiontracker_minscale.md) and [MaxScale](interactiontracker_maxscale.md) properties.
     * 
     * The scale property of the [InteractionTracker](interactiontracker.md) is a float representing the scale in the [InteractionTracker](interactiontracker.md) ’s coordinate space. This value will start at 1 and will increase or decrease based on active input or direct calls to update or animate the property. The scale property when the [InteractionTracker](interactiontracker.md) is in the Idle or CustomAnimation states will not change from 1 unless the [MinScale](interactiontracker_minscale.md) and [MaxScale](interactiontracker_maxscale.md) properties, which both default to 1, are updated. [InteractionTracker](interactiontracker.md) ’s scale can go slightly outside this range during the Interacting and Inertia states in order to show a bounce or resistance at the boundary.
     * @remarks
     * The [InteractionTracker](interactiontracker.md) scale is populated either by active input through the [VisualInteractionSource](visualinteractionsource.md) or by direct calls to update the scale. Active “pinch” input will update the [InteractionTracker](interactiontracker.md) ’s scale property if configured. All calls to animate or update the scale accept float input. The scale property referenced in an [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) will always reflect the current scale of the [InteractionTracker](interactiontracker.md) taking into account factors such as boundaries and inertia modifiers.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.scale
     * @type {Float} 
     */
    Scale {
        get => this.get_Scale()
    }

    /**
     * Inertia decay rate, for scale. Range is from 0 to 1.
     * 
     * The ScaleInertiaDecayRate property defines the rate at which [InteractionTracker](interactiontracker.md) will slow to a stop when it has entered Inertia and scale is changing. The closer to 1, the faster [InteractionTracker](interactiontracker.md) will slow to a stop and vice versa. Unlike the [PositionInertiaDecayRate](interactiontracker_positioninertiadecayrate.md) which is defined as a Vector3, ScaleInertiaDecayRate is defined as a single float.
     * @remarks
     * Below is a graph of the equation that models the ScaleInertiaDecayRate property. Note that as the value of the property approaches 1, the impact of inertia increases more significantly.
     * 
     * In the graph, time is on the X axis, and position from the start of the interaction is on the Y. Notice that with a much larger value (closer to 1), the position from start is much smaller and plateaus earlier.
     * 
     * <img src="images/inertiavalues.png" alt="Slopes of inertia values with decay rates of 0.9, 0.6, 0.4, and 0.2." />
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.scaleinertiadecayrate
     * @type {IReference<Float>} 
     */
    ScaleInertiaDecayRate {
        get => this.get_ScaleInertiaDecayRate()
        set => this.put_ScaleInertiaDecayRate(value)
    }

    /**
     * The rate of change for scale.
     * 
     * The ScaleVelocityInPercentPerSecond property represents the current scale velocity of [InteractionTracker](interactiontracker.md) while in Inertia. Grabbing the position velocity of [InteractionTracker](interactiontracker.md) right after an Interaction has occurred or reference the most current velocity of [InteractionTracker](interactiontracker.md) in an [ExpressionAnimation](../windows.ui.composition/expressionanimation.md).
     * @remarks
     * When accessing the ScaleVelocityInPercentPerSecond property off the [InertiaStateEntered](iinteractiontrackerowner_inertiastateentered_615555038.md) event, you will be retrieving a snapshot of the calculated velocity based on the Interaction. This event will only fire once after the interaction has occurred.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.scalevelocityinpercentpersecond
     * @type {Float} 
     */
    ScaleVelocityInPercentPerSecond {
        get => this.get_ScaleVelocityInPercentPerSecond()
    }

    /**
     * Gets a value that indicates whether the inertia is the result of an impulse.
     * @remarks
     * Inertia from an impulse includes both calls to TryUpdatePositionWithInitialVelocity, and auto-redirected pointer wheel input. This property evaluates to **true** within an expression when the input originates from a discrete source such as a pointer wheel. The property value should be used only when evaluating the conditions of an inertia modifier.
     * 
     * You can reference this property in the expression used to select an inertia modifier, which allows you to determine whether the inertia is being entered as a result of pointer wheel input. You can then provide different inertia modifiers for these types of interactions than you provide for continuous manipulations, like touch and touchpad.
     * 
     * For example, when scrolling a page of content, a small touch delta can result in the content getting snapped back to its original starting value. However, when scrolling with the pointer wheel, each tick of the wheel should move the content a full page per tick. You can define snap points (inertia modifiers) for use with the pointer wheel that will snap scrolling to a desired endpoint, but specify different criteria for the snap points that are used with touch or direct manipulation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.isinertiafromimpulse
     * @type {Boolean} 
     */
    IsInertiaFromImpulse {
        get => this.get_IsInertiaFromImpulse()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CompositionInteractionSourceCollection} 
     */
    get_InteractionSources() {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.get_InteractionSources()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPositionRoundingSuggested() {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.get_IsPositionRoundingSuggested()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_MaxPosition() {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.get_MaxPosition()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_MaxPosition(value) {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.put_MaxPosition(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxScale() {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.get_MaxScale()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxScale(value) {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.put_MaxScale(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_MinPosition() {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.get_MinPosition()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_MinPosition(value) {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.put_MinPosition(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinScale() {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.get_MinScale()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MinScale(value) {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.put_MinScale(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_NaturalRestingPosition() {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.get_NaturalRestingPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NaturalRestingScale() {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.get_NaturalRestingScale()
    }

    /**
     * 
     * @returns {IInteractionTrackerOwner} 
     */
    get_Owner() {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.get_Owner()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Position() {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.get_Position()
    }

    /**
     * 
     * @returns {IReference<Vector3>} 
     */
    get_PositionInertiaDecayRate() {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.get_PositionInertiaDecayRate()
    }

    /**
     * 
     * @param {IReference<Vector3>} value 
     * @returns {HRESULT} 
     */
    put_PositionInertiaDecayRate(value) {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.put_PositionInertiaDecayRate(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_PositionVelocityInPixelsPerSecond() {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.get_PositionVelocityInPixelsPerSecond()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Scale() {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.get_Scale()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_ScaleInertiaDecayRate() {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.get_ScaleInertiaDecayRate()
    }

    /**
     * 
     * @param {IReference<Float>} value 
     * @returns {HRESULT} 
     */
    put_ScaleInertiaDecayRate(value) {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.put_ScaleInertiaDecayRate(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScaleVelocityInPercentPerSecond() {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.get_ScaleVelocityInPercentPerSecond()
    }

    /**
     * Adjusts the position x coordinate if it is greater than the specified threshold.
     * @param {Float} adjustment The amount to adjust the position x coordinate.
     * @param {Float} positionThreshold The threshold for ajusting the position x coordinate.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.adjustpositionxifgreaterthanthreshold
     */
    AdjustPositionXIfGreaterThanThreshold(adjustment, positionThreshold) {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.AdjustPositionXIfGreaterThanThreshold(adjustment, positionThreshold)
    }

    /**
     * Adjusts the position y coordinate if it is greater than the specified threshold.
     * @param {Float} adjustment The amount to adjust the position y coordinate.
     * @param {Float} positionThreshold The threshold for ajusting the position y coordinate.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.adjustpositionyifgreaterthanthreshold
     */
    AdjustPositionYIfGreaterThanThreshold(adjustment, positionThreshold) {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.AdjustPositionYIfGreaterThanThreshold(adjustment, positionThreshold)
    }

    /**
     * Applies a collection of InteractionTrackerInertiaModifier objects to the x inertia of an InteractionTracker.
     * 
     * The ConfigurePositionXInertiaModifiers method applies an individual or a collection of [InteractionTrackerInertiaModifier](interactiontrackerinertiamodifier.md)s to the x component of [InteractionTracker](interactiontracker.md). The system will evaluate each of X modifier's condition property in the order they were added to [InteractionTracker](interactiontracker.md). Thus, the order that the [InteractionTrackerInertiaModifier](interactiontrackerinertiamodifier.md) have in the collection will be the same order that the system will evaluate with.
     * @remarks
     * If you have a dependency on the system evaluating the inertia modifiers in a particular order, ensure that they are inserted into the list (if multiple) or into [InteractionTracker](interactiontracker.md) directly (if single) in the order you want them evaluated. The system will evaluate the conditions of the inertia modifiers in the order they are inserted.
     * @param {IIterable<InteractionTrackerInertiaModifier>} modifiers_ The collection of InteractionTrackerInertiaModifier objects to apply to the x inertia of an InteractionTracker.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.configurepositionxinertiamodifiers
     */
    ConfigurePositionXInertiaModifiers(modifiers_) {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.ConfigurePositionXInertiaModifiers(modifiers_)
    }

    /**
     * Applies a collection of InteractionTrackerInertiaModifier objects to the y inertia of an InteractionTracker.
     * 
     * The ConfigurePositionYInertiaModifiers method applies an individual or a collection of [InteractionTrackerInertiaModifier](interactiontrackerinertiamodifier.md)s to the y component of [InteractionTracker](interactiontracker.md). The system will evaluate each of Y modifier’s condition property in the order they were added to [InteractionTracker](interactiontracker.md). Thus, the order that the [InteractionTrackerInertiaModifier](interactiontrackerinertiamodifier.md) have in the collection will be the same order that the system will evaluate with.
     * @param {IIterable<InteractionTrackerInertiaModifier>} modifiers_ The collection of InteractionTrackerInertiaModifier objects to apply to the y inertia of an InteractionTracker.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.configurepositionyinertiamodifiers
     */
    ConfigurePositionYInertiaModifiers(modifiers_) {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.ConfigurePositionYInertiaModifiers(modifiers_)
    }

    /**
     * Applies a collection of InteractionTrackerInertiaModifier objects to the scale of an InteractionTracker.
     * 
     * The ConfigureScaleInertiaModifiers method applies an individual or a collection of [InteractionTrackerInertiaModifier](interactiontrackerinertiamodifier.md)s to the scale component of [InteractionTracker](interactiontracker.md). The system will evaluate each of Scale modifier’s condition property in the order they were added to [InteractionTracker](interactiontracker.md). Thus, the order that the [InteractionTrackerInertiaModifier](interactiontrackerinertiamodifier.md) have in the collection will be the same order that the system will evaluate with.
     * @param {IIterable<InteractionTrackerInertiaModifier>} modifiers_ The collection of InteractionTrackerInertiaModifier objects to apply to the scale of an InteractionTracker.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.configurescaleinertiamodifiers
     */
    ConfigureScaleInertiaModifiers(modifiers_) {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.ConfigureScaleInertiaModifiers(modifiers_)
    }

    /**
     * Tries to update the position of the [InteractionTracker](interactiontracker.md) using the specified clamping option.
     * @param {Vector3} value The new position for the [InteractionTracker](interactiontracker.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.tryupdateposition
     */
    TryUpdatePosition(value) {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.TryUpdatePosition(value)
    }

    /**
     * Tries to adjust the position of the [InteractionTracker](interactiontracker.md) by the specified amount using the specified clamping option.
     * @param {Vector3} amount The value to add to the current position.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.tryupdatepositionby
     */
    TryUpdatePositionBy(amount) {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.TryUpdatePositionBy(amount)
    }

    /**
     * Tries to update the [InteractionTracker](interactiontracker.md)'s position by applying an animation.
     * 
     * The TryUpdatePositionWithAnimation method updates the position of [InteractionTracker](interactiontracker.md) based on the [CompositionAnimation](../windows.ui.composition/compositionanimation.md) input as a parameter. This method is used in situations in which the motion of [InteractionTracker](interactiontracker.md) needs to be defined by a specific animation, instead of the traditional Inertia experience. TryUpdatePositionWithAnimation can be called from the Idle or Inertia state – doing so, [InteractionTracker](interactiontracker.md) ’s position will be driven by the defined animation and enter the CustomAnimation state.
     * @remarks
     * When creating the animation you want to update [InteractionTracker](interactiontracker.md) ’s position with, you do not need to call [StartAnimation](../windows.ui.composition/compositionobject_startanimation_709050842.md). The system will take care of this behind the scenes once the animation is passed in via TryUpdatePositionWithAnimation.
     * 
     * When defining the animation that will animate [InteractionTracker](interactiontracker.md) ’s position, be sure to either use a [Vector3KeyFrameAnimation](../windows.ui.composition/vector3keyframeanimation.md) or an [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) that resolves to a Vector3.
     * 
     * The table below summarizes the expected behavior when this method is called in a particular state:
     * 
     * <table>
     *    <tr><th>Current State</th><th>Outcome</th></tr>
     *    <tr><td>Idle</td><td>Requested animation starts on requested property, state changes to CustomAnimation</td></tr>
     *    <tr><td>Interacting</td><td>Request ignored</td></tr>
     *    <tr><td>Inertia</td><td>Requested animation starts on requested property, state changes to CustomAnimation</td></tr>
     *    <tr><td>CustomAnimation</td><td>Current animation stops and new requested animation starts on requested property, state re-enters CustomAnimation</td></tr>
     * </table>
     * @param {CompositionAnimation} animation The animation to apply to the [InteractionTracker](interactiontracker.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.tryupdatepositionwithanimation
     */
    TryUpdatePositionWithAnimation(animation) {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.TryUpdatePositionWithAnimation(animation)
    }

    /**
     * Tries to update the [InteractionTracker](interactiontracker.md)'s position by adding velocity.
     * 
     * The TryUpdatePositionWithAdditionalVelocity method adds the input Vector3 representing additional velocity to the current velocity of [InteractionTracker](interactiontracker.md). As a result, because the velocity of [InteractionTracker](interactiontracker.md) has now changed, the targeted rest position for [InteractionTracker](interactiontracker.md) now changes. TryUpdatePositionWithAdditionalVelocity can be called from either Idle, Inertia or CustomAnimation states – doing so will either add or update the velocity of [InteractionTracker](interactiontracker.md) and enter the Inertia state.
     * @remarks
     * If [InteractionTracker](interactiontracker.md) is in its Interacting State (user actively manipulating), and TryUpdatePositionWithAdditionalVelocity is called, the system will ignore this request – an event gets fired when this occurs that can be listened for. If sent from one of the other states, listen for the event fired for [InertiaStateEntered](iinteractiontrackerowner_inertiastateentered_615555038.md) and check the RequestId property that identifies which request triggered the callback. The table below summarizes the expected behavior when this method is called in a particular state:
     * 
     * <table>
     *    <tr><th>Current State</th><th>Outcome</th></tr>
     *    <tr><td>Idle</td><td>State changes to inertia and inertia modifiers are evaluated with requested velocity as initial velocity</td></tr>
     *    <tr><td>Interacting</td><td>Request ignored</td></tr>
     *    <tr><td>Inertia</td><td>Inertia is restarted (state re-enters inertia) and inertia modifiers are evaluated with requested velocity added to current velocity</td></tr>
     *    <tr><td>CustomAnimation</td><td>Current animation stops and state changes to inertia with inertia modifiers evaluated using requested velocity as initial velocity</td></tr>
     * </table>
     * @param {Vector3} velocityInPixelsPerSecond The velocity to add in pixels per second.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.tryupdatepositionwithadditionalvelocity
     */
    TryUpdatePositionWithAdditionalVelocity(velocityInPixelsPerSecond) {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.TryUpdatePositionWithAdditionalVelocity(velocityInPixelsPerSecond)
    }

    /**
     * Tries to update the scale to the specified value.
     * 
     * The TryUpdateScale method updates the scale location of [InteractionTracker](interactiontracker.md) to the Scale position and centerpoint specified as a parameter. TryUpdateScale is used to declaratively define the scale of [InteractionTracker](interactiontracker.md) at any point in time (either at start, from some state-entered event, etc.). TryUpdateScale can be called from either the Idle, CustomAnimation or Inertia state – doing so will move the scale position of [InteractionTracker](interactiontracker.md) to the defined position and enter the idle state.
     * @remarks
     * If [InteractionTracker](interactiontracker.md) is in its Interacting State (user actively manipulating), and TryUpdateScale is called, the system will ignore this request – an event gets fired when this occurs that can be listened for. If sent from one of the other states, listen for the event fired for IdleStateEntered and check the RequestID property that identifies which request triggered the callback.
     * 
     * The table below summarizes the expected behavior when this method is called in a particular state:
     * 
     * <table>
     *    <tr><th>Current State</th><th>Outcome</th></tr>
     *    <tr><td>Idle</td><td>Property updates to requested value, no state changes</td></tr>
     *    <tr><td>Interacting</td><td>Request ignored</td></tr>
     *    <tr><td>Inertia</td><td>Property updates to requested value, state changes to Idle</td></tr>
     *    <tr><td>CustomAnimation</td><td>Property updates to requested value, state changes to Idle</td></tr>
     * </table>
     * @param {Float} value The new value for scale.
     * @param {Vector3} centerPoint The new center point.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.tryupdatescale
     */
    TryUpdateScale(value, centerPoint) {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.TryUpdateScale(value, centerPoint)
    }

    /**
     * Tries to update the scale with the specified animation.
     * 
     * The TryUpdateScaleWithAnimation method updates the scale position of [InteractionTracker](interactiontracker.md) based on the [CompositionAnimation](../windows.ui.composition/compositionanimation.md) inputted as a parameter. This method is used in situations in which the motion of [InteractionTracker](interactiontracker.md) needs to be defined by a specific animation, instead of the traditional Inertia experience. TryUpdateScaleWithAnimation can be called from the Idle or Inertia state – doing so, [InteractionTracker](interactiontracker.md) ’s position will be driven by the defined animation and enter the CustomAnimation state.
     * @remarks
     * When creating the animation you want to update [InteractionTracker](interactiontracker.md) ’s position with, you do not need to call [StartAnimation](../windows.ui.composition/compositionobject_startanimation_709050842.md). The system will take care of this behind the scenes once the animation is passed in via TryUpdateScaleWithAnimation.
     * 
     * When defining the animation that will animate [InteractionTracker](interactiontracker.md) ’s scale position, be sure to either use a [ScalarKeyFrameAnimation](../windows.ui.composition/scalarkeyframeanimation.md) or an [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) that resolves to a Scalar.
     * 
     * The table below summarizes the expected behavior when this method is called in a particular state:
     * 
     * <table>
     *    <tr><th>Current State</th><th>Outcome</th></tr>
     *    <tr><td>Idle</td><td>Requested animation starts on requested property, state changes to CustomAnimation</td></tr>
     *    <tr><td>Interacting</td><td>Request ignored</td></tr>
     *    <tr><td>Inertia</td><td>Requested animation starts on requested property, state changes to CustomAnimation</td></tr>
     *    <tr><td>CustomAnimation</td><td>Current animation stops and new requested animation starts on requested property, state re-enters CustomAnimation</td></tr>
     * </table>
     * @param {CompositionAnimation} animation The animation to apply to the scale.
     * @param {Vector3} centerPoint The new center point.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.tryupdatescalewithanimation
     */
    TryUpdateScaleWithAnimation(animation, centerPoint) {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.TryUpdateScaleWithAnimation(animation, centerPoint)
    }

    /**
     * Tries to update the scale by adding the specified velocity.
     * 
     * The TryUpdateScaleWithAdditionalVelocity method adds the inputted scalar representing additional velocity to the current velocity of [InteractionTracker](interactiontracker.md) as well as shifts the centerpoint to the inputted Vector3. As a result, because the velocity of [InteractionTracker](interactiontracker.md) has now changed, the targeted rest scale position for [InteractionTracker](interactiontracker.md) now changes. TryUpdateScaleWithAdditionalVelocity can be called from either Idle, Inertia or CustomAnimation states – doing so will either add or update the velocity of InteractionTracker and enter the Inertia state.
     * @remarks
     * If [InteractionTracker](interactiontracker.md) is in its Interacting State (user actively manipulating), and TryUpdateScaleWithAdditionalVelocity is called, the system will ignore this request – an event gets fired when this occurs that can be listened for. If sent from one of the other states, listen for the event fired for [InertiaStateEntered](iinteractiontrackerowner_inertiastateentered_615555038.md) and check the RequestId property that identifies which request triggered the callback.
     * 
     * The table below summarizes the expected behavior when this method is called in a particular state:
     * 
     * <table>
     *    <tr><th>Current State</th><th>Outcome</th></tr>
     *    <tr><td>Idle</td><td>State changes to inertia and inertia modifiers are evaluated with requested velocity as initial velocity</td></tr>
     *    <tr><td>Interacting</td><td>Request ignored</td></tr>
     *    <tr><td>Inertia</td><td>Inertia is restarted (state re-enters inertia) and inertia modifiers are evaluated with requested velocity added to current velocity</td></tr>
     *    <tr><td>CustomAnimation</td><td>Current animation stops and state changes to inertia with inertia modifiers evaluated using requested velocity as initial velocity</td></tr>
     * </table>
     * @param {Float} velocityInPercentPerSecond The velocity to add to the scale.
     * @param {Vector3} centerPoint The new center point.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.tryupdatescalewithadditionalvelocity
     */
    TryUpdateScaleWithAdditionalVelocity(velocityInPercentPerSecond, centerPoint) {
        if (!this.HasProp("__IInteractionTracker")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker := IInteractionTracker(outPtr)
        }

        return this.__IInteractionTracker.TryUpdateScaleWithAdditionalVelocity(velocityInPercentPerSecond, centerPoint)
    }

    /**
     * Takes an ordered list of CompositionConditionalValue. In a frame, while the tracker is in Inertia, the first CompositionConditionalValue to have its “.Condition” evaluate to true replaces the zoom CenterPointX value the tracker uses with its “.Value”. If none evaluate to true, the CenterPointX is not replaced that frame.
     * @param {IIterable<CompositionConditionalValue>} conditionalValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.configurecenterpointxinertiamodifiers
     */
    ConfigureCenterPointXInertiaModifiers(conditionalValues) {
        if (!this.HasProp("__IInteractionTracker2")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker2 := IInteractionTracker2(outPtr)
        }

        return this.__IInteractionTracker2.ConfigureCenterPointXInertiaModifiers(conditionalValues)
    }

    /**
     * Takes an ordered list of CompositionConditionalValue. In a frame, while the tracker is in Inertia, the first CompositionConditionalValue to have its “.Condition” evaluate to true replaces the zoom CenterPointY value the tracker uses with its “.Value”. If none evaluate to true, the CenterPointY is not replaced that frame.
     * @param {IIterable<CompositionConditionalValue>} conditionalValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.configurecenterpointyinertiamodifiers
     */
    ConfigureCenterPointYInertiaModifiers(conditionalValues) {
        if (!this.HasProp("__IInteractionTracker2")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker2 := IInteractionTracker2(outPtr)
        }

        return this.__IInteractionTracker2.ConfigureCenterPointYInertiaModifiers(conditionalValues)
    }

    /**
     * Applies a collection of InteractionTrackerInertiaModifier objects to the position of an InteractionTracker.
     * @param {IIterable<InteractionTrackerVector2InertiaModifier>} modifiers_ The collection of InteractionTrackerInertiaModifier objects to apply to the position of an InteractionTracker.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.configurevector2positioninertiamodifiers
     */
    ConfigureVector2PositionInertiaModifiers(modifiers_) {
        if (!this.HasProp("__IInteractionTracker3")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker3 := IInteractionTracker3(outPtr)
        }

        return this.__IInteractionTracker3.ConfigureVector2PositionInertiaModifiers(modifiers_)
    }

    /**
     * Tries to update the position of the [InteractionTracker](interactiontracker.md) using the specified clamping option.
     * @param {Vector3} value The new position for the [InteractionTracker](interactiontracker.md).
     * @param {Integer} option A value that specifies how values are clamped to the maximum and minimum.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.tryupdateposition
     */
    TryUpdatePositionWithOption(value, option) {
        if (!this.HasProp("__IInteractionTracker4")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker4 := IInteractionTracker4(outPtr)
        }

        return this.__IInteractionTracker4.TryUpdatePositionWithOption(value, option)
    }

    /**
     * Tries to adjust the [InteractionTracker](interactiontracker.md)'s position by the specified amount.
     * 
     * The TryUpdatePositionBy method updates the current location of [InteractionTracker](interactiontracker.md) by the Vector3 delta specified as a parameter. Similarly to [TryUpdatePosition](interactiontracker_tryupdateposition_207785016.md), TryUpdatePositionBy is used to declaratively move [InteractionTracker](interactiontracker.md) by a defined delta without the need of an animation or Inertia. TryUpdatePositionBy can be called from either the Idle, CustomAnimation or Inertia state – doing so will move the position of [InteractionTracker](interactiontracker.md) by the defined delta and enter the idle state.
     * @remarks
     * If InteractionTracker is in its Interacting State (user actively manipulating), and TryUpdatePositionBy is called, the system will ignore this request – an event gets fired when this occurs that can be listened for. If sent from one of the other states, listen for the event fired for IdleStateEntered and check the RequestId property that identifies which request triggered the callback. The table below summarizes the expected behavior when this method is called in a particular state:
     * 
     * <table>
     *    <tr><th>Current State</th><th>Outcome</th></tr>
     *    <tr><td>Idle</td><td>Property updates to requested value, no state changes</td></tr>
     *    <tr><td>Interacting</td><td>Request ignored</td></tr>
     *    <tr><td>Inertia</td><td>Property updates to requested value, state changes to Idle</td></tr>
     *    <tr><td>CustomAnimation</td><td>Property updates to requested value, state changes to Idle</td></tr>
     * </table>
     * @param {Vector3} amount The value to add to the current position.
     * @param {Integer} option 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.tryupdatepositionby
     */
    TryUpdatePositionByWithOption(amount, option) {
        if (!this.HasProp("__IInteractionTracker4")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker4 := IInteractionTracker4(outPtr)
        }

        return this.__IInteractionTracker4.TryUpdatePositionByWithOption(amount, option)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInertiaFromImpulse() {
        if (!this.HasProp("__IInteractionTracker4")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker4 := IInteractionTracker4(outPtr)
        }

        return this.__IInteractionTracker4.get_IsInertiaFromImpulse()
    }

    /**
     * Tries to update the [InteractionTracker](interactiontracker.md)'s position.
     * 
     * The TryUpdatePosition method updates the location of [InteractionTracker](interactiontracker.md) to the Vector3 position specified as a parameter. TryUpdatePosition is used to declaratively define the position of [InteractionTracker](interactiontracker.md) at any point in time (either at start, from some state-entered event, etc.). TryUpdatePosition can be called from either the Idle, CustomAnimation or Inertia state – doing so will move the position of [InteractionTracker](interactiontracker.md) to the defined position and enter the idle state.
     * @remarks
     * If [InteractionTracker](interactiontracker.md) is in its Interacting State (user actively manipulating), and TryUpdatePosition is called, the system will ignore this request – an event gets fired when this occurs that can be listened for. If sent from one of the other states, listen for the event fired for IdleStateEntered and check the RequestId property that identifies which request triggered the callback. The table below summarizes the expected behavior when this method is called in a particular state:
     * 
     * <table>
     *    <tr><th>Current State</th><th>Outcome</th></tr>
     *    <tr><td>Idle</td><td>Property updates to requested value, no state changes</td></tr>
     *    <tr><td>Interacting</td><td>Request ignored</td></tr>
     *    <tr><td>Inertia</td><td>Property updates to requested value, state changes to Idle</td></tr>
     *    <tr><td>CustomAnimation</td><td>Property updates to requested value, state changes to Idle</td></tr>
     * </table>
     * @param {Vector3} value The new position for the [InteractionTracker](interactiontracker.md).
     * @param {Integer} option 
     * @param {Integer} posUpdateOption 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontracker.tryupdateposition
     */
    TryUpdatePositionWithOption1(value, option, posUpdateOption) {
        if (!this.HasProp("__IInteractionTracker5")) {
            if ((queryResult := this.QueryInterface(IInteractionTracker5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTracker5 := IInteractionTracker5(outPtr)
        }

        return this.__IInteractionTracker5.TryUpdatePositionWithOption(value, option, posUpdateOption)
    }

;@endregion Instance Methods
}
