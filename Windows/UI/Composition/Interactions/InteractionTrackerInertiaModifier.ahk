#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\CompositionObject.ahk
#Include .\IInteractionTrackerInertiaModifier.ahk
#Include .\IInteractionTrackerInertiaModifierFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Base class for inertia modifiers.
  * 
  * The InteractionTrackerInertiaModifier represents the base class for inertia modifiers. inertia modifiers can be thought of as ways to change the behavior for where and how [InteractionTracker](interactiontracker.md) reaches its final resting position. Changing this behavior of [InteractionTracker](interactiontracker.md) is commonly used when more custom motion experiences are needed such as snap points. There are two variations to how you can modify the behavior of [InteractionTracker](interactiontracker.md) using inertia modifiers: modify its final resting position after interaction with the [InteractionTrackerInertiaRestingValue](interactiontrackerinertiarestingvalue.md) class or define the equation used to calculate the actual motion and final resting position during Inertia with the [InteractionTrackerInertiaMotion](interactiontrackerinertiamotion.md) class. These modifiers are applied to either X Position, Y Position or Scale of [InteractionTracker](interactiontracker.md).
 * @remarks
 * It is important to note that inertia modifiers only get evaluated when [InteractionTracker](interactiontracker.md) enters the Inertia state. Once the [InteractionTracker](interactiontracker.md) has entered inertia, all the inertia modifiers are evaluated and if one is selected, it will be used to calculate the motion until [InteractionTracker](interactiontracker.md) ’s velocity becomes 0.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinertiamodifier
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class InteractionTrackerInertiaModifier extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInteractionTrackerInertiaModifier

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInteractionTrackerInertiaModifier.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
