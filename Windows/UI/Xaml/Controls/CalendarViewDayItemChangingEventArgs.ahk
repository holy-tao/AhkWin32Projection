#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICalendarViewDayItemChangingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [CalendarViewDayItemChanging](calendarview_calendarviewdayitemchanging.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarviewdayitemchangingeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CalendarViewDayItemChangingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICalendarViewDayItemChangingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICalendarViewDayItemChangingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether this container is in the recycle queue of the [CalendarView](calendarview.md) and is not being used to visualize a calendar item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarviewdayitemchangingeventargs.inrecyclequeue
     * @type {Boolean} 
     */
    InRecycleQueue {
        get => this.get_InRecycleQueue()
    }

    /**
     * Gets the calendar day item associated with this container.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarviewdayitemchangingeventargs.item
     * @type {CalendarViewDayItem} 
     */
    Item {
        get => this.get_Item()
    }

    /**
     * Gets the number of times this container and day item pair has been called.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarviewdayitemchangingeventargs.phase
     * @type {Integer} 
     */
    Phase {
        get => this.get_Phase()
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
    get_InRecycleQueue() {
        if (!this.HasProp("__ICalendarViewDayItemChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICalendarViewDayItemChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewDayItemChangingEventArgs := ICalendarViewDayItemChangingEventArgs(outPtr)
        }

        return this.__ICalendarViewDayItemChangingEventArgs.get_InRecycleQueue()
    }

    /**
     * 
     * @returns {CalendarViewDayItem} 
     */
    get_Item() {
        if (!this.HasProp("__ICalendarViewDayItemChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICalendarViewDayItemChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewDayItemChangingEventArgs := ICalendarViewDayItemChangingEventArgs(outPtr)
        }

        return this.__ICalendarViewDayItemChangingEventArgs.get_Item()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Phase() {
        if (!this.HasProp("__ICalendarViewDayItemChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICalendarViewDayItemChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewDayItemChangingEventArgs := ICalendarViewDayItemChangingEventArgs(outPtr)
        }

        return this.__ICalendarViewDayItemChangingEventArgs.get_Phase()
    }

    /**
     * Registers the event handler to be called again during the next phase.
     * @param {TypedEventHandler<CalendarView, CalendarViewDayItemChangingEventArgs>} callback The event handler function.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarviewdayitemchangingeventargs.registerupdatecallback
     */
    RegisterUpdateCallback(callback) {
        if (!this.HasProp("__ICalendarViewDayItemChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICalendarViewDayItemChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewDayItemChangingEventArgs := ICalendarViewDayItemChangingEventArgs(outPtr)
        }

        return this.__ICalendarViewDayItemChangingEventArgs.RegisterUpdateCallback(callback)
    }

    /**
     * Registers the event handler to be called again during the specified phase.
     * @param {Integer} callbackPhase The phase during which the callback should occur.
     * @param {TypedEventHandler<CalendarView, CalendarViewDayItemChangingEventArgs>} callback The event handler function.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarviewdayitemchangingeventargs.registerupdatecallback
     */
    RegisterUpdateCallbackWithPhase(callbackPhase, callback) {
        if (!this.HasProp("__ICalendarViewDayItemChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICalendarViewDayItemChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewDayItemChangingEventArgs := ICalendarViewDayItemChangingEventArgs(outPtr)
        }

        return this.__ICalendarViewDayItemChangingEventArgs.RegisterUpdateCallbackWithPhase(callbackPhase, callback)
    }

;@endregion Instance Methods
}
