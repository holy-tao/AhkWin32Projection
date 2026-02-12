#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\ITimelineMarker.ahk
#Include .\ITimelineMarkerStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents metadata associated with a specific point in a media file.
 * @remarks
 * A timeline marker is metadata associated with a particular point in a media file. These markers are usually created ahead of time and stored in the media file itself. They are typically used to name different scenes in a video or provide scripting cues. By handling the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) object's [MarkerReached](../windows.ui.xaml.controls/mediaelement_markerreached.md) event or by accessing the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) object's [Markers](../windows.ui.xaml.controls/mediaelement_markers.md) property, you can use timeline markers to trigger actions or enable users to seek to selected positions in the media file.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.timelinemarker
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class TimelineMarker extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimelineMarker

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimelineMarker.IID

    /**
     * Identifies the [Time](timelinemarker_time.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.timelinemarker.timeproperty
     * @type {DependencyProperty} 
     */
    static TimeProperty {
        get => TimelineMarker.get_TimeProperty()
    }

    /**
     * Identifies the [Type](timelinemarker_type.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.timelinemarker.typeproperty
     * @type {DependencyProperty} 
     */
    static TypeProperty {
        get => TimelineMarker.get_TypeProperty()
    }

    /**
     * Identifies the [Text](timelinemarker_text.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.timelinemarker.textproperty
     * @type {DependencyProperty} 
     */
    static TextProperty {
        get => TimelineMarker.get_TextProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TimeProperty() {
        if (!TimelineMarker.HasProp("__ITimelineMarkerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.TimelineMarker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimelineMarkerStatics.IID)
            TimelineMarker.__ITimelineMarkerStatics := ITimelineMarkerStatics(factoryPtr)
        }

        return TimelineMarker.__ITimelineMarkerStatics.get_TimeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TypeProperty() {
        if (!TimelineMarker.HasProp("__ITimelineMarkerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.TimelineMarker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimelineMarkerStatics.IID)
            TimelineMarker.__ITimelineMarkerStatics := ITimelineMarkerStatics(factoryPtr)
        }

        return TimelineMarker.__ITimelineMarkerStatics.get_TypeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextProperty() {
        if (!TimelineMarker.HasProp("__ITimelineMarkerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.TimelineMarker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimelineMarkerStatics.IID)
            TimelineMarker.__ITimelineMarkerStatics := ITimelineMarkerStatics(factoryPtr)
        }

        return TimelineMarker.__ITimelineMarkerStatics.get_TextProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the time at which a [TimelineMarker](timelinemarker.md) is reached.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.timelinemarker.time
     * @type {TimeSpan} 
     */
    Time {
        get => this.get_Time()
        set => this.put_Time(value)
    }

    /**
     * Gets or sets the marker type of a [TimelineMarker](timelinemarker.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.timelinemarker.type
     * @type {HSTRING} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * Gets or sets the text value of a [TimelineMarker](timelinemarker.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.timelinemarker.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [TimelineMarker](timelinemarker.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.TimelineMarker")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Time() {
        if (!this.HasProp("__ITimelineMarker")) {
            if ((queryResult := this.QueryInterface(ITimelineMarker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimelineMarker := ITimelineMarker(outPtr)
        }

        return this.__ITimelineMarker.get_Time()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Time(value) {
        if (!this.HasProp("__ITimelineMarker")) {
            if ((queryResult := this.QueryInterface(ITimelineMarker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimelineMarker := ITimelineMarker(outPtr)
        }

        return this.__ITimelineMarker.put_Time(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Type() {
        if (!this.HasProp("__ITimelineMarker")) {
            if ((queryResult := this.QueryInterface(ITimelineMarker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimelineMarker := ITimelineMarker(outPtr)
        }

        return this.__ITimelineMarker.get_Type()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Type(value) {
        if (!this.HasProp("__ITimelineMarker")) {
            if ((queryResult := this.QueryInterface(ITimelineMarker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimelineMarker := ITimelineMarker(outPtr)
        }

        return this.__ITimelineMarker.put_Type(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__ITimelineMarker")) {
            if ((queryResult := this.QueryInterface(ITimelineMarker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimelineMarker := ITimelineMarker(outPtr)
        }

        return this.__ITimelineMarker.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if (!this.HasProp("__ITimelineMarker")) {
            if ((queryResult := this.QueryInterface(ITimelineMarker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimelineMarker := ITimelineMarker(outPtr)
        }

        return this.__ITimelineMarker.put_Text(value)
    }

;@endregion Instance Methods
}
