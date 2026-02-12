#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattRequestStateChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This class defines arguments of [StateChanged](gattreadrequest_statechanged.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattrequeststatechangedeventargs
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattRequestStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattRequestStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattRequestStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the state of the read request.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattrequeststatechangedeventargs.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets the Bluetooth error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattrequeststatechangedeventargs.error
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
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
    get_State() {
        if (!this.HasProp("__IGattRequestStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGattRequestStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattRequestStateChangedEventArgs := IGattRequestStateChangedEventArgs(outPtr)
        }

        return this.__IGattRequestStateChangedEventArgs.get_State()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Error() {
        if (!this.HasProp("__IGattRequestStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGattRequestStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattRequestStateChangedEventArgs := IGattRequestStateChangedEventArgs(outPtr)
        }

        return this.__IGattRequestStateChangedEventArgs.get_Error()
    }

;@endregion Instance Methods
}
