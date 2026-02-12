#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastServices.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manages the state of app broadcasts.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastservices
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastServices extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastServices

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastServices.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that specifies the type of capture target to be used for broadcast.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastservices.capturetargettype
     * @type {Integer} 
     */
    CaptureTargetType {
        get => this.get_CaptureTargetType()
        set => this.put_CaptureTargetType(value)
    }

    /**
     * Gets or sets the title of the broadcast.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastservices.broadcasttitle
     * @type {HSTRING} 
     */
    BroadcastTitle {
        get => this.get_BroadcastTitle()
        set => this.put_BroadcastTitle(value)
    }

    /**
     * Gets or sets a string that specifies the language settings for app broadast.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastservices.broadcastlanguage
     * @type {HSTRING} 
     */
    BroadcastLanguage {
        get => this.get_BroadcastLanguage()
        set => this.put_BroadcastLanguage(value)
    }

    /**
     * Gets the username used for authentication for app broadcast.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastservices.username
     * @type {HSTRING} 
     */
    UserName {
        get => this.get_UserName()
    }

    /**
     * Gets a value indicating whether the broadcast service can capture.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastservices.cancapture
     * @type {Boolean} 
     */
    CanCapture {
        get => this.get_CanCapture()
    }

    /**
     * Gets the current state of the app broadcast services.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastservices.state
     * @type {AppBroadcastState} 
     */
    State {
        get => this.get_State()
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
    get_CaptureTargetType() {
        if (!this.HasProp("__IAppBroadcastServices")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastServices := IAppBroadcastServices(outPtr)
        }

        return this.__IAppBroadcastServices.get_CaptureTargetType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CaptureTargetType(value) {
        if (!this.HasProp("__IAppBroadcastServices")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastServices := IAppBroadcastServices(outPtr)
        }

        return this.__IAppBroadcastServices.put_CaptureTargetType(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BroadcastTitle() {
        if (!this.HasProp("__IAppBroadcastServices")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastServices := IAppBroadcastServices(outPtr)
        }

        return this.__IAppBroadcastServices.get_BroadcastTitle()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_BroadcastTitle(value) {
        if (!this.HasProp("__IAppBroadcastServices")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastServices := IAppBroadcastServices(outPtr)
        }

        return this.__IAppBroadcastServices.put_BroadcastTitle(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BroadcastLanguage() {
        if (!this.HasProp("__IAppBroadcastServices")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastServices := IAppBroadcastServices(outPtr)
        }

        return this.__IAppBroadcastServices.get_BroadcastLanguage()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_BroadcastLanguage(value) {
        if (!this.HasProp("__IAppBroadcastServices")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastServices := IAppBroadcastServices(outPtr)
        }

        return this.__IAppBroadcastServices.put_BroadcastLanguage(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserName() {
        if (!this.HasProp("__IAppBroadcastServices")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastServices := IAppBroadcastServices(outPtr)
        }

        return this.__IAppBroadcastServices.get_UserName()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanCapture() {
        if (!this.HasProp("__IAppBroadcastServices")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastServices := IAppBroadcastServices(outPtr)
        }

        return this.__IAppBroadcastServices.get_CanCapture()
    }

    /**
     * Causes the app broadcast service to enter broadcast mode with the specified app broadcast plugin.
     * @param {AppBroadcastPlugIn} plugIn The app broadcast plugin with which broadcast mode is entered.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastservices.enterbroadcastmodeasync
     */
    EnterBroadcastModeAsync(plugIn) {
        if (!this.HasProp("__IAppBroadcastServices")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastServices := IAppBroadcastServices(outPtr)
        }

        return this.__IAppBroadcastServices.EnterBroadcastModeAsync(plugIn)
    }

    /**
     * Causes the app broadcast service to exit broadcast mode with the specified reason.
     * @param {Integer} reason An object that specifies the reason that broadcast mode is being exited.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastservices.exitbroadcastmode
     */
    ExitBroadcastMode(reason) {
        if (!this.HasProp("__IAppBroadcastServices")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastServices := IAppBroadcastServices(outPtr)
        }

        return this.__IAppBroadcastServices.ExitBroadcastMode(reason)
    }

    /**
     * Starts app broadcasting.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastservices.startbroadcast
     */
    StartBroadcast() {
        if (!this.HasProp("__IAppBroadcastServices")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastServices := IAppBroadcastServices(outPtr)
        }

        return this.__IAppBroadcastServices.StartBroadcast()
    }

    /**
     * Pauses the app broadcasting.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastservices.pausebroadcast
     */
    PauseBroadcast() {
        if (!this.HasProp("__IAppBroadcastServices")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastServices := IAppBroadcastServices(outPtr)
        }

        return this.__IAppBroadcastServices.PauseBroadcast()
    }

    /**
     * Resumes the app broadcasting.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastservices.resumebroadcast
     */
    ResumeBroadcast() {
        if (!this.HasProp("__IAppBroadcastServices")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastServices := IAppBroadcastServices(outPtr)
        }

        return this.__IAppBroadcastServices.ResumeBroadcast()
    }

    /**
     * Starts the app broadcast preview.
     * @param {SIZE} desiredSize An object specifying the size, in pixels, of the app broadcast preview.
     * @returns {AppBroadcastPreview} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastservices.startpreview
     */
    StartPreview(desiredSize) {
        if (!this.HasProp("__IAppBroadcastServices")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastServices := IAppBroadcastServices(outPtr)
        }

        return this.__IAppBroadcastServices.StartPreview(desiredSize)
    }

    /**
     * 
     * @returns {AppBroadcastState} 
     */
    get_State() {
        if (!this.HasProp("__IAppBroadcastServices")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastServices := IAppBroadcastServices(outPtr)
        }

        return this.__IAppBroadcastServices.get_State()
    }

;@endregion Instance Methods
}
