#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IErrorReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the object that is passed as a parameter to the event handler that is invoked when error occurs on the serial port.
 * @remarks
 * ErrorReceivedEventArgs is used to determine the type of error condition. When error occurs on the port, the previously registered [ErrorReceived](serialdevice_errorreceived.md) event handler is invoked. That event handler's parameter is a ErrorReceivedEventArgs object. After the event handler is invoked, you can determine the error condition by using the [Error](serialerror.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.errorreceivedeventargs
 * @namespace Windows.Devices.SerialCommunication
 * @version WindowsRuntime 1.4
 */
class ErrorReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IErrorReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IErrorReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the character type received that caused the event on the serial port.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.errorreceivedeventargs.error
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
    get_Error() {
        if (!this.HasProp("__IErrorReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IErrorReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IErrorReceivedEventArgs := IErrorReceivedEventArgs(outPtr)
        }

        return this.__IErrorReceivedEventArgs.get_Error()
    }

;@endregion Instance Methods
}
