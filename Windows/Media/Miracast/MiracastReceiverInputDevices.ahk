#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMiracastReceiverInputDevices.ahk
#Include ..\..\..\Guid.ahk

/**
 * The devices from which the Miracast Receiver can collect input and transmit to the Miracast Transmitter.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverinputdevices
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverInputDevices extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMiracastReceiverInputDevices

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMiracastReceiverInputDevices.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Returns a Keyboard input device for use with Miracast.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverinputdevices.keyboard
     * @type {MiracastReceiverKeyboardDevice} 
     */
    Keyboard {
        get => this.get_Keyboard()
    }

    /**
     * Returns a Game Controller input device for use with Miracast, such as a gamepad, joystick, or steering wheel.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverinputdevices.gamecontroller
     * @type {MiracastReceiverGameControllerDevice} 
     */
    GameController {
        get => this.get_GameController()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MiracastReceiverKeyboardDevice} 
     */
    get_Keyboard() {
        if (!this.HasProp("__IMiracastReceiverInputDevices")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverInputDevices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverInputDevices := IMiracastReceiverInputDevices(outPtr)
        }

        return this.__IMiracastReceiverInputDevices.get_Keyboard()
    }

    /**
     * 
     * @returns {MiracastReceiverGameControllerDevice} 
     */
    get_GameController() {
        if (!this.HasProp("__IMiracastReceiverInputDevices")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverInputDevices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverInputDevices := IMiracastReceiverInputDevices(outPtr)
        }

        return this.__IMiracastReceiverInputDevices.get_GameController()
    }

;@endregion Instance Methods
}
