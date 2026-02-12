#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactRemovedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains info about a removed contact. Returned when a [ContactRemoved](contactpickerui_contactremoved.md) event occurs.
 * @remarks
 * Your app gets a **ContactRemovedEventArgs** object when the [ContactRemoved](contactpickerui_contactremoved.md) event occurs.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.provider.contactremovedeventargs
 * @namespace Windows.ApplicationModel.Contacts.Provider
 * @version WindowsRuntime 1.4
 */
class ContactRemovedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactRemovedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactRemovedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Contains a unique identifier for the contact.
     * @remarks
     * When you work with contacts, you must supply an ID property for each contact. The value of this property can be whatever makes the most sense for your app, but it must enable you to uniquely identify each contact. Actions like removing a contact depend on this ID value to ensure that the correct contact is removed. For a complete example, see our [code sample](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/ContactPicker).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.provider.contactremovedeventargs.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IContactRemovedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContactRemovedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactRemovedEventArgs := IContactRemovedEventArgs(outPtr)
        }

        return this.__IContactRemovedEventArgs.get_Id()
    }

;@endregion Instance Methods
}
