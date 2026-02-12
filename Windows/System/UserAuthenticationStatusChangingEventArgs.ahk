#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserAuthenticationStatusChangingEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Provides data for a user authentication status changing event.
 * @remarks
 * At the time the UserAuthenticationStatusChanging event is raised, the user’s authentication status has not yet changed.
 * @see https://learn.microsoft.com/uwp/api/windows.system.userauthenticationstatuschangingeventargs
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class UserAuthenticationStatusChangingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserAuthenticationStatusChangingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserAuthenticationStatusChangingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the user.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userauthenticationstatuschangingeventargs.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Gets the user's new authentication status.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userauthenticationstatuschangingeventargs.newstatus
     * @type {Integer} 
     */
    NewStatus {
        get => this.get_NewStatus()
    }

    /**
     * Gets the user's current authentication status.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userauthenticationstatuschangingeventargs.currentstatus
     * @type {Integer} 
     */
    CurrentStatus {
        get => this.get_CurrentStatus()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Requests a delay before the user's authentication status changes.
     * @remarks
     * The change in user authentication status is delayed until the app calls the [UserAuthenticationStatusChangeDeferral.Complete](userauthenticationstatuschangedeferral_complete_1807836922.md) method or the deadline for the change has passed.
     * 
     * Use the deferral to complete asynchronous operations, such as saving data to a file, before the system changes the user’s authentication status.
     * @returns {UserAuthenticationStatusChangeDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userauthenticationstatuschangingeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IUserAuthenticationStatusChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserAuthenticationStatusChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserAuthenticationStatusChangingEventArgs := IUserAuthenticationStatusChangingEventArgs(outPtr)
        }

        return this.__IUserAuthenticationStatusChangingEventArgs.GetDeferral()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IUserAuthenticationStatusChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserAuthenticationStatusChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserAuthenticationStatusChangingEventArgs := IUserAuthenticationStatusChangingEventArgs(outPtr)
        }

        return this.__IUserAuthenticationStatusChangingEventArgs.get_User()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NewStatus() {
        if (!this.HasProp("__IUserAuthenticationStatusChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserAuthenticationStatusChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserAuthenticationStatusChangingEventArgs := IUserAuthenticationStatusChangingEventArgs(outPtr)
        }

        return this.__IUserAuthenticationStatusChangingEventArgs.get_NewStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentStatus() {
        if (!this.HasProp("__IUserAuthenticationStatusChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserAuthenticationStatusChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserAuthenticationStatusChangingEventArgs := IUserAuthenticationStatusChangingEventArgs(outPtr)
        }

        return this.__IUserAuthenticationStatusChangingEventArgs.get_CurrentStatus()
    }

;@endregion Instance Methods
}
