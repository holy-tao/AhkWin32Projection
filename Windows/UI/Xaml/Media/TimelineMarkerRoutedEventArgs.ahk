#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\ITimelineMarkerRoutedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [MarkerReached](../windows.ui.xaml.controls/mediaelement_markerreached.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.timelinemarkerroutedeventargs
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class TimelineMarkerRoutedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimelineMarkerRoutedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimelineMarkerRoutedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [TimelineMarker](timelinemarker.md) that triggered this event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.timelinemarkerroutedeventargs.marker
     * @type {TimelineMarker} 
     */
    Marker {
        get => this.get_Marker()
        set => this.put_Marker(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [TimelineMarkerRoutedEventArgs](timelinemarkerroutedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.TimelineMarkerRoutedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimelineMarker} 
     */
    get_Marker() {
        if (!this.HasProp("__ITimelineMarkerRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITimelineMarkerRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimelineMarkerRoutedEventArgs := ITimelineMarkerRoutedEventArgs(outPtr)
        }

        return this.__ITimelineMarkerRoutedEventArgs.get_Marker()
    }

    /**
     * 
     * @param {TimelineMarker} value 
     * @returns {HRESULT} 
     */
    put_Marker(value) {
        if (!this.HasProp("__ITimelineMarkerRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITimelineMarkerRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimelineMarkerRoutedEventArgs := ITimelineMarkerRoutedEventArgs(outPtr)
        }

        return this.__ITimelineMarkerRoutedEventArgs.put_Marker(value)
    }

;@endregion Instance Methods
}
