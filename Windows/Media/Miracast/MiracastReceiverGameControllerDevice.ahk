#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMiracastReceiverGameControllerDevice.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MiracastReceiverGameControllerDevice.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a Game Controller input device for use with Miracast, such as a gamepad, joystick, or steering wheel.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivergamecontrollerdevice
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverGameControllerDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMiracastReceiverGameControllerDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMiracastReceiverGameControllerDevice.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Controls if the Miracast Receiver offers to transmit game controller input to the Miracast Transmitter.
     * @remarks
     * Game controller input will only be transmitted if the device on which the Miracast Receiver is running supports capturing game controller input, and if the Miracast Transmitter is requesting to receive game controller input.
     * Use [IsTransmittingInput](miracastreceivergamecontrollerdevice_istransmittinginput.md) to determine if game controller input is actually being transmitted.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivergamecontrollerdevice.transmitinput
     * @type {Boolean} 
     */
    TransmitInput {
        get => this.get_TransmitInput()
        set => this.put_TransmitInput(value)
    }

    /**
     * Indicates if the Miracast Transmitter is willing to receive input from a game controller device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivergamecontrollerdevice.isrequestedbytransmitter
     * @type {Boolean} 
     */
    IsRequestedByTransmitter {
        get => this.get_IsRequestedByTransmitter()
    }

    /**
     * Indicates if the Miracast Receiver is currently transmitting input from a game controller device to the Miracast Transmitter.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivergamecontrollerdevice.istransmittinginput
     * @type {Boolean} 
     */
    IsTransmittingInput {
        get => this.get_IsTransmittingInput()
    }

    /**
     * Specifies how game controller input is being used when transmitted to a Miracast Transmitter. Game controller input can be transmitted as-is, or it can be mapped to mouse and keyboard input.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivergamecontrollerdevice.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * An event which is raised when any of the properties on the MiracastReceiverGameControllerDevice has changed.
     * @type {TypedEventHandler<MiracastReceiverGameControllerDevice, IInspectable>}
    */
    OnChanged {
        get {
            if(!this.HasProp("__OnChanged")){
                this.__OnChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{10a9d2a7-5049-5e19-9d22-72da7d6bb643}"),
                    MiracastReceiverGameControllerDevice,
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
        if (!this.HasProp("__IMiracastReceiverGameControllerDevice")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverGameControllerDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverGameControllerDevice := IMiracastReceiverGameControllerDevice(outPtr)
        }

        return this.__IMiracastReceiverGameControllerDevice.get_TransmitInput()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_TransmitInput(value) {
        if (!this.HasProp("__IMiracastReceiverGameControllerDevice")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverGameControllerDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverGameControllerDevice := IMiracastReceiverGameControllerDevice(outPtr)
        }

        return this.__IMiracastReceiverGameControllerDevice.put_TransmitInput(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRequestedByTransmitter() {
        if (!this.HasProp("__IMiracastReceiverGameControllerDevice")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverGameControllerDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverGameControllerDevice := IMiracastReceiverGameControllerDevice(outPtr)
        }

        return this.__IMiracastReceiverGameControllerDevice.get_IsRequestedByTransmitter()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTransmittingInput() {
        if (!this.HasProp("__IMiracastReceiverGameControllerDevice")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverGameControllerDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverGameControllerDevice := IMiracastReceiverGameControllerDevice(outPtr)
        }

        return this.__IMiracastReceiverGameControllerDevice.get_IsTransmittingInput()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__IMiracastReceiverGameControllerDevice")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverGameControllerDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverGameControllerDevice := IMiracastReceiverGameControllerDevice(outPtr)
        }

        return this.__IMiracastReceiverGameControllerDevice.get_Mode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mode(value) {
        if (!this.HasProp("__IMiracastReceiverGameControllerDevice")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverGameControllerDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverGameControllerDevice := IMiracastReceiverGameControllerDevice(outPtr)
        }

        return this.__IMiracastReceiverGameControllerDevice.put_Mode(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MiracastReceiverGameControllerDevice, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Changed(handler) {
        if (!this.HasProp("__IMiracastReceiverGameControllerDevice")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverGameControllerDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverGameControllerDevice := IMiracastReceiverGameControllerDevice(outPtr)
        }

        return this.__IMiracastReceiverGameControllerDevice.add_Changed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Changed(token) {
        if (!this.HasProp("__IMiracastReceiverGameControllerDevice")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverGameControllerDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverGameControllerDevice := IMiracastReceiverGameControllerDevice(outPtr)
        }

        return this.__IMiracastReceiverGameControllerDevice.remove_Changed(token)
    }

;@endregion Instance Methods
}
