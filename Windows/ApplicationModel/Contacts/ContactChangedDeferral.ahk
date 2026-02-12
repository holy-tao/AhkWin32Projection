#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactChangedDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * The deferral object to use while asynchronously processing [ContactChanged](contactstore_contactchanged.md) events.
 * @remarks
 * Call [GetDeferral](contactchangedeventargs_getdeferral_254836512.md) to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactchangeddeferral
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactChangedDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactChangedDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactChangedDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Call this method in order to release the deferral object when all asynchronous processing has finished.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactchangeddeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IContactChangedDeferral")) {
            if ((queryResult := this.QueryInterface(IContactChangedDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactChangedDeferral := IContactChangedDeferral(outPtr)
        }

        return this.__IContactChangedDeferral.Complete()
    }

;@endregion Instance Methods
}
