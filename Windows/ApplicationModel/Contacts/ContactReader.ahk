#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactReader.ahk
#Include ..\..\..\Guid.ahk

/**
 * Used to read [Contact](contact.md) objects in batches from the [ContactStore](contactstore.md) which may be local or remotely located.
 * @remarks
 * Use [GetContactReader](contactstore_getcontactreader_1793921473.md) or [GetContactReader(ContactQueryOptions)](contactstore_getcontactreader_1032732501.md) to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactreader
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactReader.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Asynchronously reads a batch of [Contact](contact.md) objects from the [ContactStore](contactstore.md).
     * @returns {IAsyncOperation<ContactBatch>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactreader.readbatchasync
     */
    ReadBatchAsync() {
        if (!this.HasProp("__IContactReader")) {
            if ((queryResult := this.QueryInterface(IContactReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactReader := IContactReader(outPtr)
        }

        return this.__IContactReader.ReadBatchAsync()
    }

    /**
     * Gets the reason a [Contact](contact.md) matched the search query. Returns the properties and substrings that match.
     * @remarks
     * These results can be used for hit highlighting.
     * @param {Contact} contact_ The [Contact](contact.md) for which to get the matching properties.
     * @returns {IVectorView<ContactMatchReason>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactreader.getmatchingpropertieswithmatchreason
     */
    GetMatchingPropertiesWithMatchReason(contact_) {
        if (!this.HasProp("__IContactReader")) {
            if ((queryResult := this.QueryInterface(IContactReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactReader := IContactReader(outPtr)
        }

        return this.__IContactReader.GetMatchingPropertiesWithMatchReason(contact_)
    }

;@endregion Instance Methods
}
