#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\IRateChangedRoutedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [RateChanged](../windows.ui.xaml.controls/mediaelement_ratechanged.md) event.
 * @remarks
 * [RateChanged](../windows.ui.xaml.controls/mediaelement_ratechanged.md) event fires when [PlaybackRate](../windows.ui.xaml.controls/mediaelement_playbackrate.md) or [DefaultPlaybackRate](../windows.ui.xaml.controls/mediaelement_defaultplaybackrate.md) change.
 * 
 * The new [PlaybackRate](../windows.ui.xaml.controls/mediaelement_playbackrate.md) or [DefaultPlaybackRate](../windows.ui.xaml.controls/mediaelement_defaultplaybackrate.md) value, whichever property has changed, is not provided in the event data. Applications should query [PlaybackRate](../windows.ui.xaml.controls/mediaelement_playbackrate.md) or [DefaultPlaybackRate](../windows.ui.xaml.controls/mediaelement_defaultplaybackrate.md) inside the [RateChangedRoutedEventHandler](ratechangedroutedeventhandler.md) to obtain the new rate.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.ratechangedroutedeventargs
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class RateChangedRoutedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRateChangedRoutedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRateChangedRoutedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [RateChangedRoutedEventArgs](ratechangedroutedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.RateChangedRoutedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
