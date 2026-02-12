#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactChange.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a change to a [Contact](contact.md).
 * @remarks
 * Call [ContactChangeReader.ReadBatchAsync](contactchangereader_readbatchasync_888788553.md) to get a list of ContactChange objects.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactchange
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactChange extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactChange

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactChange.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates the type of change that occurred.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactchange.changetype
     * @type {Integer} 
     */
    ChangeType {
        get => this.get_ChangeType()
    }

    /**
     * Gets the [Contact](contact.md) object that changed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactchange.contact
     * @type {Contact} 
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
     * 
     * @returns {Integer} 
     */
    get_ChangeType() {
        if (!this.HasProp("__IContactChange")) {
            if ((queryResult := this.QueryInterface(IContactChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactChange := IContactChange(outPtr)
        }

        return this.__IContactChange.get_ChangeType()
    }

    /**
     * 
     * @returns {Contact} 
     */
    get_Contact() {
        if (!this.HasProp("__IContactChange")) {
            if ((queryResult := this.QueryInterface(IContactChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactChange := IContactChange(outPtr)
        }

        return this.__IContactChange.get_Contact()
    }

;@endregion Instance Methods
}
