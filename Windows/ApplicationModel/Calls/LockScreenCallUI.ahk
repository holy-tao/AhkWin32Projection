#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILockScreenCallUI.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\LockScreenCallUI.ahk
#Include .\LockScreenCallEndRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * **Deprecated.** Handles communication to and from the lock screen.
 * @remarks
 * > [!Warning]
 * > This class was deprecated after Windows 8.1.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.lockscreencallui
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class LockScreenCallUI extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILockScreenCallUI

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILockScreenCallUI.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** Gets and sets a brief description of the nature of the call. This brief description is also called the call's accessible name; its form is "Video call with Jane Doe."
     * @remarks
     * An app can use the CallTitle property to briefly describe the call. This call description is also called the accessible name and is provided to screen readers to describe your app when it runs on the lock screen. Don't include the name of your app in the accessible name; the operating system automatically includes the name of your app in the accessible name and provides that to the screen reader. The recommended form of the accessible name includes the mode of communication (video or audio) and the name of the other party. Here are some examples:
     * 
     * + Video call with Jane Doe
     * + Audio call with Jane Doe
     * + Video call with Jane Doe and three others
     * 
     * <!--[jjacks - don't know if this should go here] There are currently three sources of accessible names for app windows. 1. The window title managed by CoreWindow. This is used in the Switch list and in the Alt+Tab list. 2. The window title managed by MultipleViewManager for applications that create multiple windows. This is used in the Switch list and possibly also in the Alt+Tab list. 3. The CallTitle managed by LockScreenCallUI. This is used only on the lock screen.-->
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.lockscreencallui.calltitle
     * @type {HSTRING} 
     */
    CallTitle {
        get => this.get_CallTitle()
        set => this.put_CallTitle(value)
    }

    /**
     * **Deprecated.** Occurs when the lock screen wants to end the call.
     * @remarks
     * The EndRequested event typically happens when the user taps the “End call” button on the lock screen, but the event can also happen under other conditions. For example, suppose a call comes in while a call is already active on the lock screen. By accepting the new call on the lock screen, the previous call ends.
     * 
     * When the EndRequested event handler returns, the app is removed from the lock screen. An app can extend its time on the lock screen by calling [LockScreenCallEndRequestedEventArgs.GetDeferral](lockscreencallendrequestedeventargs_getdeferral_254836512.md) to request a deferral. If the app requested a deferral, the app is removed from the lock screen when the deferral completes or the deadline passes.
     * @type {TypedEventHandler<LockScreenCallUI, LockScreenCallEndRequestedEventArgs>}
    */
    OnEndRequested {
        get {
            if(!this.HasProp("__OnEndRequested")){
                this.__OnEndRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{92f7c40e-e7b9-5f68-98f0-56fb89015806}"),
                    LockScreenCallUI,
                    LockScreenCallEndRequestedEventArgs
                )
                this.__OnEndRequestedToken := this.add_EndRequested(this.__OnEndRequested.iface)
            }
            return this.__OnEndRequested
        }
    }

    /**
     * **Deprecated.** Occurs when the lock screen interaction is complete.
     * @remarks
     * The Closed event fires when the app is removed from the lock screen by any means. After this event fires, the [LockScreenCallUI](lockscreencallui.md) object is no longer valid. Any further attempt to use the [LockScreenCallUI](lockscreencallui.md) object can either silently fail or explicitly fail with RPC_E_DISCONNECTED.
     * 
     * The Closed event doesn't use the object parameter passed to it. The object parameter exists only because event handlers require it.
     * @type {TypedEventHandler<LockScreenCallUI, IInspectable>}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{addada2a-e5a7-5921-b7e0-17323adf7382}"),
                    LockScreenCallUI,
                    IInspectable
                )
                this.__OnClosedToken := this.add_Closed(this.__OnClosed.iface)
            }
            return this.__OnClosed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnEndRequestedToken")) {
            this.remove_EndRequested(this.__OnEndRequestedToken)
            this.__OnEndRequested.iface.Dispose()
        }

        if(this.HasProp("__OnClosedToken")) {
            this.remove_Closed(this.__OnClosedToken)
            this.__OnClosed.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * **Deprecated.** Removes the app from the lock screen UI.
     * @remarks
     * An app calls Dismiss to remove itself when the call is dropped, for example, the other party hangs up. When Dismiss returns, the lock screen no longer shows the app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.lockscreencallui.dismiss
     */
    Dismiss() {
        if (!this.HasProp("__ILockScreenCallUI")) {
            if ((queryResult := this.QueryInterface(ILockScreenCallUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenCallUI := ILockScreenCallUI(outPtr)
        }

        return this.__ILockScreenCallUI.Dismiss()
    }

    /**
     * 
     * @param {TypedEventHandler<LockScreenCallUI, LockScreenCallEndRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EndRequested(handler) {
        if (!this.HasProp("__ILockScreenCallUI")) {
            if ((queryResult := this.QueryInterface(ILockScreenCallUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenCallUI := ILockScreenCallUI(outPtr)
        }

        return this.__ILockScreenCallUI.add_EndRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EndRequested(token) {
        if (!this.HasProp("__ILockScreenCallUI")) {
            if ((queryResult := this.QueryInterface(ILockScreenCallUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenCallUI := ILockScreenCallUI(outPtr)
        }

        return this.__ILockScreenCallUI.remove_EndRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<LockScreenCallUI, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        if (!this.HasProp("__ILockScreenCallUI")) {
            if ((queryResult := this.QueryInterface(ILockScreenCallUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenCallUI := ILockScreenCallUI(outPtr)
        }

        return this.__ILockScreenCallUI.add_Closed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__ILockScreenCallUI")) {
            if ((queryResult := this.QueryInterface(ILockScreenCallUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenCallUI := ILockScreenCallUI(outPtr)
        }

        return this.__ILockScreenCallUI.remove_Closed(token)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CallTitle() {
        if (!this.HasProp("__ILockScreenCallUI")) {
            if ((queryResult := this.QueryInterface(ILockScreenCallUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenCallUI := ILockScreenCallUI(outPtr)
        }

        return this.__ILockScreenCallUI.get_CallTitle()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CallTitle(value) {
        if (!this.HasProp("__ILockScreenCallUI")) {
            if ((queryResult := this.QueryInterface(ILockScreenCallUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenCallUI := ILockScreenCallUI(outPtr)
        }

        return this.__ILockScreenCallUI.put_CallTitle(value)
    }

;@endregion Instance Methods
}
