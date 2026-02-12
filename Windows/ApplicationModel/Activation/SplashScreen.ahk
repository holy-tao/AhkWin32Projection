#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISplashScreen.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\SplashScreen.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides a dismissal event and image location information for the app's splash screen.
 * @remarks
 * Access this object from your app's activated event handler by using the [SplashScreen](iactivatedeventargs_splashscreen.md) property on the event object that is passed into your handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.splashscreen
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class SplashScreen extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISplashScreen

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISplashScreen.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The coordinates of the app's splash screen image relative to the window.
     * @remarks
     * You can give your app additional time to load by using this property to help you imitate the splash screen that Windows displays for your app. To learn how, see [How to extend the splash screen](/previous-versions/windows/apps/hh700390(v=win.10)).
     * 
     * If no splash screen image is displayed, the location returned is where the image is expected.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.splashscreen.imagelocation
     * @type {RECT} 
     */
    ImageLocation {
        get => this.get_ImageLocation()
    }

    /**
     * Fires when the app's splash screen is dismissed.
     * @remarks
     * When the dismissed event fires, the first view of your app is visible on the user's screen.
     * 
     * Avoid increasing the time required to load your app by using this event as a trigger to perform loading tasks (like loading network data) and animations.
     * @type {TypedEventHandler<SplashScreen, IInspectable>}
    */
    OnDismissed {
        get {
            if(!this.HasProp("__OnDismissed")){
                this.__OnDismissed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7725b2a5-287d-5ed2-a789-2a6a2673c7fe}"),
                    SplashScreen,
                    IInspectable
                )
                this.__OnDismissedToken := this.add_Dismissed(this.__OnDismissed.iface)
            }
            return this.__OnDismissed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDismissedToken")) {
            this.remove_Dismissed(this.__OnDismissedToken)
            this.__OnDismissed.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ImageLocation() {
        if (!this.HasProp("__ISplashScreen")) {
            if ((queryResult := this.QueryInterface(ISplashScreen.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplashScreen := ISplashScreen(outPtr)
        }

        return this.__ISplashScreen.get_ImageLocation()
    }

    /**
     * 
     * @param {TypedEventHandler<SplashScreen, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Dismissed(handler) {
        if (!this.HasProp("__ISplashScreen")) {
            if ((queryResult := this.QueryInterface(ISplashScreen.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplashScreen := ISplashScreen(outPtr)
        }

        return this.__ISplashScreen.add_Dismissed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_Dismissed(cookie) {
        if (!this.HasProp("__ISplashScreen")) {
            if ((queryResult := this.QueryInterface(ISplashScreen.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplashScreen := ISplashScreen(outPtr)
        }

        return this.__ISplashScreen.remove_Dismissed(cookie)
    }

;@endregion Instance Methods
}
