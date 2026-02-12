#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Contains callbacks that will be triggered by InteractionTracker events.
  * 
  * Implementing this interface enables receiving callbacks regarding the state and values of the [InteractionTracker](interactiontracker.md), as well as whether requested updates to the [InteractionTracker](interactiontracker.md) ’s properties are honored.
 * @remarks
 * Implementing IInteractionTrackerOwner is required if the application needs to have updates on the state or values of the [InteractionTracker](interactiontracker.md). Due to the asynchronous nature of this model, these callbacks are the best way to update application logic. To learn more about the [InteractionTracker](interactiontracker.md) states and transitions, see [InteractionTracker](interactiontracker.md).
 * 
 * An [InteractionTracker](interactiontracker.md) can be created with or without an owner. Creating the [InteractionTracker](interactiontracker.md) with an owner is required for registering for callbacks. If these callbacks are not important for application state, then creating an [InteractionTracker](interactiontracker.md) without an owner is appropriate.
 * 
 * Creating an [InteractionTracker](interactiontracker.md) with an owner also requires appropriately disposing the [InteractionTracker](interactiontracker.md) when appropriate.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.iinteractiontrackerowner
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class IInteractionTrackerOwner extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInteractionTrackerOwner
     * @type {Guid}
     */
    static IID => Guid("{db2e8af3-4deb-4e53-b29c-b06c9f96d651}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CustomAnimationStateEntered", "IdleStateEntered", "InertiaStateEntered", "InteractingStateEntered", "RequestIgnored", "ValuesChanged"]

    /**
     * Callback triggered when an [InteractionTracker](interactiontracker.md) enters the custom animation state.
     * @param {InteractionTracker} sender The [InteractionTracker](interactiontracker.md) that triggered the callback.
     * @param {InteractionTrackerCustomAnimationStateEnteredArgs} args Arguments for the callback.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.iinteractiontrackerowner.customanimationstateentered
     */
    CustomAnimationStateEntered(sender, args) {
        result := ComCall(6, this, "ptr", sender, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Callback triggered when an [InteractionTracker](interactiontracker.md) enters the idle state.
     * @param {InteractionTracker} sender The [InteractionTracker](interactiontracker.md) that triggered the callback.
     * @param {InteractionTrackerIdleStateEnteredArgs} args Arguments for the callback.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.iinteractiontrackerowner.idlestateentered
     */
    IdleStateEntered(sender, args) {
        result := ComCall(7, this, "ptr", sender, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Callback triggered when an [InteractionTracker](interactiontracker.md) enters the inertia state.
     * @param {InteractionTracker} sender The [InteractionTracker](interactiontracker.md) that triggered the callback.
     * @param {InteractionTrackerInertiaStateEnteredArgs} args Arguments for the callback.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.iinteractiontrackerowner.inertiastateentered
     */
    InertiaStateEntered(sender, args) {
        result := ComCall(8, this, "ptr", sender, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Callback that is triggered when an [InteractionTracker](interactiontracker.md) enters the interaction state.
     * @param {InteractionTracker} sender The [InteractionTracker](interactiontracker.md) that triggered the callback.
     * @param {InteractionTrackerInteractingStateEnteredArgs} args Arguments for the callback.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.iinteractiontrackerowner.interactingstateentered
     */
    InteractingStateEntered(sender, args) {
        result := ComCall(9, this, "ptr", sender, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Callback that is triggered when the [InteractionTracker](interactiontracker.md) has ignored a request.
     * @param {InteractionTracker} sender The [InteractionTracker](interactiontracker.md) that triggered the callback.
     * @param {InteractionTrackerRequestIgnoredArgs} args The arguments for the callback.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.iinteractiontrackerowner.requestignored
     */
    RequestIgnored(sender, args) {
        result := ComCall(10, this, "ptr", sender, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Callback that is triggered when the [InteractionTracker](interactiontracker.md)'s output values have changed.
     * @param {InteractionTracker} sender The [InteractionTracker](interactiontracker.md) that triggered the callback.
     * @param {InteractionTrackerValuesChangedArgs} args The new values for the [InteractionTracker](interactiontracker.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.iinteractiontrackerowner.valueschanged
     */
    ValuesChanged(sender, args) {
        result := ComCall(11, this, "ptr", sender, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
