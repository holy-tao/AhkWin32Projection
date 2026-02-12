#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\CompositionObject.ahk
#Include .\IInteractionTrackerVector2InertiaModifier.ahk
#Include .\IInteractionTrackerVector2InertiaModifierFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Base class for [InteractionTrackerVector2InertiaNaturalMotion](interactiontrackervector2inertianaturalmotion.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackervector2inertiamodifier
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class InteractionTrackerVector2InertiaModifier extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInteractionTrackerVector2InertiaModifier

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInteractionTrackerVector2InertiaModifier.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
