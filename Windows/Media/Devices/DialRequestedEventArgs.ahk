#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDialRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information for the [DialRequested](callcontrol_dialrequested.md) event.
 * @remarks
 * This object is not instantiated directly, it is returned by the [CallControl.DialRequested](callcontrol_dialrequested.md) event as an argument to the [DialRequestedEventHandler](dialrequestedeventhandler.md) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.dialrequestedeventargs
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class DialRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDialRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDialRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Returns the contact that was dialed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.dialrequestedeventargs.contact
     * @type {IInspectable} 
     */
    Contact {
        get => this.get_Contact()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Indicates that the [DialRequested](callcontrol_dialrequested.md) event has been handled.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.dialrequestedeventargs.handled
     */
    Handled() {
        if (!this.HasProp("__IDialRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDialRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialRequestedEventArgs := IDialRequestedEventArgs(outPtr)
        }

        return this.__IDialRequestedEventArgs.Handled()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Contact() {
        if (!this.HasProp("__IDialRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDialRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialRequestedEventArgs := IDialRequestedEventArgs(outPtr)
        }

        return this.__IDialRequestedEventArgs.get_Contact()
    }

;@endregion Instance Methods
}
