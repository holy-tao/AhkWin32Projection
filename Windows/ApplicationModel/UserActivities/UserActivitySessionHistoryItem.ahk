#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserActivitySessionHistoryItem.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the start and end time that a user was engaged in a particular activity.
 * @remarks
 * Many applications provide most-recently-used (MRU) lists. This class provides start and end time information about a [UserActivity](useractivity.md) so that you can provide a similar experience for user activities.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitysessionhistoryitem
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class UserActivitySessionHistoryItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserActivitySessionHistoryItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserActivitySessionHistoryItem.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [UserActivity](useractivity.md) associated with this **UserActivitySessionHistoryItem**.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitysessionhistoryitem.useractivity
     * @type {UserActivity} 
     */
    UserActivity {
        get => this.get_UserActivity()
    }

    /**
     * Get the time when the user started engaging in the [UserActivity](useractivity.md) associated with this **UserActivitySessionHistoryItem**.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitysessionhistoryitem.starttime
     * @type {DateTime} 
     */
    StartTime {
        get => this.get_StartTime()
    }

    /**
     * Get the time when the user stopped engaging in the [UserActivity](useractivity.md) associated with this **UserActivitySessionHistoryItem**.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitysessionhistoryitem.endtime
     * @type {IReference<DateTime>} 
     */
    EndTime {
        get => this.get_EndTime()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {UserActivity} 
     */
    get_UserActivity() {
        if (!this.HasProp("__IUserActivitySessionHistoryItem")) {
            if ((queryResult := this.QueryInterface(IUserActivitySessionHistoryItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivitySessionHistoryItem := IUserActivitySessionHistoryItem(outPtr)
        }

        return this.__IUserActivitySessionHistoryItem.get_UserActivity()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_StartTime() {
        if (!this.HasProp("__IUserActivitySessionHistoryItem")) {
            if ((queryResult := this.QueryInterface(IUserActivitySessionHistoryItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivitySessionHistoryItem := IUserActivitySessionHistoryItem(outPtr)
        }

        return this.__IUserActivitySessionHistoryItem.get_StartTime()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_EndTime() {
        if (!this.HasProp("__IUserActivitySessionHistoryItem")) {
            if ((queryResult := this.QueryInterface(IUserActivitySessionHistoryItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivitySessionHistoryItem := IUserActivitySessionHistoryItem(outPtr)
        }

        return this.__IUserActivitySessionHistoryItem.get_EndTime()
    }

;@endregion Instance Methods
}
