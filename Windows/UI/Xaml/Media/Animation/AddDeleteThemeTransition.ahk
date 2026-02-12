#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Transition.ahk
#Include .\IAddDeleteThemeTransition.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides the animated transition behavior for when controls add or delete children of a panel. For example, if you have a collection of photos displayed in a [Grid](../windows.ui.xaml.controls/grid.md), you can associate this animation to the [Grid](../windows.ui.xaml.controls/grid.md) so that when photos are added or deleted, the photos will animate in and out of view.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.adddeletethemetransition
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class AddDeleteThemeTransition extends Transition {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAddDeleteThemeTransition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAddDeleteThemeTransition.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [AddDeleteThemeTransition](adddeletethemetransition.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.AddDeleteThemeTransition")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
