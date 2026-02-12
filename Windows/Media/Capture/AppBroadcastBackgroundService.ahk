#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastBackgroundService.ahk
#Include .\IAppBroadcastBackgroundService2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AppBroadcastBackgroundService.ahk
#Include .\AppBroadcastHeartbeatRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides an interface between the broadcasting UWP app and the system-hosted broadcast service. This class provides access to objects that facilitate broadcast service authentication, test the bandwidth capabilities of the device's internet to the broadcasting provider service, and allow your task to acquire captured audio and video frames so that they can be sent to the broadcast provider service.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * Get an instance of this class by casting the [TriggerDetails](../windows.applicationmodel.background/ibackgroundtaskinstance_triggerdetails.md) property of the [IBackgroundTaskInstance](../windows.applicationmodel.background/ibackgroundtaskinstance.md) passed into your background task's [Run](../windows.applicationmodel.background/ibackgroundtask_run_2017283929.md) method to a [AppBroadcastTriggerDetails](appbroadcasttriggerdetails.md) and then accessing the [BackgroundService](appbroadcasttriggerdetails_backgroundservice.md) property.
 * 
 * This API may throw an error if the background service has shut down due to idle timeout.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservice
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastBackgroundService extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastBackgroundService

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastBackgroundService.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value specifying the current state of the broadcast background task.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservice.pluginstate
     * @type {Integer} 
     */
    PlugInState {
        get => this.get_PlugInState()
        set => this.put_PlugInState(value)
    }

    /**
     * Gets an object that represents the sign-in information for the app broadcast background service.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservice.signininfo
     * @type {AppBroadcastBackgroundServiceSignInInfo} 
     */
    SignInInfo {
        get => this.get_SignInInfo()
        set => this.put_SignInInfo(value)
    }

    /**
     * Gets an object that manages the stream state of the app broadcast background service.
     * @remarks
     * This API may throw an error if the background service has shut down due to idle timeout.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservice.streaminfo
     * @type {AppBroadcastBackgroundServiceStreamInfo} 
     */
    StreamInfo {
        get => this.get_StreamInfo()
        set => this.put_StreamInfo(value)
    }

    /**
     * Gets a string containing an identifier for the game being broadcast. When broadcasting on a desktop device, this value is the game on which the user initiated broadcasting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservice.appid
     * @type {HSTRING} 
     */
    AppId {
        get => this.get_AppId()
    }

    /**
     * Gets a string containing the user-specified title of the broadcast.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservice.broadcasttitle
     * @type {HSTRING} 
     */
    BroadcastTitle {
        get => this.get_BroadcastTitle()
        set => this.put_BroadcastTitle(value)
    }

    /**
     * Gets or sets the number of viewers of the broadcast.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservice.viewercount
     * @type {Integer} 
     */
    ViewerCount {
        get => this.get_ViewerCount()
        set => this.put_ViewerCount(value)
    }

    /**
     * Gets a unique identifier for the title being broadcast.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservice.titleid
     * @type {HSTRING} 
     */
    TitleId {
        get => this.get_TitleId()
    }

    /**
     * Gets a string representing the language of the current broadcast channel.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservice.broadcastlanguage
     * @type {HSTRING} 
     */
    BroadcastLanguage {
        get => this.get_BroadcastLanguage()
        set => this.put_BroadcastLanguage(value)
    }

    /**
     * Gets a string containing the name of the current broadcast channel.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservice.broadcastchannel
     * @type {HSTRING} 
     */
    BroadcastChannel {
        get => this.get_BroadcastChannel()
        set => this.put_BroadcastChannel(value)
    }

    /**
     * Raised by the system periodically to confirm that the broadcasting background task is currently active.
     * @remarks
     * Set the [Handled](appbroadcastheartbeatrequestedeventargs_handled.md) property to true to confirm that the background task is currently active. Failure to respond to this event and set the **Handled** property to true can result in the background task for the broadcast app being terminated.
     * @type {TypedEventHandler<AppBroadcastBackgroundService, AppBroadcastHeartbeatRequestedEventArgs>}
    */
    OnHeartbeatRequested {
        get {
            if(!this.HasProp("__OnHeartbeatRequested")){
                this.__OnHeartbeatRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{633c91ca-4fde-5160-9209-3fd3a403a917}"),
                    AppBroadcastBackgroundService,
                    AppBroadcastHeartbeatRequestedEventArgs
                )
                this.__OnHeartbeatRequestedToken := this.add_HeartbeatRequested(this.__OnHeartbeatRequested.iface)
            }
            return this.__OnHeartbeatRequested
        }
    }

    /**
     * Occurs when the value of the [BroadcastTitle](appbroadcastbackgroundservice_broadcasttitle.md) property changes.
     * @type {TypedEventHandler<AppBroadcastBackgroundService, IInspectable>}
    */
    OnBroadcastTitleChanged {
        get {
            if(!this.HasProp("__OnBroadcastTitleChanged")){
                this.__OnBroadcastTitleChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6e820f00-e1e0-5c73-afd8-a47b9b1c1bed}"),
                    AppBroadcastBackgroundService,
                    IInspectable
                )
                this.__OnBroadcastTitleChangedToken := this.add_BroadcastTitleChanged(this.__OnBroadcastTitleChanged.iface)
            }
            return this.__OnBroadcastTitleChanged
        }
    }

    /**
     * Occurs when the value of the [BroadcastLanguage](appbroadcastbackgroundservice_broadcastlanguage.md) property changes.
     * @type {TypedEventHandler<AppBroadcastBackgroundService, IInspectable>}
    */
    OnBroadcastLanguageChanged {
        get {
            if(!this.HasProp("__OnBroadcastLanguageChanged")){
                this.__OnBroadcastLanguageChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6e820f00-e1e0-5c73-afd8-a47b9b1c1bed}"),
                    AppBroadcastBackgroundService,
                    IInspectable
                )
                this.__OnBroadcastLanguageChangedToken := this.add_BroadcastLanguageChanged(this.__OnBroadcastLanguageChanged.iface)
            }
            return this.__OnBroadcastLanguageChanged
        }
    }

    /**
     * Occurs when the value of the [BroadcastChannel](appbroadcastbackgroundservice_broadcastchannel.md) property changes.
     * @type {TypedEventHandler<AppBroadcastBackgroundService, IInspectable>}
    */
    OnBroadcastChannelChanged {
        get {
            if(!this.HasProp("__OnBroadcastChannelChanged")){
                this.__OnBroadcastChannelChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6e820f00-e1e0-5c73-afd8-a47b9b1c1bed}"),
                    AppBroadcastBackgroundService,
                    IInspectable
                )
                this.__OnBroadcastChannelChangedToken := this.add_BroadcastChannelChanged(this.__OnBroadcastChannelChanged.iface)
            }
            return this.__OnBroadcastChannelChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnHeartbeatRequestedToken")) {
            this.remove_HeartbeatRequested(this.__OnHeartbeatRequestedToken)
            this.__OnHeartbeatRequested.iface.Dispose()
        }

        if(this.HasProp("__OnBroadcastTitleChangedToken")) {
            this.remove_BroadcastTitleChanged(this.__OnBroadcastTitleChangedToken)
            this.__OnBroadcastTitleChanged.iface.Dispose()
        }

        if(this.HasProp("__OnBroadcastLanguageChangedToken")) {
            this.remove_BroadcastLanguageChanged(this.__OnBroadcastLanguageChangedToken)
            this.__OnBroadcastLanguageChanged.iface.Dispose()
        }

        if(this.HasProp("__OnBroadcastChannelChangedToken")) {
            this.remove_BroadcastChannelChanged(this.__OnBroadcastChannelChangedToken)
            this.__OnBroadcastChannelChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PlugInState(value) {
        if (!this.HasProp("__IAppBroadcastBackgroundService")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService := IAppBroadcastBackgroundService(outPtr)
        }

        return this.__IAppBroadcastBackgroundService.put_PlugInState(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlugInState() {
        if (!this.HasProp("__IAppBroadcastBackgroundService")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService := IAppBroadcastBackgroundService(outPtr)
        }

        return this.__IAppBroadcastBackgroundService.get_PlugInState()
    }

    /**
     * 
     * @param {AppBroadcastBackgroundServiceSignInInfo} value 
     * @returns {HRESULT} 
     */
    put_SignInInfo(value) {
        if (!this.HasProp("__IAppBroadcastBackgroundService")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService := IAppBroadcastBackgroundService(outPtr)
        }

        return this.__IAppBroadcastBackgroundService.put_SignInInfo(value)
    }

    /**
     * 
     * @returns {AppBroadcastBackgroundServiceSignInInfo} 
     */
    get_SignInInfo() {
        if (!this.HasProp("__IAppBroadcastBackgroundService")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService := IAppBroadcastBackgroundService(outPtr)
        }

        return this.__IAppBroadcastBackgroundService.get_SignInInfo()
    }

    /**
     * 
     * @param {AppBroadcastBackgroundServiceStreamInfo} value 
     * @returns {HRESULT} 
     */
    put_StreamInfo(value) {
        if (!this.HasProp("__IAppBroadcastBackgroundService")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService := IAppBroadcastBackgroundService(outPtr)
        }

        return this.__IAppBroadcastBackgroundService.put_StreamInfo(value)
    }

    /**
     * 
     * @returns {AppBroadcastBackgroundServiceStreamInfo} 
     */
    get_StreamInfo() {
        if (!this.HasProp("__IAppBroadcastBackgroundService")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService := IAppBroadcastBackgroundService(outPtr)
        }

        return this.__IAppBroadcastBackgroundService.get_StreamInfo()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppId() {
        if (!this.HasProp("__IAppBroadcastBackgroundService")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService := IAppBroadcastBackgroundService(outPtr)
        }

        return this.__IAppBroadcastBackgroundService.get_AppId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BroadcastTitle() {
        if (!this.HasProp("__IAppBroadcastBackgroundService")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService := IAppBroadcastBackgroundService(outPtr)
        }

        return this.__IAppBroadcastBackgroundService.get_BroadcastTitle()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ViewerCount(value) {
        if (!this.HasProp("__IAppBroadcastBackgroundService")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService := IAppBroadcastBackgroundService(outPtr)
        }

        return this.__IAppBroadcastBackgroundService.put_ViewerCount(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ViewerCount() {
        if (!this.HasProp("__IAppBroadcastBackgroundService")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService := IAppBroadcastBackgroundService(outPtr)
        }

        return this.__IAppBroadcastBackgroundService.get_ViewerCount()
    }

    /**
     * Terminates a broadcast.
     * @param {Integer} reason A value indicating the reason that the broadcast is being terminated.
     * @param {Integer} providerSpecificReason An integer that conveys a provider-specific reason that the broadcast is being terminated.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservice.terminatebroadcast
     */
    TerminateBroadcast(reason, providerSpecificReason) {
        if (!this.HasProp("__IAppBroadcastBackgroundService")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService := IAppBroadcastBackgroundService(outPtr)
        }

        return this.__IAppBroadcastBackgroundService.TerminateBroadcast(reason, providerSpecificReason)
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastBackgroundService, AppBroadcastHeartbeatRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_HeartbeatRequested(handler) {
        if (!this.HasProp("__IAppBroadcastBackgroundService")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService := IAppBroadcastBackgroundService(outPtr)
        }

        return this.__IAppBroadcastBackgroundService.add_HeartbeatRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_HeartbeatRequested(token) {
        if (!this.HasProp("__IAppBroadcastBackgroundService")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService := IAppBroadcastBackgroundService(outPtr)
        }

        return this.__IAppBroadcastBackgroundService.remove_HeartbeatRequested(token)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TitleId() {
        if (!this.HasProp("__IAppBroadcastBackgroundService")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService := IAppBroadcastBackgroundService(outPtr)
        }

        return this.__IAppBroadcastBackgroundService.get_TitleId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_BroadcastTitle(value) {
        if (!this.HasProp("__IAppBroadcastBackgroundService2")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService2 := IAppBroadcastBackgroundService2(outPtr)
        }

        return this.__IAppBroadcastBackgroundService2.put_BroadcastTitle(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BroadcastLanguage() {
        if (!this.HasProp("__IAppBroadcastBackgroundService2")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService2 := IAppBroadcastBackgroundService2(outPtr)
        }

        return this.__IAppBroadcastBackgroundService2.get_BroadcastLanguage()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_BroadcastLanguage(value) {
        if (!this.HasProp("__IAppBroadcastBackgroundService2")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService2 := IAppBroadcastBackgroundService2(outPtr)
        }

        return this.__IAppBroadcastBackgroundService2.put_BroadcastLanguage(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BroadcastChannel() {
        if (!this.HasProp("__IAppBroadcastBackgroundService2")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService2 := IAppBroadcastBackgroundService2(outPtr)
        }

        return this.__IAppBroadcastBackgroundService2.get_BroadcastChannel()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_BroadcastChannel(value) {
        if (!this.HasProp("__IAppBroadcastBackgroundService2")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService2 := IAppBroadcastBackgroundService2(outPtr)
        }

        return this.__IAppBroadcastBackgroundService2.put_BroadcastChannel(value)
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastBackgroundService, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BroadcastTitleChanged(handler) {
        if (!this.HasProp("__IAppBroadcastBackgroundService2")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService2 := IAppBroadcastBackgroundService2(outPtr)
        }

        return this.__IAppBroadcastBackgroundService2.add_BroadcastTitleChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BroadcastTitleChanged(token) {
        if (!this.HasProp("__IAppBroadcastBackgroundService2")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService2 := IAppBroadcastBackgroundService2(outPtr)
        }

        return this.__IAppBroadcastBackgroundService2.remove_BroadcastTitleChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastBackgroundService, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BroadcastLanguageChanged(handler) {
        if (!this.HasProp("__IAppBroadcastBackgroundService2")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService2 := IAppBroadcastBackgroundService2(outPtr)
        }

        return this.__IAppBroadcastBackgroundService2.add_BroadcastLanguageChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BroadcastLanguageChanged(token) {
        if (!this.HasProp("__IAppBroadcastBackgroundService2")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService2 := IAppBroadcastBackgroundService2(outPtr)
        }

        return this.__IAppBroadcastBackgroundService2.remove_BroadcastLanguageChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastBackgroundService, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BroadcastChannelChanged(handler) {
        if (!this.HasProp("__IAppBroadcastBackgroundService2")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService2 := IAppBroadcastBackgroundService2(outPtr)
        }

        return this.__IAppBroadcastBackgroundService2.add_BroadcastChannelChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BroadcastChannelChanged(token) {
        if (!this.HasProp("__IAppBroadcastBackgroundService2")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundService2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundService2 := IAppBroadcastBackgroundService2(outPtr)
        }

        return this.__IAppBroadcastBackgroundService2.remove_BroadcastChannelChanged(token)
    }

;@endregion Instance Methods
}
