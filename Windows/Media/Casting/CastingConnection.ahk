#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICastingConnection.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\CastingConnection.ahk
#Include .\CastingConnectionErrorOccurredEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a connection with a casting device.
 * @remarks
 * Get an instance of this class by calling [CreateCastingConnection](castingdevice_createcastingconnection_475464068.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingconnection
 * @namespace Windows.Media.Casting
 * @version WindowsRuntime 1.4
 */
class CastingConnection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICastingConnection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICastingConnection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current state of the connection.
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingconnection.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets the casting device with which a connection has been made.
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingconnection.device
     * @type {CastingDevice} 
     */
    Device {
        get => this.get_Device()
    }

    /**
     * Gets and sets the content source that is being casted through the connection to the casting device. The content can be set and changed at any time and doing so does not disconnect the connection.
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingconnection.source
     * @type {CastingSource} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * Indicates a change in the [State](castingconnection_state.md) property.
     * @type {TypedEventHandler<CastingConnection, IInspectable>}
    */
    OnStateChanged {
        get {
            if(!this.HasProp("__OnStateChanged")){
                this.__OnStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f1576170-9b08-5a9b-87d2-c1ac47bc6681}"),
                    CastingConnection,
                    IInspectable
                )
                this.__OnStateChangedToken := this.add_StateChanged(this.__OnStateChanged.iface)
            }
            return this.__OnStateChanged
        }
    }

    /**
     * Indicates an error occurred while attempting to make a casting connection.
     * @type {TypedEventHandler<CastingConnection, CastingConnectionErrorOccurredEventArgs>}
    */
    OnErrorOccurred {
        get {
            if(!this.HasProp("__OnErrorOccurred")){
                this.__OnErrorOccurred := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{78afbbd0-9811-5f0e-9566-47c3e8cdd929}"),
                    CastingConnection,
                    CastingConnectionErrorOccurredEventArgs
                )
                this.__OnErrorOccurredToken := this.add_ErrorOccurred(this.__OnErrorOccurred.iface)
            }
            return this.__OnErrorOccurred
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

        if(this.HasProp("__OnErrorOccurredToken")) {
            this.remove_ErrorOccurred(this.__OnErrorOccurredToken)
            this.__OnErrorOccurred.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__ICastingConnection")) {
            if ((queryResult := this.QueryInterface(ICastingConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingConnection := ICastingConnection(outPtr)
        }

        return this.__ICastingConnection.get_State()
    }

    /**
     * 
     * @returns {CastingDevice} 
     */
    get_Device() {
        if (!this.HasProp("__ICastingConnection")) {
            if ((queryResult := this.QueryInterface(ICastingConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingConnection := ICastingConnection(outPtr)
        }

        return this.__ICastingConnection.get_Device()
    }

    /**
     * 
     * @returns {CastingSource} 
     */
    get_Source() {
        if (!this.HasProp("__ICastingConnection")) {
            if ((queryResult := this.QueryInterface(ICastingConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingConnection := ICastingConnection(outPtr)
        }

        return this.__ICastingConnection.get_Source()
    }

    /**
     * 
     * @param {CastingSource} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        if (!this.HasProp("__ICastingConnection")) {
            if ((queryResult := this.QueryInterface(ICastingConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingConnection := ICastingConnection(outPtr)
        }

        return this.__ICastingConnection.put_Source(value)
    }

    /**
     * 
     * @param {TypedEventHandler<CastingConnection, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(handler) {
        if (!this.HasProp("__ICastingConnection")) {
            if ((queryResult := this.QueryInterface(ICastingConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingConnection := ICastingConnection(outPtr)
        }

        return this.__ICastingConnection.add_StateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StateChanged(token) {
        if (!this.HasProp("__ICastingConnection")) {
            if ((queryResult := this.QueryInterface(ICastingConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingConnection := ICastingConnection(outPtr)
        }

        return this.__ICastingConnection.remove_StateChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<CastingConnection, CastingConnectionErrorOccurredEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ErrorOccurred(handler) {
        if (!this.HasProp("__ICastingConnection")) {
            if ((queryResult := this.QueryInterface(ICastingConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingConnection := ICastingConnection(outPtr)
        }

        return this.__ICastingConnection.add_ErrorOccurred(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ErrorOccurred(token) {
        if (!this.HasProp("__ICastingConnection")) {
            if ((queryResult := this.QueryInterface(ICastingConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingConnection := ICastingConnection(outPtr)
        }

        return this.__ICastingConnection.remove_ErrorOccurred(token)
    }

    /**
     * Starts the process of casting to a casting device. When called, this method pairs the c sting device, if necessary, and verifies access to the casting device with the user. If the user denies the app access to the device, casting fails. Otherwise, a connection is established, and content is sent to the device. During this time, the connection state changes to connecting, then to connected. If a casting source is set, the state changes to rendering once playback begins.
     * @remarks
     * This method must be called from the UI thread or an exception will be thrown. To dispatch the call to the UI thread from another thread, you can use [CoreDispatcher.RunAsync](../windows.ui.core/coredispatcher_runasync_447339746.md).
     * @param {CastingSource} value The content to be casted.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingconnection.requeststartcastingasync
     */
    RequestStartCastingAsync(value) {
        if (!this.HasProp("__ICastingConnection")) {
            if ((queryResult := this.QueryInterface(ICastingConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingConnection := ICastingConnection(outPtr)
        }

        return this.__ICastingConnection.RequestStartCastingAsync(value)
    }

    /**
     * Terminates a casting connection. The content that was rendering remotely returns to the local element that you retrieved the casting source from.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingconnection.disconnectasync
     */
    DisconnectAsync() {
        if (!this.HasProp("__ICastingConnection")) {
            if ((queryResult := this.QueryInterface(ICastingConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingConnection := ICastingConnection(outPtr)
        }

        return this.__ICastingConnection.DisconnectAsync()
    }

    /**
     * Closes the casting connection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingconnection.close
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
