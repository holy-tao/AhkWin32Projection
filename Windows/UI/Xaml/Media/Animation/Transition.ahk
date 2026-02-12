#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\ITransition.ahk
#Include .\ITransitionFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a visual behavior that occurs for predefined actions or state changes. Specific theme transitions (various Transition derived classes) can be applied to individual elements using the [UIElement.Transitions](../windows.ui.xaml/uielement_transitions.md) property, or applied for scenario-specific theme transition properties such as [ContentControl.ContentTransitions](../windows.ui.xaml.controls/contentcontrol_contenttransitions.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.transition
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class Transition extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITransition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITransition.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
