#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastSignInStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [AppBroadcastBackgroundServiceSignInInfo.SignInStateChanged](appbroadcastbackgroundservicesignininfo_signinstatechanged.md) event.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * Get an instance of this class by handling the [AppBroadcastBackgroundServiceSignInInfo.SignInStateChanged](appbroadcastbackgroundservicesignininfo_signinstatechanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastsigninstatechangedeventargs
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastSignInStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastSignInStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastSignInStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current broadcast app sign-in state after the [AppBroadcastBackgroundServiceSignInInfo.SignInStateChanged](appbroadcastbackgroundservicesignininfo_signinstatechanged.md) is raised.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastsigninstatechangedeventargs.signinstate
     * @type {Integer} 
     */
    SignInState {
        get => this.get_SignInState()
    }

    /**
     * Gets the result of the broadcast app sign-in operation associated with the [AppBroadcastBackgroundServiceSignInInfo.SignInStateChanged](appbroadcastbackgroundservicesignininfo_signinstatechanged.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastsigninstatechangedeventargs.result
     * @type {Integer} 
     */
    Result {
        get => this.get_Result()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SignInState() {
        if (!this.HasProp("__IAppBroadcastSignInStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastSignInStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastSignInStateChangedEventArgs := IAppBroadcastSignInStateChangedEventArgs(outPtr)
        }

        return this.__IAppBroadcastSignInStateChangedEventArgs.get_SignInState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Result() {
        if (!this.HasProp("__IAppBroadcastSignInStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastSignInStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastSignInStateChangedEventArgs := IAppBroadcastSignInStateChangedEventArgs(outPtr)
        }

        return this.__IAppBroadcastSignInStateChangedEventArgs.get_Result()
    }

;@endregion Instance Methods
}
