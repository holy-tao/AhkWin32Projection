#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserActivitySession.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Tracks a [UserActivity](useractivity.md) while the user is engaged in that activity.
 * @remarks
 * A [UserActivity](useractivity.md) is associated with an **UserActivitySession** which tracks how long the user is engaged in that activity. For example, an activity such as watching a movie can occur a little at a time over the course of multiple days. When the user first starts the new activity of watching a movie, a **UserActivitySession** must be created. It should be disposed when the user switches to different activity. When the user resumes watching the movie, create another **UserActivitySession** from the original **UserActivity** to track the activity as long as the user is watching the movie.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitysession
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class UserActivitySession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserActivitySession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserActivitySession.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the id of this **UserActivitySession**.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitysession.activityid
     * @type {HSTRING} 
     */
    ActivityId {
        get => this.get_ActivityId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ActivityId() {
        if (!this.HasProp("__IUserActivitySession")) {
            if ((queryResult := this.QueryInterface(IUserActivitySession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivitySession := IUserActivitySession(outPtr)
        }

        return this.__IUserActivitySession.get_ActivityId()
    }

    /**
     * Indicates that the user is no longer engaged in the activities associated with this session.
     * @remarks
     * You can also use the dispose pattern to close a **UserActivitySession**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitysession.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
