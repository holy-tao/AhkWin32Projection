#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppCapture.ahk
#Include .\IAppCaptureStatics.ahk
#Include .\IAppCaptureStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AppCapture.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides information about the app capture feature.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapture
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppCapture extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppCapture

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppCapture.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the instance of this class for the current view.
     * @returns {AppCapture} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapture.getforcurrentview
     */
    static GetForCurrentView() {
        if (!AppCapture.HasProp("__IAppCaptureStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.AppCapture")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppCaptureStatics.IID)
            AppCapture.__IAppCaptureStatics := IAppCaptureStatics(factoryPtr)
        }

        return AppCapture.__IAppCaptureStatics.GetForCurrentView()
    }

    /**
     * Sets a value that specifies whether the app capture is currently allowed for the calling app.
     * @remarks
     * The default value for this property is true, meaning that app capture is allowed. When an app sets this value, the set value does not persist across instances of the app.
     * @param {Boolean} allowed True if app capture is allowed; otherwise, false.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapture.setallowedasync
     */
    static SetAllowedAsync(allowed) {
        if (!AppCapture.HasProp("__IAppCaptureStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.AppCapture")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppCaptureStatics2.IID)
            AppCapture.__IAppCaptureStatics2 := IAppCaptureStatics2(factoryPtr)
        }

        return AppCapture.__IAppCaptureStatics2.SetAllowedAsync(allowed)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value indicating whether another app is currently capturing audio.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapture.iscapturingaudio
     * @type {Boolean} 
     */
    IsCapturingAudio {
        get => this.get_IsCapturingAudio()
    }

    /**
     * Gets a value indicating whether another app is currently capturing video.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapture.iscapturingvideo
     * @type {Boolean} 
     */
    IsCapturingVideo {
        get => this.get_IsCapturingVideo()
    }

    /**
     * Raised when the capturing status changes.
     * @remarks
     * > [!WARNING]
     * > You must unregister the handler for this event when your app is suspended.
     * @type {TypedEventHandler<AppCapture, IInspectable>}
    */
    OnCapturingChanged {
        get {
            if(!this.HasProp("__OnCapturingChanged")){
                this.__OnCapturingChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f5cb24b5-ff00-58df-b460-17bbf2cd64d3}"),
                    AppCapture,
                    IInspectable
                )
                this.__OnCapturingChangedToken := this.add_CapturingChanged(this.__OnCapturingChanged.iface)
            }
            return this.__OnCapturingChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCapturingChangedToken")) {
            this.remove_CapturingChanged(this.__OnCapturingChangedToken)
            this.__OnCapturingChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCapturingAudio() {
        if (!this.HasProp("__IAppCapture")) {
            if ((queryResult := this.QueryInterface(IAppCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCapture := IAppCapture(outPtr)
        }

        return this.__IAppCapture.get_IsCapturingAudio()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCapturingVideo() {
        if (!this.HasProp("__IAppCapture")) {
            if ((queryResult := this.QueryInterface(IAppCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCapture := IAppCapture(outPtr)
        }

        return this.__IAppCapture.get_IsCapturingVideo()
    }

    /**
     * 
     * @param {TypedEventHandler<AppCapture, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CapturingChanged(handler) {
        if (!this.HasProp("__IAppCapture")) {
            if ((queryResult := this.QueryInterface(IAppCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCapture := IAppCapture(outPtr)
        }

        return this.__IAppCapture.add_CapturingChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CapturingChanged(token) {
        if (!this.HasProp("__IAppCapture")) {
            if ((queryResult := this.QueryInterface(IAppCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCapture := IAppCapture(outPtr)
        }

        return this.__IAppCapture.remove_CapturingChanged(token)
    }

;@endregion Instance Methods
}
