#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactBatch.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a group of [Contact](contact.md) objects and server search status.
 * @remarks
 * If you are searching local contacts, keep processing until you get a ContactBatch that has an empty list of [Contacts](contactbatch_contacts.md). If you are searching on a server and you get an empty [Contacts](contactbatch_contacts.md) list, check the [Status](contactbatch_status.md) to make sure there wasn't a server error.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactbatch
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactBatch extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactBatch

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactBatch.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the list of [Contact](contact.md) objects returned by a search operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactbatch.contacts
     * @type {IVectorView<Contact>} 
     */
    Contacts {
        get => this.get_Contacts()
    }

    /**
     * Gets a [ContactBatchStatus](contactbatchstatus.md) value that indicates if a search was successful or if there was a server error.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactbatch.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<Contact>} 
     */
    get_Contacts() {
        if (!this.HasProp("__IContactBatch")) {
            if ((queryResult := this.QueryInterface(IContactBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactBatch := IContactBatch(outPtr)
        }

        return this.__IContactBatch.get_Contacts()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IContactBatch")) {
            if ((queryResult := this.QueryInterface(IContactBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactBatch := IContactBatch(outPtr)
        }

        return this.__IContactBatch.get_Status()
    }

;@endregion Instance Methods
}
