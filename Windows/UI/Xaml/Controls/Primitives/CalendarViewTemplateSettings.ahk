#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\ICalendarViewTemplateSettings.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides calculated values that can be referenced as **TemplatedParent** sources when defining templates for a [CalendarView](../windows.ui.xaml.controls/calendarview.md) control. Not intended for general use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.calendarviewtemplatesettings
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class CalendarViewTemplateSettings extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICalendarViewTemplateSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICalendarViewTemplateSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the minimum width of the view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.calendarviewtemplatesettings.minviewwidth
     * @type {Float} 
     */
    MinViewWidth {
        get => this.get_MinViewWidth()
    }

    /**
     * Gets the text of the header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.calendarviewtemplatesettings.headertext
     * @type {HSTRING} 
     */
    HeaderText {
        get => this.get_HeaderText()
    }

    /**
     * Gets the first day of the week.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.calendarviewtemplatesettings.weekday1
     * @type {HSTRING} 
     */
    WeekDay1 {
        get => this.get_WeekDay1()
    }

    /**
     * Gets the second day of the week.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.calendarviewtemplatesettings.weekday2
     * @type {HSTRING} 
     */
    WeekDay2 {
        get => this.get_WeekDay2()
    }

    /**
     * Gets the third day of the week.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.calendarviewtemplatesettings.weekday3
     * @type {HSTRING} 
     */
    WeekDay3 {
        get => this.get_WeekDay3()
    }

    /**
     * Gets the fourth day of the week.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.calendarviewtemplatesettings.weekday4
     * @type {HSTRING} 
     */
    WeekDay4 {
        get => this.get_WeekDay4()
    }

    /**
     * Gets the fifth day of the week.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.calendarviewtemplatesettings.weekday5
     * @type {HSTRING} 
     */
    WeekDay5 {
        get => this.get_WeekDay5()
    }

    /**
     * Gets the sixth day of the week.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.calendarviewtemplatesettings.weekday6
     * @type {HSTRING} 
     */
    WeekDay6 {
        get => this.get_WeekDay6()
    }

    /**
     * Gets the seventh day of the week.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.calendarviewtemplatesettings.weekday7
     * @type {HSTRING} 
     */
    WeekDay7 {
        get => this.get_WeekDay7()
    }

    /**
     * Gets a value that indicates whether the [CalendarView](../windows.ui.xaml.controls/calendarview.md) has more content after the displayed content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.calendarviewtemplatesettings.hasmorecontentafter
     * @type {Boolean} 
     */
    HasMoreContentAfter {
        get => this.get_HasMoreContentAfter()
    }

    /**
     * Gets a value that indicates whether the [CalendarView](../windows.ui.xaml.controls/calendarview.md) has more content before the displayed content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.calendarviewtemplatesettings.hasmorecontentbefore
     * @type {Boolean} 
     */
    HasMoreContentBefore {
        get => this.get_HasMoreContentBefore()
    }

    /**
     * Gets a value that indicates whether the [CalendarView](../windows.ui.xaml.controls/calendarview.md) has more views (like year or decade) that can be shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.calendarviewtemplatesettings.hasmoreviews
     * @type {Boolean} 
     */
    HasMoreViews {
        get => this.get_HasMoreViews()
    }

    /**
     * Gets the rectangle used to clip the [CalendarView](../windows.ui.xaml.controls/calendarview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.calendarviewtemplatesettings.cliprect
     * @type {RECT} 
     */
    ClipRect {
        get => this.get_ClipRect()
    }

    /**
     * Gets the X coordinate of the [CalendarView](../windows.ui.xaml.controls/calendarview.md)'s center point.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.calendarviewtemplatesettings.centerx
     * @type {Float} 
     */
    CenterX {
        get => this.get_CenterX()
    }

    /**
     * Gets the Y coordinate of the [CalendarView](../windows.ui.xaml.controls/calendarview.md)'s center point.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.calendarviewtemplatesettings.centery
     * @type {Float} 
     */
    CenterY {
        get => this.get_CenterY()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinViewWidth() {
        if (!this.HasProp("__ICalendarViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICalendarViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewTemplateSettings := ICalendarViewTemplateSettings(outPtr)
        }

        return this.__ICalendarViewTemplateSettings.get_MinViewWidth()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HeaderText() {
        if (!this.HasProp("__ICalendarViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICalendarViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewTemplateSettings := ICalendarViewTemplateSettings(outPtr)
        }

        return this.__ICalendarViewTemplateSettings.get_HeaderText()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WeekDay1() {
        if (!this.HasProp("__ICalendarViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICalendarViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewTemplateSettings := ICalendarViewTemplateSettings(outPtr)
        }

        return this.__ICalendarViewTemplateSettings.get_WeekDay1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WeekDay2() {
        if (!this.HasProp("__ICalendarViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICalendarViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewTemplateSettings := ICalendarViewTemplateSettings(outPtr)
        }

        return this.__ICalendarViewTemplateSettings.get_WeekDay2()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WeekDay3() {
        if (!this.HasProp("__ICalendarViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICalendarViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewTemplateSettings := ICalendarViewTemplateSettings(outPtr)
        }

        return this.__ICalendarViewTemplateSettings.get_WeekDay3()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WeekDay4() {
        if (!this.HasProp("__ICalendarViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICalendarViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewTemplateSettings := ICalendarViewTemplateSettings(outPtr)
        }

        return this.__ICalendarViewTemplateSettings.get_WeekDay4()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WeekDay5() {
        if (!this.HasProp("__ICalendarViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICalendarViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewTemplateSettings := ICalendarViewTemplateSettings(outPtr)
        }

        return this.__ICalendarViewTemplateSettings.get_WeekDay5()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WeekDay6() {
        if (!this.HasProp("__ICalendarViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICalendarViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewTemplateSettings := ICalendarViewTemplateSettings(outPtr)
        }

        return this.__ICalendarViewTemplateSettings.get_WeekDay6()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WeekDay7() {
        if (!this.HasProp("__ICalendarViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICalendarViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewTemplateSettings := ICalendarViewTemplateSettings(outPtr)
        }

        return this.__ICalendarViewTemplateSettings.get_WeekDay7()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasMoreContentAfter() {
        if (!this.HasProp("__ICalendarViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICalendarViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewTemplateSettings := ICalendarViewTemplateSettings(outPtr)
        }

        return this.__ICalendarViewTemplateSettings.get_HasMoreContentAfter()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasMoreContentBefore() {
        if (!this.HasProp("__ICalendarViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICalendarViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewTemplateSettings := ICalendarViewTemplateSettings(outPtr)
        }

        return this.__ICalendarViewTemplateSettings.get_HasMoreContentBefore()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasMoreViews() {
        if (!this.HasProp("__ICalendarViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICalendarViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewTemplateSettings := ICalendarViewTemplateSettings(outPtr)
        }

        return this.__ICalendarViewTemplateSettings.get_HasMoreViews()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ClipRect() {
        if (!this.HasProp("__ICalendarViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICalendarViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewTemplateSettings := ICalendarViewTemplateSettings(outPtr)
        }

        return this.__ICalendarViewTemplateSettings.get_ClipRect()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterX() {
        if (!this.HasProp("__ICalendarViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICalendarViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewTemplateSettings := ICalendarViewTemplateSettings(outPtr)
        }

        return this.__ICalendarViewTemplateSettings.get_CenterX()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterY() {
        if (!this.HasProp("__ICalendarViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICalendarViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewTemplateSettings := ICalendarViewTemplateSettings(outPtr)
        }

        return this.__ICalendarViewTemplateSettings.get_CenterY()
    }

;@endregion Instance Methods
}
