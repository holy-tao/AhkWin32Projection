#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbInterruptInEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the object that is passed as a parameter to the event handler for the [DataReceived](usbinterruptinpipe_datareceived.md) event.
 * @remarks
 * UsbInterruptInEventArgs is used to access data from an interrupt IN pipe. When data arrives in an interrupt IN pipe, it raises the [DataReceived](usbinterruptinpipe_datareceived.md) event. You must register an event handler for the event. That event handler's parameter is a UsbInterruptInEventArgs object. After the event handler is invoked, you can access the data by using the [InterruptData](usbinterruptineventargs_interruptdata.md) property. 
 * 
 * 
 * 
 * ```
 * function onDataReceived(eventArgs) 
 * { 
 *     // Your code  
 *     var interruptData = eventArgs.interruptData;
 * }
 * 
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterruptineventargs
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbInterruptInEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbInterruptInEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbInterruptInEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets data from the interrupt IN endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterruptineventargs.interruptdata
     * @type {IBuffer} 
     */
    InterruptData {
        get => this.get_InterruptData()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_InterruptData() {
        if (!this.HasProp("__IUsbInterruptInEventArgs")) {
            if ((queryResult := this.QueryInterface(IUsbInterruptInEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterruptInEventArgs := IUsbInterruptInEventArgs(outPtr)
        }

        return this.__IUsbInterruptInEventArgs.get_InterruptData()
    }

;@endregion Instance Methods
}
