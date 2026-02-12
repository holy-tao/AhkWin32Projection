#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\NavigationTransitionInfo.ahk
#Include .\IDrillInNavigationTransitionInfo.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Specifies the animation to run when a user navigates forward in a logical hierarchy, like from a master list to a detail page.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.drillinnavigationtransitioninfo
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class DrillInNavigationTransitionInfo extends NavigationTransitionInfo {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDrillInNavigationTransitionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDrillInNavigationTransitionInfo.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [DrillInNavigationTransitionInfo](drillinnavigationtransitioninfo.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DrillInNavigationTransitionInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
