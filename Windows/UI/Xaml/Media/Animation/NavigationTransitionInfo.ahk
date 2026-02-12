#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\INavigationTransitionInfo.ahk
#Include .\INavigationTransitionInfoOverrides.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides parameter info for the [Frame.Navigate](../windows.ui.xaml.controls/frame_navigate_1426351961.md) method. Controls how the transition animation runs during the navigation action.
 * @remarks
 * Navigation transition animations can be any of the *TransitionInfo types. For UWP apps, we recommend using the following page transitions:
 * - [EntranceNavigationTransitionInfo](entrancenavigationtransitioninfo.md)
 * - [DrillInNavigationTransitionInfo](drillinnavigationtransitioninfo.md)
 * - [SuppressNavigationTransitionInfo](suppressnavigationtransitioninfo.md)
 * 
 * > For Windows Phone 8.x apps, several derived types ([CommonNavigationTransitionInfo](commonnavigationtransitioninfo.md), [ContinuumNavigationTransitionInfo](continuumnavigationtransitioninfo.md), [SlideNavigationTransitionInfo](slidenavigationtransitioninfo.md)) can be used in XAML to fill the [NavigationThemeTransition.DefaultNavigationTransitionInfo](navigationthemetransition_defaultnavigationtransitioninfo.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.navigationtransitioninfo
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class NavigationTransitionInfo extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INavigationTransitionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INavigationTransitionInfo.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * When implemented in a derived class, gets the navigation state string that is reported for navigation actions through [Frame.Navigate](../windows.ui.xaml.controls/frame_navigate_442648331.md) and similar API.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.navigationtransitioninfo.getnavigationstatecore
     */
    GetNavigationStateCore() {
        if (!this.HasProp("__INavigationTransitionInfoOverrides")) {
            if ((queryResult := this.QueryInterface(INavigationTransitionInfoOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationTransitionInfoOverrides := INavigationTransitionInfoOverrides(outPtr)
        }

        return this.__INavigationTransitionInfoOverrides.GetNavigationStateCore()
    }

    /**
     * When implemented in a derived class, sets the navigation state string that is passed for navigation actions through [Frame.Navigate](../windows.ui.xaml.controls/frame_navigate_442648331.md) and similar API.
     * @param {HSTRING} navigationState The string to use for navigation state info.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.navigationtransitioninfo.setnavigationstatecore
     */
    SetNavigationStateCore(navigationState) {
        if (!this.HasProp("__INavigationTransitionInfoOverrides")) {
            if ((queryResult := this.QueryInterface(INavigationTransitionInfoOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationTransitionInfoOverrides := INavigationTransitionInfoOverrides(outPtr)
        }

        return this.__INavigationTransitionInfoOverrides.SetNavigationStateCore(navigationState)
    }

;@endregion Instance Methods
}
