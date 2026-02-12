#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRedialRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information for the [RedialRequested](callcontrol_redialrequested.md) event.
 * @remarks
 * This object is not instantiated directly, it is returned by the [CallControl.RedialRequested](callcontrol_redialrequested.md) event as an argument to the [RedialRequestedEventHandler](redialrequestedeventhandler.md) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.redialrequestedeventargs
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class RedialRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRedialRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRedialRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Indicates that the [RedialRequested](callcontrol_redialrequested.md) event has been handled.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.redialrequestedeventargs.handled
     */
    Handled() {
        if (!this.HasProp("__IRedialRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRedialRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRedialRequestedEventArgs := IRedialRequestedEventArgs(outPtr)
        }

        return this.__IRedialRequestedEventArgs.Handled()
    }

;@endregion Instance Methods
}
