#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemMediaTransportControlsButtonPressedEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Provides data for the [SystemMediaTransportControls.ButtonPressed](systemmediatransportcontrols_buttonpressed.md) event.
 * @remarks
 * The [Button](systemmediatransportcontrolsbuttonpressedeventargs_button.md) property indicates which button was pressed.
 * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolsbuttonpressedeventargs
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class SystemMediaTransportControlsButtonPressedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemMediaTransportControlsButtonPressedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemMediaTransportControlsButtonPressedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the button on the [SystemMediaTransportControls](systemmediatransportcontrols.md) that was pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolsbuttonpressedeventargs.button
     * @type {Integer} 
     */
    Button {
        get => this.get_Button()
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
    get_Button() {
        if (!this.HasProp("__ISystemMediaTransportControlsButtonPressedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsButtonPressedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsButtonPressedEventArgs := ISystemMediaTransportControlsButtonPressedEventArgs(outPtr)
        }

        return this.__ISystemMediaTransportControlsButtonPressedEventArgs.get_Button()
    }

;@endregion Instance Methods
}
