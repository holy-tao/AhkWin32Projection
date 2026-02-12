#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\InteractionTrackerInertiaModifier.ahk
#Include .\IInteractionTrackerInertiaRestingValue.ahk
#Include .\IInteractionTrackerInertiaRestingValueStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * An [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) that defines the rest position after an interaction.
  * 
  * The InteractionTrackerInertiaRestingValue class defines two [ExpressionAnimation](../windows.ui.composition/expressionanimation.md)s that calculate an explicit resting position for [InteractionTracker](interactiontracker.md) when a particular condition is met. The InteractionTrackerInertiaRestingValue is defined as two parts: The conditional statement in which the [InteractionTracker](interactiontracker.md) ’s specific resting location needs to be explicitly defined if true and the equation that describes a mathematical relationship that outputs the location. Utilize the InteractionTrackerInertiaRestingValue class when needing to ensure InteractionTracker lands on a specific location after an interaction occurs.
 * @remarks
 * When attaching the InteractionTrackerInertiaRestingValue modifier to the [InteractionTracker](interactiontracker.md), you configure it to either the X/Y Position or Scale.
 * 
 * The [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) defining the condition property only gets run once, when the interaction completes (finger released), while the RestingValue Expression gets run every frame.
 * 
 * InteractionTrackerInertiaRestingValue modifiers explicitly defines the resting position of [InteractionTracker](interactiontracker.md) when the condition is met. It does not however define the motion to this explicit location – the system will handle that. Thus, if you need [InteractionTracker](interactiontracker.md) to take a particular motion, but do not require it to land at an exact spot, utilize the [InteractionTrackerInertiaMotion](interactiontrackerinertiamotion.md) modifier.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertiarestingvalue
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class InteractionTrackerInertiaRestingValue extends InteractionTrackerInertiaModifier {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInteractionTrackerInertiaRestingValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInteractionTrackerInertiaRestingValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [InteractionTrackerInertiaRestingValue](interactiontrackerinertiarestingvalue.md).
     * @param {Compositor} compositor_ The compositor to use when creating the [InteractionTrackerInertiaRestingValue](interactiontrackerinertiarestingvalue.md) object.
     * @returns {InteractionTrackerInertiaRestingValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertiarestingvalue.create
     */
    static Create(compositor_) {
        if (!InteractionTrackerInertiaRestingValue.HasProp("__IInteractionTrackerInertiaRestingValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Interactions.InteractionTrackerInertiaRestingValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInteractionTrackerInertiaRestingValueStatics.IID)
            InteractionTrackerInertiaRestingValue.__IInteractionTrackerInertiaRestingValueStatics := IInteractionTrackerInertiaRestingValueStatics(factoryPtr)
        }

        return InteractionTrackerInertiaRestingValue.__IInteractionTrackerInertiaRestingValueStatics.Create(compositor_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * An [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) describing when the modifier should be applied.
     * 
     * The Condition property is an [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) that defines when the [InteractionTracker](interactiontracker.md) should have a specific resting position. This expression gets run once after the interaction occurs and must resolve to a type Bool, otherwise an error will be thrown when the condition is evaluated. See the [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) class page for more details on building expressions.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertiarestingvalue.condition
     * @type {ExpressionAnimation} 
     */
    Condition {
        get => this.get_Condition()
        set => this.put_Condition(value)
    }

    /**
     * An [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) to define the resting value of [InteractionTracker](interactiontracker.md) if the expression in the Condition property is true.
     * 
     * The Resting property is an [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) that describes where [InteractionTracker](interactiontracker.md) will move to after an interaction if it’s corresponding condition is met. This expression will be run every frame while [InteractionTracker](interactiontracker.md) is in Inertia and must resolve to a type Float, otherwise an error will be thrown when the equation is evaluated. See the [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) class page for more details on building expressions.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertiarestingvalue.restingvalue
     * @type {ExpressionAnimation} 
     */
    RestingValue {
        get => this.get_RestingValue()
        set => this.put_RestingValue(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ExpressionAnimation} 
     */
    get_Condition() {
        if (!this.HasProp("__IInteractionTrackerInertiaRestingValue")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaRestingValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaRestingValue := IInteractionTrackerInertiaRestingValue(outPtr)
        }

        return this.__IInteractionTrackerInertiaRestingValue.get_Condition()
    }

    /**
     * 
     * @param {ExpressionAnimation} value 
     * @returns {HRESULT} 
     */
    put_Condition(value) {
        if (!this.HasProp("__IInteractionTrackerInertiaRestingValue")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaRestingValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaRestingValue := IInteractionTrackerInertiaRestingValue(outPtr)
        }

        return this.__IInteractionTrackerInertiaRestingValue.put_Condition(value)
    }

    /**
     * 
     * @returns {ExpressionAnimation} 
     */
    get_RestingValue() {
        if (!this.HasProp("__IInteractionTrackerInertiaRestingValue")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaRestingValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaRestingValue := IInteractionTrackerInertiaRestingValue(outPtr)
        }

        return this.__IInteractionTrackerInertiaRestingValue.get_RestingValue()
    }

    /**
     * 
     * @param {ExpressionAnimation} value 
     * @returns {HRESULT} 
     */
    put_RestingValue(value) {
        if (!this.HasProp("__IInteractionTrackerInertiaRestingValue")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaRestingValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaRestingValue := IInteractionTrackerInertiaRestingValue(outPtr)
        }

        return this.__IInteractionTrackerInertiaRestingValue.put_RestingValue(value)
    }

;@endregion Instance Methods
}
