#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how values are clamped when the InteractionTracker position is updated.
 * @remarks
 * This enumeration provides values for the _option_ parameter of the [TryUpdatePosition](interactiontracker_tryupdateposition_2048659206.md) and [TryUpdatePositionBy](interactiontracker_tryupdatepositionby_788745142.md) methods.
 * 
 * Clamping is based on the values of InteractionTracker [MinPosition](interactiontracker_minposition.md)/[MaxPosition](interactiontracker_maxposition.md) and [MinScale](interactiontracker_minscale.md)/[MaxScale](interactiontracker_maxscale.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerclampingoption
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class InteractionTrackerClampingOption extends Win32Enum{

    /**
     * If the input value is greater (or less) than the max (or min) value, it is immediately clamped.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * If the input value is greater (or less) than the max (or min) value, it is not immediately clamped. Instead, the max/min is enforced to the newly input value of Position (and potentially clamped) the next time InteractionTracker enters the Inertia state.
     * @type {Integer (Int32)}
     */
    static Disabled => 1
}
