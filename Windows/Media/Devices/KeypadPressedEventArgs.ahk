#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKeypadPressedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information for the [KeypadPressed](callcontrol_keypadpressed.md) event.
 * @remarks
 * This object is not instantiated directly, it is returned by the [CallControl.KeypadPressed](callcontrol_keypadpressed.md) event as an argument to the [KeypadPressedEventHandler](keypadpressedeventhandler.md) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.keypadpressedeventargs
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class KeypadPressedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IKeypadPressedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IKeypadPressedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Returns the value of the keypad button on the device that was pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.keypadpressedeventargs.telephonykey
     * @type {Integer} 
     */
    TelephonyKey {
        get => this.get_TelephonyKey()
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
    get_TelephonyKey() {
        if (!this.HasProp("__IKeypadPressedEventArgs")) {
            if ((queryResult := this.QueryInterface(IKeypadPressedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeypadPressedEventArgs := IKeypadPressedEventArgs(outPtr)
        }

        return this.__IKeypadPressedEventArgs.get_TelephonyKey()
    }

;@endregion Instance Methods
}
