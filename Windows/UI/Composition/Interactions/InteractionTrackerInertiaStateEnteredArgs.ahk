#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInteractionTrackerInertiaStateEnteredArgs.ahk
#Include .\IInteractionTrackerInertiaStateEnteredArgs2.ahk
#Include .\IInteractionTrackerInertiaStateEnteredArgs3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Arguments for the [IInteractionTrackerOwner.InertiaStateEntered](iinteractiontrackerowner_inertiastateentered_615555038.md) callback.
  * 
  * The [InteractionTrackerOwner.InertiaStateEntered](iinteractiontrackerowner_inertiastateentered_615555038.md) class defines the accessible and up-to-date property values when [InteractionTracker](interactiontracker.md) enters the inertia state. If registered for the [InertiaStateEntered](iinteractiontrackerowner_inertiastateentered_615555038.md) event, values of this object's properties represent the results calculated by the system at the beginning of the inertia state. Using the modified and natural resting positions helps enables scenarios such as scrolling virtualization.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertiastateenteredargs
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class InteractionTrackerInertiaStateEnteredArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInteractionTrackerInertiaStateEnteredArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInteractionTrackerInertiaStateEnteredArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The [InteractionTracker](interactiontracker.md)'s resting position when inertia completes after [InteractionTrackerInertiaModifier](interactiontrackerinertiamodifier.md)s and boundaries have been applied.
     * 
     * The ModifiedRestingPosition property represents the systems calculation of where the final resting position of [InteractionTracker](interactiontracker.md) will be based on an interaction. Unlike the [NaturalRestingPosition](interactiontrackerinertiastateenteredargs_naturalrestingposition.md), ModifiedRestingPosition will be calculated based on other factors that affect the motion of [InteractionTracker](interactiontracker.md) such as InertiaModifiers and Min/Max boundaries.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertiastateenteredargs.modifiedrestingposition
     * @type {IReference<Vector3>} 
     */
    ModifiedRestingPosition {
        get => this.get_ModifiedRestingPosition()
    }

    /**
     * The [InteractionTracker](interactiontracker.md)'s resting scale when inertia completes, after InteractionTrackerInertiaModifiers and boundaries have been applied.
     * 
     * The ModifiedRestingScale property represents the systems calculation of where the final resting scale position of [InteractionTracker](interactiontracker.md) will be based on an interaction. Unlike the [NaturalRestingScale](interactiontrackerinertiastateenteredargs_naturalrestingscale.md), ModifiedRestingScale will be calculated based on other factors that affect the motion of [InteractionTracker](interactiontracker.md) such as InertiaModifiers and Min/Max boundaries.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertiastateenteredargs.modifiedrestingscale
     * @type {IReference<Float>} 
     */
    ModifiedRestingScale {
        get => this.get_ModifiedRestingScale()
    }

    /**
     * The [InteractionTracker](interactiontracker.md)'s resting position when inertia completes, without any modifiers or boundaries applied.
     * 
     * The NaturalRestingPosition property represents the system’s calculation of [InteractionTracker](interactiontracker.md) ’s final natural resting position based on an interaction. Unlike the [ModifiedRestingPosition](interactiontrackerinertiastateenteredargs_modifiedrestingposition.md), NaturalRestingPosition will be calculated without any other factors that impact [InteractionTracker](interactiontracker.md) ’s motion such as InertiaModifiers and Min/Max boundaries.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertiastateenteredargs.naturalrestingposition
     * @type {Vector3} 
     */
    NaturalRestingPosition {
        get => this.get_NaturalRestingPosition()
    }

    /**
     * The [InteractionTracker](interactiontracker.md)'s resting scale when inertia completes, without accounting for [InteractionTrackerInertiaModifier](interactiontrackerinertiamodifier.md)s or boundaries.
     * 
     * The NaturalRestingScale property represents the system’s calculation of [InteractionTracker](interactiontracker.md) ’s final natural resting scale position based on an interaction. Unlike the [ModifiedRestingScale](interactiontrackerinertiastateenteredargs_modifiedrestingscale.md), NaturalRestingScale will be calculated without any other factors that impact [InteractionTracker](interactiontracker.md) ’s motion such as [InteractionTrackerInertiaModifier](interactiontrackerinertiamodifier.md)s and Min/Max boundaries.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertiastateenteredargs.naturalrestingscale
     * @type {Float} 
     */
    NaturalRestingScale {
        get => this.get_NaturalRestingScale()
    }

    /**
     * The velocity of [InteractionTracker](interactiontracker.md)'s position.
     * 
     * The PositionVelocityInPixelsPerSecond property represents the position velocity of [InteractionTracker](interactiontracker.md) when it has entered the Inertia state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertiastateenteredargs.positionvelocityinpixelspersecond
     * @type {Vector3} 
     */
    PositionVelocityInPixelsPerSecond {
        get => this.get_PositionVelocityInPixelsPerSecond()
    }

    /**
     * The ID of the request that triggered the callback. Represents the ID of the request that caused [InteractionTracker](interactiontracker.md) to enter the Inertia State (the [InertiaStateEntered](iinteractiontrackerowner_inertiastateentered_615555038.md) callback was triggered). Note that the RequestID property will be incremented each time a request tries to change the state of InteractionTracker.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertiastateenteredargs.requestid
     * @type {Integer} 
     */
    RequestId {
        get => this.get_RequestId()
    }

    /**
     * The velocity of [InteractionTracker](interactiontracker.md)'s scale.
     * 
     * The ScaleVelocityInPercentPerSecond property represents the scale velocity of [InteractionTracker](interactiontracker.md) when it has entered the Inertia state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertiastateenteredargs.scalevelocityinpercentpersecond
     * @type {Float} 
     */
    ScaleVelocityInPercentPerSecond {
        get => this.get_ScaleVelocityInPercentPerSecond()
    }

    /**
     * Gets a value that indicates whether the inertia is the result of an impulse.
     * @remarks
     * Inertia from an impulse includes both calls to TryUpdatePositionWithInitialVelocity, and auto-redirected pointer wheel input. This property evaluates to **true** [within an expression](interactiontracker_isinertiafromimpulse.md) when the input originates from a discrete source such as a pointer wheel.
     * 
     * You can reference this property in the expression used to select an [inertia modifier](interactiontrackerinertiamodifier.md), which allows you to determine whether the inertia is being entered as a result of pointer wheel input. You can then provide different inertia modifiers for these types of interactions than you provide for continuous manipulations, like touch and touchpad.
     * 
     * For example, when scrolling a page of content, a small touch delta can result in the content getting snapped back to its original starting value. However, when scrolling with the pointer wheel, each tick of the wheel should move the content a full page per tick. You can define snap points (inertia modifiers) for use with the pointer wheel that will snap scrolling to a desired endpoint, but specify different criteria for the snap points that are used with touch or direct manipulation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertiastateenteredargs.isinertiafromimpulse
     * @type {Boolean} 
     */
    IsInertiaFromImpulse {
        get => this.get_IsInertiaFromImpulse()
    }

    /**
     * Gets a value that indicates whether this state was entered through interaction with a tracker that this one is bound to.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertiastateenteredargs.isfrombinding
     * @type {Boolean} 
     */
    IsFromBinding {
        get => this.get_IsFromBinding()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<Vector3>} 
     */
    get_ModifiedRestingPosition() {
        if (!this.HasProp("__IInteractionTrackerInertiaStateEnteredArgs")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaStateEnteredArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaStateEnteredArgs := IInteractionTrackerInertiaStateEnteredArgs(outPtr)
        }

        return this.__IInteractionTrackerInertiaStateEnteredArgs.get_ModifiedRestingPosition()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_ModifiedRestingScale() {
        if (!this.HasProp("__IInteractionTrackerInertiaStateEnteredArgs")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaStateEnteredArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaStateEnteredArgs := IInteractionTrackerInertiaStateEnteredArgs(outPtr)
        }

        return this.__IInteractionTrackerInertiaStateEnteredArgs.get_ModifiedRestingScale()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_NaturalRestingPosition() {
        if (!this.HasProp("__IInteractionTrackerInertiaStateEnteredArgs")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaStateEnteredArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaStateEnteredArgs := IInteractionTrackerInertiaStateEnteredArgs(outPtr)
        }

        return this.__IInteractionTrackerInertiaStateEnteredArgs.get_NaturalRestingPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NaturalRestingScale() {
        if (!this.HasProp("__IInteractionTrackerInertiaStateEnteredArgs")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaStateEnteredArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaStateEnteredArgs := IInteractionTrackerInertiaStateEnteredArgs(outPtr)
        }

        return this.__IInteractionTrackerInertiaStateEnteredArgs.get_NaturalRestingScale()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_PositionVelocityInPixelsPerSecond() {
        if (!this.HasProp("__IInteractionTrackerInertiaStateEnteredArgs")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaStateEnteredArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaStateEnteredArgs := IInteractionTrackerInertiaStateEnteredArgs(outPtr)
        }

        return this.__IInteractionTrackerInertiaStateEnteredArgs.get_PositionVelocityInPixelsPerSecond()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestId() {
        if (!this.HasProp("__IInteractionTrackerInertiaStateEnteredArgs")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaStateEnteredArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaStateEnteredArgs := IInteractionTrackerInertiaStateEnteredArgs(outPtr)
        }

        return this.__IInteractionTrackerInertiaStateEnteredArgs.get_RequestId()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScaleVelocityInPercentPerSecond() {
        if (!this.HasProp("__IInteractionTrackerInertiaStateEnteredArgs")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaStateEnteredArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaStateEnteredArgs := IInteractionTrackerInertiaStateEnteredArgs(outPtr)
        }

        return this.__IInteractionTrackerInertiaStateEnteredArgs.get_ScaleVelocityInPercentPerSecond()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInertiaFromImpulse() {
        if (!this.HasProp("__IInteractionTrackerInertiaStateEnteredArgs2")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaStateEnteredArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaStateEnteredArgs2 := IInteractionTrackerInertiaStateEnteredArgs2(outPtr)
        }

        return this.__IInteractionTrackerInertiaStateEnteredArgs2.get_IsInertiaFromImpulse()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFromBinding() {
        if (!this.HasProp("__IInteractionTrackerInertiaStateEnteredArgs3")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInertiaStateEnteredArgs3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInertiaStateEnteredArgs3 := IInteractionTrackerInertiaStateEnteredArgs3(outPtr)
        }

        return this.__IInteractionTrackerInertiaStateEnteredArgs3.get_IsFromBinding()
    }

;@endregion Instance Methods
}
