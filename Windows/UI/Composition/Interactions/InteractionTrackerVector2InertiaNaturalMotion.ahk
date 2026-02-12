#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\InteractionTrackerVector2InertiaModifier.ahk
#Include .\IInteractionTrackerVector2InertiaNaturalMotion.ahk
#Include .\IInteractionTrackerVector2InertiaNaturalMotionStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A [Vector2NaturalMotionAnimation](../windows.ui.composition/vector2naturalmotionanimation.md) that defines motion of InteractionTracker during its inertia state.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackervector2inertianaturalmotion
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class InteractionTrackerVector2InertiaNaturalMotion extends InteractionTrackerVector2InertiaModifier {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInteractionTrackerVector2InertiaNaturalMotion

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInteractionTrackerVector2InertiaNaturalMotion.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [InteractionTrackerVector2InertiaNaturalMotion](interactiontrackervector2inertianaturalmotion.md).
     * @param {Compositor} compositor_ The compositor to use when creating the InteractionTrackerInertiaNaturalMotion object.
     * @returns {InteractionTrackerVector2InertiaNaturalMotion} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackervector2inertianaturalmotion.create
     */
    static Create(compositor_) {
        if (!InteractionTrackerVector2InertiaNaturalMotion.HasProp("__IInteractionTrackerVector2InertiaNaturalMotionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Interactions.InteractionTrackerVector2InertiaNaturalMotion")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInteractionTrackerVector2InertiaNaturalMotionStatics.IID)
            InteractionTrackerVector2InertiaNaturalMotion.__IInteractionTrackerVector2InertiaNaturalMotionStatics := IInteractionTrackerVector2InertiaNaturalMotionStatics(factoryPtr)
        }

        return InteractionTrackerVector2InertiaNaturalMotion.__IInteractionTrackerVector2InertiaNaturalMotionStatics.Create(compositor_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets an [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) describing when the modifier should be applied.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackervector2inertianaturalmotion.condition
     * @type {ExpressionAnimation} 
     */
    Condition {
        get => this.get_Condition()
        set => this.put_Condition(value)
    }

    /**
     * Gets or set a [Vector2NaturalMotionAnimation](../windows.ui.composition/vector2naturalmotionanimation.md) that describes the modified motion for [InteractionTracker](interactiontracker.md) if the expression in the Condition property is **true**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackervector2inertianaturalmotion.naturalmotion
     * @type {Vector2NaturalMotionAnimation} 
     */
    NaturalMotion {
        get => this.get_NaturalMotion()
        set => this.put_NaturalMotion(value)
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
        if (!this.HasProp("__IInteractionTrackerVector2InertiaNaturalMotion")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerVector2InertiaNaturalMotion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerVector2InertiaNaturalMotion := IInteractionTrackerVector2InertiaNaturalMotion(outPtr)
        }

        return this.__IInteractionTrackerVector2InertiaNaturalMotion.get_Condition()
    }

    /**
     * 
     * @param {ExpressionAnimation} value 
     * @returns {HRESULT} 
     */
    put_Condition(value) {
        if (!this.HasProp("__IInteractionTrackerVector2InertiaNaturalMotion")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerVector2InertiaNaturalMotion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerVector2InertiaNaturalMotion := IInteractionTrackerVector2InertiaNaturalMotion(outPtr)
        }

        return this.__IInteractionTrackerVector2InertiaNaturalMotion.put_Condition(value)
    }

    /**
     * 
     * @returns {Vector2NaturalMotionAnimation} 
     */
    get_NaturalMotion() {
        if (!this.HasProp("__IInteractionTrackerVector2InertiaNaturalMotion")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerVector2InertiaNaturalMotion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerVector2InertiaNaturalMotion := IInteractionTrackerVector2InertiaNaturalMotion(outPtr)
        }

        return this.__IInteractionTrackerVector2InertiaNaturalMotion.get_NaturalMotion()
    }

    /**
     * 
     * @param {Vector2NaturalMotionAnimation} value 
     * @returns {HRESULT} 
     */
    put_NaturalMotion(value) {
        if (!this.HasProp("__IInteractionTrackerVector2InertiaNaturalMotion")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerVector2InertiaNaturalMotion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerVector2InertiaNaturalMotion := IInteractionTrackerVector2InertiaNaturalMotion(outPtr)
        }

        return this.__IInteractionTrackerVector2InertiaNaturalMotion.put_NaturalMotion(value)
    }

;@endregion Instance Methods
}
