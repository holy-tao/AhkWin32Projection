#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\InteractionTrackerInertiaModifier.ahk
#Include .\IInteractionTrackerInertiaNaturalMotion.ahk
#Include .\IInteractionTrackerInertiaNaturalMotionStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A [ScalarNaturalMotionAnimation](../windows.ui.composition/scalarnaturalmotionanimation.md) that defines motion of InteractionTracker during its inertia state.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertianaturalmotion
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class InteractionTrackerInertiaNaturalMotion extends InteractionTrackerInertiaModifier {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInteractionTrackerInertiaNaturalMotion

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInteractionTrackerInertiaNaturalMotion.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [InteractionTrackerInertiaNaturalMotion](interactiontrackerinertianaturalmotion.md).
     * @param {Compositor} compositor_ The compositor to use when creating the InteractionTrackerInertiaNaturalMotion object.
     * @returns {InteractionTrackerInertiaNaturalMotion} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertianaturalmotion.create
     */
    static Create(compositor_) {
        if (!InteractionTrackerInertiaNaturalMotion.HasProp("__IInteractionTrackerInertiaNaturalMotionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Interactions.InteractionTrackerInertiaNaturalMotion")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInteractionTrackerInertiaNaturalMotionStatics.IID)
            InteractionTrackerInertiaNaturalMotion.__IInteractionTrackerInertiaNaturalMotionStatics := IInteractionTrackerInertiaNaturalMotionStatics(factoryPtr)
        }

        return InteractionTrackerInertiaNaturalMotion.__IInteractionTrackerInertiaNaturalMotionStatics.Create(compositor_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets an [ExpressionAnimation](../windows.ui.composition/expressionanimation.md) describing when the modifier should be applied.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertianaturalmotion.condition
     * @type {ExpressionAnimation} 
     */
    Condition {
        get => this.get_Condition()
        set => this.put_Condition(value)
    }

    /**
     * Gets or set a [ScalarNaturalMotionAnimation](../windows.ui.composition/scalarnaturalmotionanimation.md) that describes the modified motion for [InteractionTracker](interactiontracker.md) if the expression in the Condition property is **true**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertianaturalmotion.naturalmotion
     * @type {ScalarNaturalMotionAnimation} 
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
        if (!this.HasProp("__IInteractionTrackerInertiaNaturalMotion")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaNaturalMotion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaNaturalMotion := IInteractionTrackerInertiaNaturalMotion(outPtr)
        }

        return this.__IInteractionTrackerInertiaNaturalMotion.get_Condition()
    }

    /**
     * 
     * @param {ExpressionAnimation} value 
     * @returns {HRESULT} 
     */
    put_Condition(value) {
        if (!this.HasProp("__IInteractionTrackerInertiaNaturalMotion")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaNaturalMotion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaNaturalMotion := IInteractionTrackerInertiaNaturalMotion(outPtr)
        }

        return this.__IInteractionTrackerInertiaNaturalMotion.put_Condition(value)
    }

    /**
     * 
     * @returns {ScalarNaturalMotionAnimation} 
     */
    get_NaturalMotion() {
        if (!this.HasProp("__IInteractionTrackerInertiaNaturalMotion")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaNaturalMotion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaNaturalMotion := IInteractionTrackerInertiaNaturalMotion(outPtr)
        }

        return this.__IInteractionTrackerInertiaNaturalMotion.get_NaturalMotion()
    }

    /**
     * 
     * @param {ScalarNaturalMotionAnimation} value 
     * @returns {HRESULT} 
     */
    put_NaturalMotion(value) {
        if (!this.HasProp("__IInteractionTrackerInertiaNaturalMotion")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaNaturalMotion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaNaturalMotion := IInteractionTrackerInertiaNaturalMotion(outPtr)
        }

        return this.__IInteractionTrackerInertiaNaturalMotion.put_NaturalMotion(value)
    }

;@endregion Instance Methods
}
