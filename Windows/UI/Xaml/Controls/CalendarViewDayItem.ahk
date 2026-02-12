#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\ICalendarViewDayItem.ahk
#Include .\ICalendarViewDayItemStatics.ahk
#Include .\ICalendarViewDayItemFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a day on a [CalendarView](calendarview.md).
 * @remarks
 * The calendar grid of a [CalendarView](calendarview.md) control is composed of CalendarViewDayItem objects. You typically modify the day item in the [CalendarViewDayItemChanging](calendarview_calendarviewdayitemchanging.md) event of either a [CalendarView](calendarview.md) or [CalendarDatePicker](calendardatepicker.md) control. Use the [Item](calendarviewdayitemchangingeventargs_item.md) property of the [CalendarViewDayItemChangingEventArgs](calendarviewdayitemchangingeventargs.md) to access the CalendarViewDayItem object. For more info, see the, "Updating calendar day items ", section of the [CalendarView](calendarview.md) class remarks.
 * 
 * To improve performance, the visual elements of a CalendarViewDayItem are rendered directly by the control, not defined in the control template as XAML elements. This means you can’t style or re-template these elements. However, [CalendarView](calendarview.md) provides several "calendar item" and "day item" properties that you can use to customize these elements, such as [CalendarItemBackground](calendarview_calendaritembackground.md), [CalendarItemBorderBrush](calendarview_calendaritemborderbrush.md), and [DayItemFontSize](calendarview_dayitemfontsize.md).
 * 
 * Even though the visual elements of a CalendarViewDayItem are rendered directly by the control, you can use [CalendarView.CalendarViewDayItemStyle](calendarview_calendarviewdayitemstyle.md) to set properties like [MinWidth](../windows.ui.xaml/frameworkelement_minwidth.md), [MinHeight](../windows.ui.xaml/frameworkelement_minheight.md), [Margin](../windows.ui.xaml/frameworkelement_margin.md), and [Padding](control_padding.md). The default [Style](../windows.ui.xaml/style.md) (see CalendarViewDayItem styles and template) also includes an empty [ControlTemplate](controltemplate.md) that you can use to inject custom XAML elements into the CalendarViewDayItem. Your XAML elements are rendered on top of the background elements, and below the day number and labels.
 * 
 * Use the [Date](calendarviewdayitem_date.md) property to get the date represented by this day item. The time portions of this property's [DateTime](/dotnet/api/system.datetime?view=dotnet-uwp-10.0&preserve-view=true) value are ignored. If you compare two dates from a [CalendarView](calendarview.md), be sure to compare only the **Date** portion of the [DateTime](/dotnet/api/system.datetime?view=dotnet-uwp-10.0&preserve-view=true) value.
 * 
 * Use the [IsBlackout](calendarviewdayitem_isblackout.md) property to get or set a value that indicates whether the date is unavailable.
 * 
 * Call the [SetDensityColors](calendarviewdayitem_setdensitycolors_669941734.md) method to set the collection of [Color](../windows.ui/color.md) values used to display the density bar.
 * 
 * > [!NOTE]
 * > The [IsBlackout](calendarviewdayitem_isblackout.md) property and the density colors collection are reset each time the day item container is recycled. If you use these features, you should set the values each time the [CalendarViewDayItemChanging](calendarview_calendarviewdayitemchanging.md) event occurs.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarviewdayitem
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CalendarViewDayItem extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICalendarViewDayItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICalendarViewDayItem.IID

    /**
     * Identifies the [IsBlackout](calendarviewdayitem_isblackout.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarviewdayitem.isblackoutproperty
     * @type {DependencyProperty} 
     */
    static IsBlackoutProperty {
        get => CalendarViewDayItem.get_IsBlackoutProperty()
    }

    /**
     * Identifies the [Date](calendarviewdayitem_date.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarviewdayitem.dateproperty
     * @type {DependencyProperty} 
     */
    static DateProperty {
        get => CalendarViewDayItem.get_DateProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsBlackoutProperty() {
        if (!CalendarViewDayItem.HasProp("__ICalendarViewDayItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarViewDayItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewDayItemStatics.IID)
            CalendarViewDayItem.__ICalendarViewDayItemStatics := ICalendarViewDayItemStatics(factoryPtr)
        }

        return CalendarViewDayItem.__ICalendarViewDayItemStatics.get_IsBlackoutProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DateProperty() {
        if (!CalendarViewDayItem.HasProp("__ICalendarViewDayItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarViewDayItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewDayItemStatics.IID)
            CalendarViewDayItem.__ICalendarViewDayItemStatics := ICalendarViewDayItemStatics(factoryPtr)
        }

        return CalendarViewDayItem.__ICalendarViewDayItemStatics.get_DateProperty()
    }

    /**
     * 
     * @returns {CalendarViewDayItem} 
     */
    static CreateInstance() {
        if (!CalendarViewDayItem.HasProp("__ICalendarViewDayItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CalendarViewDayItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICalendarViewDayItemFactory.IID)
            CalendarViewDayItem.__ICalendarViewDayItemFactory := ICalendarViewDayItemFactory(factoryPtr)
        }

        return CalendarViewDayItem.__ICalendarViewDayItemFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the date is unavailable.
     * @remarks
     * To mark a date as not selectable, set this property to `true`. For more information, see [Updating calendar day items](/uwp/api/windows.ui.xaml.controls.calendarview#updating-calendar-day-items).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarviewdayitem.isblackout
     * @type {Boolean} 
     */
    IsBlackout {
        get => this.get_IsBlackout()
        set => this.put_IsBlackout(value)
    }

    /**
     * Gets the date represented by this item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarviewdayitem.date
     * @type {DateTime} 
     */
    Date {
        get => this.get_Date()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBlackout() {
        if (!this.HasProp("__ICalendarViewDayItem")) {
            if ((queryResult := this.QueryInterface(ICalendarViewDayItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewDayItem := ICalendarViewDayItem(outPtr)
        }

        return this.__ICalendarViewDayItem.get_IsBlackout()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsBlackout(value) {
        if (!this.HasProp("__ICalendarViewDayItem")) {
            if ((queryResult := this.QueryInterface(ICalendarViewDayItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewDayItem := ICalendarViewDayItem(outPtr)
        }

        return this.__ICalendarViewDayItem.put_IsBlackout(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Date() {
        if (!this.HasProp("__ICalendarViewDayItem")) {
            if ((queryResult := this.QueryInterface(ICalendarViewDayItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewDayItem := ICalendarViewDayItem(outPtr)
        }

        return this.__ICalendarViewDayItem.get_Date()
    }

    /**
     * Sets the collection of [Color](../windows.ui/color.md) values used to display the density bar.
     * @remarks
     * You can show contextual information about the density of events in a day by calling this method. You can show from 0 to 10 density bars for each day, and set the color of each bar. For more information, see [Updating calendar day items](/uwp/api/windows.ui.xaml.controls.calendarview#updating-calendar-day-items)
     * @param {IIterable<Color>} colors_ The collection of [Color](../windows.ui/color.md) values used to display the density bar.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarviewdayitem.setdensitycolors
     */
    SetDensityColors(colors_) {
        if (!this.HasProp("__ICalendarViewDayItem")) {
            if ((queryResult := this.QueryInterface(ICalendarViewDayItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewDayItem := ICalendarViewDayItem(outPtr)
        }

        return this.__ICalendarViewDayItem.SetDensityColors(colors_)
    }

;@endregion Instance Methods
}
