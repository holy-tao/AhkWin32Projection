#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [ContactChanged](contactstore_contactchanged.md) event.
 * @remarks
 * This class is instantiated by the system and passed as an argument to the [ContactChanged](contactstore_contactchanged.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactchangedeventargs
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the [ContactChangedDeferral](contactchangeddeferral.md) object to use for asynchronous operations.
     * @returns {ContactChangedDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactchangedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IContactChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContactChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactChangedEventArgs := IContactChangedEventArgs(outPtr)
        }

        return this.__IContactChangedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
