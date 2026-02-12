#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMiracastReceiverConnection.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a single connection between a Miracast Receiver and a Miracast Transmitter.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverconnection
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverConnection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMiracastReceiverConnection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMiracastReceiverConnection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an [MiracastTransmitter](miracasttransmitter.md) object representing the Miracast Transmitter that initiated the connection.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverconnection.transmitter
     * @type {MiracastTransmitter} 
     */
    Transmitter {
        get => this.get_Transmitter()
    }

    /**
     * Gets the devices from which the Miracast Receiver can collect input and transmit to the Miracast Transmitter.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverconnection.inputdevices
     * @type {MiracastReceiverInputDevices} 
     */
    InputDevices {
        get => this.get_InputDevices()
    }

    /**
     * Gets the channel for transmitting mouse cursor images from a Miracast Transmitter to a Miracast Receiver.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverconnection.cursorimagechannel
     * @type {MiracastReceiverCursorImageChannel} 
     */
    CursorImageChannel {
        get => this.get_CursorImageChannel()
    }

    /**
     * Gets a [MiracastReceiverStreamControl](miracastreceiverstreamcontrol.md) object, which is used for controlling properties of the audio and video streams.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverconnection.streamcontrol
     * @type {MiracastReceiverStreamControl} 
     */
    StreamControl {
        get => this.get_StreamControl()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Closes the connection and immediately disconnects the connected [MiracastTransmitter](miracasttransmitter.md).
     * @param {Integer} reason A value from the [MiracastReceiverDisconnectReason](miracastreceiverdisconnectreason.md) enumeration specifying the reason for disconnecting the Miracast Transmitter.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverconnection.disconnect
     */
    Disconnect(reason) {
        if (!this.HasProp("__IMiracastReceiverConnection")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverConnection := IMiracastReceiverConnection(outPtr)
        }

        return this.__IMiracastReceiverConnection.Disconnect(reason)
    }

    /**
     * Closes the connection and immediately disconnects the connected [MiracastTransmitter](miracasttransmitter.md).
     * @remarks
     * The value of the message parameter is not necessarily displayed to the user but can assist in analyzing the cause of session disconnect.
     * @param {Integer} reason A value from the [MiracastReceiverDisconnectReason](miracastreceiverdisconnectreason.md) enumeration specifying the reason for disconnecting the Miracast Transmitter.
     * @param {HSTRING} message A human-readable message, stating a reason for disconnecting the Miracast Transmitter.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverconnection.disconnect
     */
    DisconnectWithMessage(reason, message) {
        if (!this.HasProp("__IMiracastReceiverConnection")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverConnection := IMiracastReceiverConnection(outPtr)
        }

        return this.__IMiracastReceiverConnection.DisconnectWithMessage(reason, message)
    }

    /**
     * Requests the Miracast Transmitter to pause streaming audio and video data to the Receiver. The connection remains established.
     * @remarks
     * Because this method may block for a noticeable period of time, you should not call it from the UI thread or from a single-threaded apartment. Instead, use the asyncronous method [PauseAsync](miracastreceiverconnection_pauseasync_576113822.md).
     * 
     * Use [Resume](miracastreceiverconnection_resume_406343050.md) or [ResumeAsync](miracastreceiverconnection_resumeasync_801976564.md) to instruct the Miracast Transmitter to resume streaming.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverconnection.pause
     */
    Pause() {
        if (!this.HasProp("__IMiracastReceiverConnection")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverConnection := IMiracastReceiverConnection(outPtr)
        }

        return this.__IMiracastReceiverConnection.Pause()
    }

    /**
     * Asynchronously requests the Miracast Transmitter to pause streaming audio and video data to the Receiver. The connection remains established.
     * @remarks
     * Use [Resume](miracastreceiverconnection_resume_406343050.md) or [ResumeAsync](miracastreceiverconnection_resumeasync_801976564.md) to instruct the Miracast Transmitter to resume streaming.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverconnection.pauseasync
     */
    PauseAsync() {
        if (!this.HasProp("__IMiracastReceiverConnection")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverConnection := IMiracastReceiverConnection(outPtr)
        }

        return this.__IMiracastReceiverConnection.PauseAsync()
    }

    /**
     * Requests the Miracast Transmitter to resume streaming audio and video data to the [MiracastReceiver](miracastreceiver.md).
     * @remarks
     * Because this method may block for a noticeable period of time, you should not call it from the UI thread or from a single-threaded apartment. Instead, use the asyncronous method [ResumeAsync](miracastreceiverconnection_resumeasync_801976564.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverconnection.resume
     */
    Resume() {
        if (!this.HasProp("__IMiracastReceiverConnection")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverConnection := IMiracastReceiverConnection(outPtr)
        }

        return this.__IMiracastReceiverConnection.Resume()
    }

    /**
     * Requests the Miracast Transmitter to resume streaming audio and video data to the [MiracastReceiver](miracastreceiver.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverconnection.resumeasync
     */
    ResumeAsync() {
        if (!this.HasProp("__IMiracastReceiverConnection")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverConnection := IMiracastReceiverConnection(outPtr)
        }

        return this.__IMiracastReceiverConnection.ResumeAsync()
    }

    /**
     * 
     * @returns {MiracastTransmitter} 
     */
    get_Transmitter() {
        if (!this.HasProp("__IMiracastReceiverConnection")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverConnection := IMiracastReceiverConnection(outPtr)
        }

        return this.__IMiracastReceiverConnection.get_Transmitter()
    }

    /**
     * 
     * @returns {MiracastReceiverInputDevices} 
     */
    get_InputDevices() {
        if (!this.HasProp("__IMiracastReceiverConnection")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverConnection := IMiracastReceiverConnection(outPtr)
        }

        return this.__IMiracastReceiverConnection.get_InputDevices()
    }

    /**
     * 
     * @returns {MiracastReceiverCursorImageChannel} 
     */
    get_CursorImageChannel() {
        if (!this.HasProp("__IMiracastReceiverConnection")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverConnection := IMiracastReceiverConnection(outPtr)
        }

        return this.__IMiracastReceiverConnection.get_CursorImageChannel()
    }

    /**
     * 
     * @returns {MiracastReceiverStreamControl} 
     */
    get_StreamControl() {
        if (!this.HasProp("__IMiracastReceiverConnection")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverConnection := IMiracastReceiverConnection(outPtr)
        }

        return this.__IMiracastReceiverConnection.get_StreamControl()
    }

    /**
     * Closes the connection and immediately disconnects the associated [MiracastTransmitter](miracasttransmitter.md) from this connection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverconnection.close
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
