#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioPlaybackConnection.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IAudioPlaybackConnectionStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AudioPlaybackConnection.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a connection that allows a remote device to stream audio to a Windows device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioplaybackconnection
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioPlaybackConnection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioPlaybackConnection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioPlaybackConnection.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an Advanced Query Syntax (AQS) string for that can be used to find devices for which an [AudioPlaybackConnection](audioplaybackconnection.md) can be created.
     * @remarks
     * Pass the returned string to the [DeviceInformation.CreateWatcher](/uwp/api/windows.devices.enumeration.deviceinformation.createwatcher) method to create a [DeviceWatcher](/uwp/api/Windows.Devices.Enumeration.DeviceWatcher) that will notify your app when devices are added or removed.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioplaybackconnection.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!AudioPlaybackConnection.HasProp("__IAudioPlaybackConnectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioPlaybackConnection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioPlaybackConnectionStatics.IID)
            AudioPlaybackConnection.__IAudioPlaybackConnectionStatics := IAudioPlaybackConnectionStatics(factoryPtr)
        }

        return AudioPlaybackConnection.__IAudioPlaybackConnectionStatics.GetDeviceSelector()
    }

    /**
     * Attempts to create an [AudioPlaybackConnection](audioplaybackconnection.md) from the specified device ID.
     * @remarks
     * Get a device ID by creating a [DeviceWatcher](/uwp/api/Windows.Devices.Enumeration.DeviceWatcher) by calling [DeviceInformation.CreateWatcher](/uwp/api/windows.devices.enumeration.deviceinformation.createwatcher) and passing in the string returned by [GetDeviceSelector](audioplaybackconnection_getdeviceselector_838466080.md).
     * @param {HSTRING} id The identifier for the device for which the connection should be created.
     * @returns {AudioPlaybackConnection} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioplaybackconnection.trycreatefromid
     */
    static TryCreateFromId(id) {
        if (!AudioPlaybackConnection.HasProp("__IAudioPlaybackConnectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioPlaybackConnection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioPlaybackConnectionStatics.IID)
            AudioPlaybackConnection.__IAudioPlaybackConnectionStatics := IAudioPlaybackConnectionStatics(factoryPtr)
        }

        return AudioPlaybackConnection.__IAudioPlaybackConnectionStatics.TryCreateFromId(id)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the unique device ID for the underlying device represented by the [AudioPlaybackConnection](audioplaybackconnection.md).
     * @remarks
     * The returned ID is the same ID used to create the connection in the call to [TryCreateFromId](audioplaybackconnection_trycreatefromid_1104379169.md). If the connection was created from a transport that does not have a corresponding transport device, then this property’s value is an empty string.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioplaybackconnection.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the current connection state of the [AudioPlaybackConnection](audioplaybackconnection.md).
     * @remarks
     * Implement a handler for the [StateChanged](audioplaybackconnection_statechanged.md) event to receive notifications when the connection state changes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioplaybackconnection.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Occurs when the connection state of the [AudioPlaybackConnection](audioplaybackconnection.md) changes.
     * @remarks
     * Check the [State](audioplaybackconnection_state.md) property of the [AudioPlaybackConnection](audioplaybackconnection.md) object passed as the *sender* argument to the event handler to get the new connection state.
     * @type {TypedEventHandler<AudioPlaybackConnection, IInspectable>}
    */
    OnStateChanged {
        get {
            if(!this.HasProp("__OnStateChanged")){
                this.__OnStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0e389b05-31a6-58f1-9ea4-0c1e4d70a7b8}"),
                    AudioPlaybackConnection,
                    IInspectable
                )
                this.__OnStateChangedToken := this.add_StateChanged(this.__OnStateChanged.iface)
            }
            return this.__OnStateChanged
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

        this.Close()

        super.__Delete()
    }

    /**
     * Configures the system to allow connections from the remote audio source.
     * @remarks
     * This method informs the system that there is a new application that wants audio from the remote device to be played on the local device. But audio does not play until the connection has been opened with a call to [Open](audioplaybackconnection_open_389234318.md) or [OpenAsync](audioplaybackconnection_openasync_171309613.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioplaybackconnection.start
     */
    Start() {
        if (!this.HasProp("__IAudioPlaybackConnection")) {
            if ((queryResult := this.QueryInterface(IAudioPlaybackConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioPlaybackConnection := IAudioPlaybackConnection(outPtr)
        }

        return this.__IAudioPlaybackConnection.Start()
    }

    /**
     * Asynchronously configures the system to allow connections from the remote audio source.
     * @remarks
     * This method informs the system that there is a new application that wants audio from the remote device to be played on the local device. But audio does not play until the connection has been opened with a call to [Open](audioplaybackconnection_open_389234318.md) or [OpenAsync](audioplaybackconnection_openasync_171309613.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioplaybackconnection.startasync
     */
    StartAsync() {
        if (!this.HasProp("__IAudioPlaybackConnection")) {
            if ((queryResult := this.QueryInterface(IAudioPlaybackConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioPlaybackConnection := IAudioPlaybackConnection(outPtr)
        }

        return this.__IAudioPlaybackConnection.StartAsync()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IAudioPlaybackConnection")) {
            if ((queryResult := this.QueryInterface(IAudioPlaybackConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioPlaybackConnection := IAudioPlaybackConnection(outPtr)
        }

        return this.__IAudioPlaybackConnection.get_DeviceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IAudioPlaybackConnection")) {
            if ((queryResult := this.QueryInterface(IAudioPlaybackConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioPlaybackConnection := IAudioPlaybackConnection(outPtr)
        }

        return this.__IAudioPlaybackConnection.get_State()
    }

    /**
     * Attempts to connect the underlying device. If successful, this causes any audio that is playing on the remote device to be heard on the local device.
     * @returns {AudioPlaybackConnectionOpenResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioplaybackconnection.open
     */
    Open() {
        if (!this.HasProp("__IAudioPlaybackConnection")) {
            if ((queryResult := this.QueryInterface(IAudioPlaybackConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioPlaybackConnection := IAudioPlaybackConnection(outPtr)
        }

        return this.__IAudioPlaybackConnection.Open()
    }

    /**
     * Asynchronously attempts to connect the underlying device. If successful, this causes any audio that is playing on the remote device to be heard on the local device.
     * @returns {IAsyncOperation<AudioPlaybackConnectionOpenResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioplaybackconnection.openasync
     */
    OpenAsync() {
        if (!this.HasProp("__IAudioPlaybackConnection")) {
            if ((queryResult := this.QueryInterface(IAudioPlaybackConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioPlaybackConnection := IAudioPlaybackConnection(outPtr)
        }

        return this.__IAudioPlaybackConnection.OpenAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<AudioPlaybackConnection, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(handler) {
        if (!this.HasProp("__IAudioPlaybackConnection")) {
            if ((queryResult := this.QueryInterface(IAudioPlaybackConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioPlaybackConnection := IAudioPlaybackConnection(outPtr)
        }

        return this.__IAudioPlaybackConnection.add_StateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StateChanged(token) {
        if (!this.HasProp("__IAudioPlaybackConnection")) {
            if ((queryResult := this.QueryInterface(IAudioPlaybackConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioPlaybackConnection := IAudioPlaybackConnection(outPtr)
        }

        return this.__IAudioPlaybackConnection.remove_StateChanged(token)
    }

    /**
     * Closes the connection represented by the [AudioPlaybackConnection](audioplaybackconnection.md) object.
     * @remarks
     * Open a connection by calling [Open](audioplaybackconnection_open_389234318.md) or [OpenAsync](audioplaybackconnection_openasync_171309613.md).
     * 
     * Close an open connection by calling [Close](audioplaybackconnection_close_811482585.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioplaybackconnection.close
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
