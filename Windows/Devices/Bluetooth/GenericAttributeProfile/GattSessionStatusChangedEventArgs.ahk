#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattSessionStatusChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This class represents the [SessionStatusChanged](gattsession_sessionstatuschanged.md) event args.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsessionstatuschangedeventargs
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattSessionStatusChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattSessionStatusChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattSessionStatusChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the error of the GATT session.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsessionstatuschangedeventargs.error
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * Gets the status of the GATT session.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsessionstatuschangedeventargs.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
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
    get_Error() {
        if (!this.HasProp("__IGattSessionStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGattSessionStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattSessionStatusChangedEventArgs := IGattSessionStatusChangedEventArgs(outPtr)
        }

        return this.__IGattSessionStatusChangedEventArgs.get_Error()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IGattSessionStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGattSessionStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattSessionStatusChangedEventArgs := IGattSessionStatusChangedEventArgs(outPtr)
        }

        return this.__IGattSessionStatusChangedEventArgs.get_Status()
    }

;@endregion Instance Methods
}
