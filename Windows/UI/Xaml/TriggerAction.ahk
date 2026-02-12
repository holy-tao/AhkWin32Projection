#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DependencyObject.ahk
#Include .\ITriggerAction.ahk
#Include .\ITriggerActionFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Serves as the base class for [BeginStoryboard](../windows.ui.xaml.media.animation/beginstoryboard.md). Not commonly used. See Remarks.
 * @remarks
 * [Triggers](frameworkelement_triggers.md), [EventTrigger](eventtrigger.md), [Actions](eventtrigger_actions.md) and [BeginStoryboard](../windows.ui.xaml.media.animation/beginstoryboard.md) are not commonly used. These API mainly exist for compatibility in XAML originally used for Microsoft Silverlight. For most scenarios where event triggers were used previously, you should either use visual states, or start animations by writing a [Loaded](frameworkelement_loaded.md) handler that looks up an animation in page-level resources and then calls [Begin](../windows.ui.xaml.media.animation/storyboard_begin_1621727531.md) on the animation's main [Storyboard](../windows.ui.xaml.media.animation/storyboard.md). For more info, see [Quickstart: Control templates](/previous-versions/windows/apps/hh465374(v=win.10)) or [Storyboarded animations](/windows/uwp/graphics/storyboarded-animations).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.triggeraction
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class TriggerAction extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITriggerAction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITriggerAction.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
