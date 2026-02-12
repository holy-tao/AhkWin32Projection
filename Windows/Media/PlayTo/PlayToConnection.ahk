#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayToConnection.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PlayToConnection.ahk
#Include .\PlayToConnectionStateChangedEventArgs.ahk
#Include .\PlayToConnectionTransferredEventArgs.ahk
#Include .\PlayToConnectionErrorEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides information about a Play To connection.
 * @remarks
 * For an example of how to use Play To in an application, see [PlayReady DRM](/windows/uwp/audio-video-camera/playready-client-sdk).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoconnection
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class PlayToConnection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayToConnection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayToConnection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the state of the Play To connection.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoconnection.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Occurs when the state of the Play To connection has changed.
     * @type {TypedEventHandler<PlayToConnection, PlayToConnectionStateChangedEventArgs>}
    */
    OnStateChanged {
        get {
            if(!this.HasProp("__OnStateChanged")){
                this.__OnStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{def77c1c-9363-5b47-b9f8-a236c50d372e}"),
                    PlayToConnection,
                    PlayToConnectionStateChangedEventArgs
                )
                this.__OnStateChangedToken := this.add_StateChanged(this.__OnStateChanged.iface)
            }
            return this.__OnStateChanged
        }
    }

    /**
     * Occurs when the Play To connection is transferred to the next Play To source.
     * @type {TypedEventHandler<PlayToConnection, PlayToConnectionTransferredEventArgs>}
    */
    OnTransferred {
        get {
            if(!this.HasProp("__OnTransferred")){
                this.__OnTransferred := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7278e7f2-0360-5571-8c3e-ea032767c473}"),
                    PlayToConnection,
                    PlayToConnectionTransferredEventArgs
                )
                this.__OnTransferredToken := this.add_Transferred(this.__OnTransferred.iface)
            }
            return this.__OnTransferred
        }
    }

    /**
     * Occurs when an error is encountered for the Play To connection.
     * @type {TypedEventHandler<PlayToConnection, PlayToConnectionErrorEventArgs>}
    */
    OnError {
        get {
            if(!this.HasProp("__OnError")){
                this.__OnError := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{8f599f3d-3655-5993-a119-741ec4ee6e42}"),
                    PlayToConnection,
                    PlayToConnectionErrorEventArgs
                )
                this.__OnErrorToken := this.add_Error(this.__OnError.iface)
            }
            return this.__OnError
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnStateChangedToken")) {
            this.remove_StateChanged(this.__OnStateChangedToken)
            this.__OnStateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnTransferredToken")) {
            this.remove_Transferred(this.__OnTransferredToken)
            this.__OnTransferred.iface.Dispose()
        }

        if(this.HasProp("__OnErrorToken")) {
            this.remove_Error(this.__OnErrorToken)
            this.__OnError.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IPlayToConnection")) {
            if ((queryResult := this.QueryInterface(IPlayToConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToConnection := IPlayToConnection(outPtr)
        }

        return this.__IPlayToConnection.get_State()
    }

    /**
     * 
     * @param {TypedEventHandler<PlayToConnection, PlayToConnectionStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(handler) {
        if (!this.HasProp("__IPlayToConnection")) {
            if ((queryResult := this.QueryInterface(IPlayToConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToConnection := IPlayToConnection(outPtr)
        }

        return this.__IPlayToConnection.add_StateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StateChanged(token) {
        if (!this.HasProp("__IPlayToConnection")) {
            if ((queryResult := this.QueryInterface(IPlayToConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToConnection := IPlayToConnection(outPtr)
        }

        return this.__IPlayToConnection.remove_StateChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PlayToConnection, PlayToConnectionTransferredEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Transferred(handler) {
        if (!this.HasProp("__IPlayToConnection")) {
            if ((queryResult := this.QueryInterface(IPlayToConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToConnection := IPlayToConnection(outPtr)
        }

        return this.__IPlayToConnection.add_Transferred(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Transferred(token) {
        if (!this.HasProp("__IPlayToConnection")) {
            if ((queryResult := this.QueryInterface(IPlayToConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToConnection := IPlayToConnection(outPtr)
        }

        return this.__IPlayToConnection.remove_Transferred(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PlayToConnection, PlayToConnectionErrorEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Error(handler) {
        if (!this.HasProp("__IPlayToConnection")) {
            if ((queryResult := this.QueryInterface(IPlayToConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToConnection := IPlayToConnection(outPtr)
        }

        return this.__IPlayToConnection.add_Error(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Error(token) {
        if (!this.HasProp("__IPlayToConnection")) {
            if ((queryResult := this.QueryInterface(IPlayToConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToConnection := IPlayToConnection(outPtr)
        }

        return this.__IPlayToConnection.remove_Error(token)
    }

;@endregion Instance Methods
}
