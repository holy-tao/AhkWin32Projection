#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattReadRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This class contains the arguments for the [StateChanged](gattwriterequest_statechanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreadrequestedeventargs
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattReadRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattReadRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattReadRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the session.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreadrequestedeventargs.session
     * @type {GattSession} 
     */
    Session {
        get => this.get_Session()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {GattSession} 
     */
    get_Session() {
        if (!this.HasProp("__IGattReadRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGattReadRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattReadRequestedEventArgs := IGattReadRequestedEventArgs(outPtr)
        }

        return this.__IGattReadRequestedEventArgs.get_Session()
    }

    /**
     * Gets a deferral.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreadrequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IGattReadRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGattReadRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattReadRequestedEventArgs := IGattReadRequestedEventArgs(outPtr)
        }

        return this.__IGattReadRequestedEventArgs.GetDeferral()
    }

    /**
     * Gets the GATT read request.
     * @returns {IAsyncOperation<GattReadRequest>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreadrequestedeventargs.getrequestasync
     */
    GetRequestAsync() {
        if (!this.HasProp("__IGattReadRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGattReadRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattReadRequestedEventArgs := IGattReadRequestedEventArgs(outPtr)
        }

        return this.__IGattReadRequestedEventArgs.GetRequestAsync()
    }

;@endregion Instance Methods
}
