#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\InteractionTrackerInertiaModifier.ahk
#Include .\IInteractionTrackerInertiaMotion.ahk
#Include .\IInteractionTrackerInertiaMotionStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * An [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) that defines motion of InteractionTracker during its inertia state.
  * 
  * The InteractionTrackerMotion class contains two [ExpressionAnimation](../windows.ui.composition/expressionanimation.md)s representing a second derivative equation of position [InteractionTracker](interactiontracker.md) will use to define the motion from the start to end of inertia when a particular condition is met. The InteractionTrackerMotion class is defined as two parts: The conditional statement to define when the motion will take place and the equation that describes the motion for how [InteractionTracker](interactiontracker.md) will reach its final resting position. Utilize the InteractionTrackerInertiaMotion class when you need to define a customized motion (such as a spring motion) for [InteractionTracker](interactiontracker.md) to use when in its inertia state.
 * @remarks
 * When building out the [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) for the motion component of InteractionTrackerInertiaMotion, the expression is described as a second derivative equation. For example, In the code snippet above, we utilize the basic equation for Spring Force motion with damping.
 * 
 * When attaching the InteractionTrackerInertiaMotion modifier to the [InteractionTracker](interactiontracker.md), you configure it to either the X/Y Position or Scale.
 * 
 * The [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) defining the condition property only gets evaluated once when [InteractionTracker](interactiontracker.md) enters Inertia (aka when the interaction completes such as finger released). If the condition evaluates to true, the InertiaMotion Expression gets evaluated every frame for the remainder of Inertia, even if the condition expression technically is no longer true.
 * 
 * InteractionTrackerInertiaMotion modifiers change the equation InteractionTracker uses to calculate its position. Thus, the final resting position is determined by the nature of the equation itself. If you need InteractionTracker to stop at a specific location, utilize the [InteractionTrackerInertiaRestingValue](interactiontrackerinertiarestingvalue.md) modifier.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertiamotion
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class InteractionTrackerInertiaMotion extends InteractionTrackerInertiaModifier {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInteractionTrackerInertiaMotion

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInteractionTrackerInertiaMotion.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [InteractionTrackerInertiaMotion](interactiontrackerinertiamotion.md).
     * @param {Compositor} compositor_ The compositor to use when creating the [InteractionTrackerInertiaMotion](interactiontrackerinertiamotion.md) object.
     * @returns {InteractionTrackerInertiaMotion} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertiamotion.create
     */
    static Create(compositor_) {
        if (!InteractionTrackerInertiaMotion.HasProp("__IInteractionTrackerInertiaMotionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Interactions.InteractionTrackerInertiaMotion")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInteractionTrackerInertiaMotionStatics.IID)
            InteractionTrackerInertiaMotion.__IInteractionTrackerInertiaMotionStatics := IInteractionTrackerInertiaMotionStatics(factoryPtr)
        }

        return InteractionTrackerInertiaMotion.__IInteractionTrackerInertiaMotionStatics.Create(compositor_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * An [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) describing when the modifier should be applied.
     * 
     * The Condition property is an [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) that defines when the specified motion equation is utilized by [InteractionTracker](interactiontracker.md) during Inertia. This expression gets evaluated once after the interaction occurs and must resolve to a type Bool, otherwise an error will be thrown when the condition is evaluated. See the [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) class page for more details on building expressions.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertiamotion.condition
     * @type {ExpressionAnimation} 
     */
    Condition {
        get => this.get_Condition()
        set => this.put_Condition(value)
    }

    /**
     * An [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) describing the modified motion for [InteractionTracker](interactiontracker.md) if the expression in the Condition property is true.
     * 
     * The Motion property is an [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) that describes the motion [InteractionTracker](interactiontracker.md) will utilize during Inertia when the corresponding condition is met. The expression will be evaluated every frame while [InteractionTracker](interactiontracker.md) is in Inertia and must resolve to a type Float, otherwise an error will be thrown when the equation is evaluated. See the [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) class page for more details on building expressions.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertiamotion.motion
     * @type {ExpressionAnimation} 
     */
    Motion {
        get => this.get_Motion()
        set => this.put_Motion(value)
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
        if (!this.HasProp("__IInteractionTrackerInertiaMotion")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaMotion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaMotion := IInteractionTrackerInertiaMotion(outPtr)
        }

        return this.__IInteractionTrackerInertiaMotion.get_Condition()
    }

    /**
     * 
     * @param {ExpressionAnimation} value 
     * @returns {HRESULT} 
     */
    put_Condition(value) {
        if (!this.HasProp("__IInteractionTrackerInertiaMotion")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaMotion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaMotion := IInteractionTrackerInertiaMotion(outPtr)
        }

        return this.__IInteractionTrackerInertiaMotion.put_Condition(value)
    }

    /**
     * 
     * @returns {ExpressionAnimation} 
     */
    get_Motion() {
        if (!this.HasProp("__IInteractionTrackerInertiaMotion")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaMotion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaMotion := IInteractionTrackerInertiaMotion(outPtr)
        }

        return this.__IInteractionTrackerInertiaMotion.get_Motion()
    }

    /**
     * 
     * @param {ExpressionAnimation} value 
     * @returns {HRESULT} 
     */
    put_Motion(value) {
        if (!this.HasProp("__IInteractionTrackerInertiaMotion")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaMotion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaMotion := IInteractionTrackerInertiaMotion(outPtr)
        }

        return this.__IInteractionTrackerInertiaMotion.put_Motion(value)
    }

;@endregion Instance Methods
}
