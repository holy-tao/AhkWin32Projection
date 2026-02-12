#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMiracastReceiverKeyboardDevice.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MiracastReceiverKeyboardDevice.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * A Keyboard input device for use with Miracast.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverkeyboarddevice
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverKeyboardDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMiracastReceiverKeyboardDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMiracastReceiverKeyboardDevice.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Controls if the Miracast Receiver offers to transmit keyboard input to the Miracast Transmitter.
     * @remarks
     * Keyboard input will only be transmitted if the device on which the Miracast Receiver is running supports capturing keyboard input, and if the Miracast Transmitter is requesting to receive keyboard input.
     * Use [IsTransmittingInput](miracastreceiverkeyboarddevice_istransmittinginput.md) to determine if keyboard input is actually being transmitted.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverkeyboarddevice.transmitinput
     * @type {Boolean} 
     */
    TransmitInput {
        get => this.get_TransmitInput()
        set => this.put_TransmitInput(value)
    }

    /**
     * Indicates if the Miracast Transmitter is willing to receive input from a keyboard device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverkeyboarddevice.isrequestedbytransmitter
     * @type {Boolean} 
     */
    IsRequestedByTransmitter {
        get => this.get_IsRequestedByTransmitter()
    }

    /**
     * Indicates if the Miracast Receiver is currently transmitting input from a keyboard device to the Miracast Transmitter.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverkeyboarddevice.istransmittinginput
     * @type {Boolean} 
     */
    IsTransmittingInput {
        get => this.get_IsTransmittingInput()
    }

    /**
     * An event which is raised when any of the properties on the MiracastReceiverKeyboardDevice has changed.
     * @type {TypedEventHandler<MiracastReceiverKeyboardDevice, IInspectable>}
    */
    OnChanged {
        get {
            if(!this.HasProp("__OnChanged")){
                this.__OnChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{97d896c7-a5ea-5209-92c0-a0278087afd1}"),
                    MiracastReceiverKeyboardDevice,
                    IInspectable
                )
                this.__OnChangedToken := this.add_Changed(this.__OnChanged.iface)
            }
            return this.__OnChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnChangedToken")) {
            this.remove_Changed(this.__OnChangedToken)
            this.__OnChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_TransmitInput() {
        if (!this.HasProp("__IMiracastReceiverKeyboardDevice")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverKeyboardDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverKeyboardDevice := IMiracastReceiverKeyboardDevice(outPtr)
        }

        return this.__IMiracastReceiverKeyboardDevice.get_TransmitInput()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_TransmitInput(value) {
        if (!this.HasProp("__IMiracastReceiverKeyboardDevice")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverKeyboardDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverKeyboardDevice := IMiracastReceiverKeyboardDevice(outPtr)
        }

        return this.__IMiracastReceiverKeyboardDevice.put_TransmitInput(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRequestedByTransmitter() {
        if (!this.HasProp("__IMiracastReceiverKeyboardDevice")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverKeyboardDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverKeyboardDevice := IMiracastReceiverKeyboardDevice(outPtr)
        }

        return this.__IMiracastReceiverKeyboardDevice.get_IsRequestedByTransmitter()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTransmittingInput() {
        if (!this.HasProp("__IMiracastReceiverKeyboardDevice")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverKeyboardDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverKeyboardDevice := IMiracastReceiverKeyboardDevice(outPtr)
        }

        return this.__IMiracastReceiverKeyboardDevice.get_IsTransmittingInput()
    }

    /**
     * 
     * @param {TypedEventHandler<MiracastReceiverKeyboardDevice, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Changed(handler) {
        if (!this.HasProp("__IMiracastReceiverKeyboardDevice")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverKeyboardDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverKeyboardDevice := IMiracastReceiverKeyboardDevice(outPtr)
        }

        return this.__IMiracastReceiverKeyboardDevice.add_Changed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Changed(token) {
        if (!this.HasProp("__IMiracastReceiverKeyboardDevice")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverKeyboardDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverKeyboardDevice := IMiracastReceiverKeyboardDevice(outPtr)
        }

        return this.__IMiracastReceiverKeyboardDevice.remove_Changed(token)
    }

;@endregion Instance Methods
}
