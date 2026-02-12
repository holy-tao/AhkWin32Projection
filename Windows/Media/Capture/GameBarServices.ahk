#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameBarServices.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\GameBarServices.ahk
#Include .\GameBarServicesCommandEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Manages the state of the Game Bar.
 * @remarks
 * This API may throw an error if the background service has shut down due to idle timeout.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservices
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class GameBarServices extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameBarServices

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameBarServices.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the policy for app capture of a target.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservices.targetcapturepolicy
     * @type {Integer} 
     */
    TargetCapturePolicy {
        get => this.get_TargetCapturePolicy()
    }

    /**
     * Gets an object that provides metadata for an app capture target.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservices.targetinfo
     * @type {GameBarServicesTargetInfo} 
     */
    TargetInfo {
        get => this.get_TargetInfo()
    }

    /**
     * Gets a unique identifier for the Game Bar session.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservices.sessionid
     * @type {HSTRING} 
     */
    SessionId {
        get => this.get_SessionId()
    }

    /**
     * Gets an object that manages app broadcasts.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservices.appbroadcastservices
     * @type {AppBroadcastServices} 
     */
    AppBroadcastServices {
        get => this.get_AppBroadcastServices()
    }

    /**
     * Gets an object that manages app capture.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservices.appcaptureservices
     * @type {AppCaptureServices} 
     */
    AppCaptureServices {
        get => this.get_AppCaptureServices()
    }

    /**
     * Occurs when a Game Bar command is received.
     * @type {TypedEventHandler<GameBarServices, GameBarServicesCommandEventArgs>}
    */
    OnCommandReceived {
        get {
            if(!this.HasProp("__OnCommandReceived")){
                this.__OnCommandReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0dab4f7e-bfec-59e1-82cf-ebf64b1db4f3}"),
                    GameBarServices,
                    GameBarServicesCommandEventArgs
                )
                this.__OnCommandReceivedToken := this.add_CommandReceived(this.__OnCommandReceived.iface)
            }
            return this.__OnCommandReceived
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCommandReceivedToken")) {
            this.remove_CommandReceived(this.__OnCommandReceivedToken)
            this.__OnCommandReceived.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TargetCapturePolicy() {
        if (!this.HasProp("__IGameBarServices")) {
            if ((queryResult := this.QueryInterface(IGameBarServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameBarServices := IGameBarServices(outPtr)
        }

        return this.__IGameBarServices.get_TargetCapturePolicy()
    }

    /**
     * Enables app capture.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservices.enablecapture
     */
    EnableCapture() {
        if (!this.HasProp("__IGameBarServices")) {
            if ((queryResult := this.QueryInterface(IGameBarServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameBarServices := IGameBarServices(outPtr)
        }

        return this.__IGameBarServices.EnableCapture()
    }

    /**
     * Disables app capture.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservices.disablecapture
     */
    DisableCapture() {
        if (!this.HasProp("__IGameBarServices")) {
            if ((queryResult := this.QueryInterface(IGameBarServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameBarServices := IGameBarServices(outPtr)
        }

        return this.__IGameBarServices.DisableCapture()
    }

    /**
     * 
     * @returns {GameBarServicesTargetInfo} 
     */
    get_TargetInfo() {
        if (!this.HasProp("__IGameBarServices")) {
            if ((queryResult := this.QueryInterface(IGameBarServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameBarServices := IGameBarServices(outPtr)
        }

        return this.__IGameBarServices.get_TargetInfo()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SessionId() {
        if (!this.HasProp("__IGameBarServices")) {
            if ((queryResult := this.QueryInterface(IGameBarServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameBarServices := IGameBarServices(outPtr)
        }

        return this.__IGameBarServices.get_SessionId()
    }

    /**
     * 
     * @returns {AppBroadcastServices} 
     */
    get_AppBroadcastServices() {
        if (!this.HasProp("__IGameBarServices")) {
            if ((queryResult := this.QueryInterface(IGameBarServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameBarServices := IGameBarServices(outPtr)
        }

        return this.__IGameBarServices.get_AppBroadcastServices()
    }

    /**
     * 
     * @returns {AppCaptureServices} 
     */
    get_AppCaptureServices() {
        if (!this.HasProp("__IGameBarServices")) {
            if ((queryResult := this.QueryInterface(IGameBarServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameBarServices := IGameBarServices(outPtr)
        }

        return this.__IGameBarServices.get_AppCaptureServices()
    }

    /**
     * 
     * @param {TypedEventHandler<GameBarServices, GameBarServicesCommandEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_CommandReceived(value) {
        if (!this.HasProp("__IGameBarServices")) {
            if ((queryResult := this.QueryInterface(IGameBarServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameBarServices := IGameBarServices(outPtr)
        }

        return this.__IGameBarServices.add_CommandReceived(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CommandReceived(token) {
        if (!this.HasProp("__IGameBarServices")) {
            if ((queryResult := this.QueryInterface(IGameBarServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameBarServices := IGameBarServices(outPtr)
        }

        return this.__IGameBarServices.remove_CommandReceived(token)
    }

;@endregion Instance Methods
}
