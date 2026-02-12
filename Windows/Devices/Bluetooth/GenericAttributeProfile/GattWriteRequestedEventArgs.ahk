#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattWriteRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This class represents the event args for [WriteRequested](gattlocalcharacteristic_writerequested.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattwriterequestedeventargs
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattWriteRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattWriteRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattWriteRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the session.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattwriterequestedeventargs.session
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
        if (!this.HasProp("__IGattWriteRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGattWriteRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattWriteRequestedEventArgs := IGattWriteRequestedEventArgs(outPtr)
        }

        return this.__IGattWriteRequestedEventArgs.get_Session()
    }

    /**
     * Gets a deferral.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattwriterequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IGattWriteRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGattWriteRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattWriteRequestedEventArgs := IGattWriteRequestedEventArgs(outPtr)
        }

        return this.__IGattWriteRequestedEventArgs.GetDeferral()
    }

    /**
     * Gets the write request.
     * @returns {IAsyncOperation<GattWriteRequest>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattwriterequestedeventargs.getrequestasync
     */
    GetRequestAsync() {
        if (!this.HasProp("__IGattWriteRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGattWriteRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattWriteRequestedEventArgs := IGattWriteRequestedEventArgs(outPtr)
        }

        return this.__IGattWriteRequestedEventArgs.GetRequestAsync()
    }

;@endregion Instance Methods
}
