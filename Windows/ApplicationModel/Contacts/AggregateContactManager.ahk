#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAggregateContactManager.ahk
#Include .\IAggregateContactManager2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for linking individual (raw) contacts across services together into a single aggregate contact.
 * @remarks
 * All relevant methods of this class are static methods.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.aggregatecontactmanager
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class AggregateContactManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAggregateContactManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAggregateContactManager.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns the list of individual (raw) contacts from the specified aggregate contact.
     * @param {Contact} contact_ The aggregate contact from which to extract the list of raw contacts.
     * @returns {IAsyncOperation<IVectorView<Contact>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.aggregatecontactmanager.findrawcontactsasync
     */
    FindRawContactsAsync(contact_) {
        if (!this.HasProp("__IAggregateContactManager")) {
            if ((queryResult := this.QueryInterface(IAggregateContactManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAggregateContactManager := IAggregateContactManager(outPtr)
        }

        return this.__IAggregateContactManager.FindRawContactsAsync(contact_)
    }

    /**
     * Asynchronously attempts to link contacts together to make an aggregate contact.
     * @remarks
     * The *primaryContact* and *secondaryContact* objects can be any combination of raw and aggregate contacts.
     * @param {Contact} primaryContact The first contact to link.
     * @param {Contact} secondaryContact The second contact to link to the *primaryContact*.
     * @returns {IAsyncOperation<Contact>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.aggregatecontactmanager.trylinkcontactsasync
     */
    TryLinkContactsAsync(primaryContact, secondaryContact) {
        if (!this.HasProp("__IAggregateContactManager")) {
            if ((queryResult := this.QueryInterface(IAggregateContactManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAggregateContactManager := IAggregateContactManager(outPtr)
        }

        return this.__IAggregateContactManager.TryLinkContactsAsync(primaryContact, secondaryContact)
    }

    /**
     * Asynchronously unlinks a raw contact from the parent aggregate contact.
     * @param {Contact} contact_ The raw contact to remove from the aggregate.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.aggregatecontactmanager.unlinkrawcontactasync
     */
    UnlinkRawContactAsync(contact_) {
        if (!this.HasProp("__IAggregateContactManager")) {
            if ((queryResult := this.QueryInterface(IAggregateContactManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAggregateContactManager := IAggregateContactManager(outPtr)
        }

        return this.__IAggregateContactManager.UnlinkRawContactAsync(contact_)
    }

    /**
     * Chooses which of the raw contacts provides the main display picture for the aggregate.
     * @param {Contact} aggregateContact The aggregate contact on which to set the picture.
     * @param {Contact} rawContact The raw contact that provides the picture for the aggregate.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.aggregatecontactmanager.trysetpreferredsourceforpictureasync
     */
    TrySetPreferredSourceForPictureAsync(aggregateContact, rawContact) {
        if (!this.HasProp("__IAggregateContactManager")) {
            if ((queryResult := this.QueryInterface(IAggregateContactManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAggregateContactManager := IAggregateContactManager(outPtr)
        }

        return this.__IAggregateContactManager.TrySetPreferredSourceForPictureAsync(aggregateContact, rawContact)
    }

    /**
     * Sets the identifier that specifies the remote contacts to link together with the contact data on your device.
     * @param {HSTRING} contactListId The remote contact list identifier.
     * @param {HSTRING} remoteSourceId The identifier for the remote service, for example, "EXCH" for exchange accounts.
     * @param {HSTRING} accountId The unique roaming identifier of the account for the network.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.aggregatecontactmanager.setremoteidentificationinformationasync
     */
    SetRemoteIdentificationInformationAsync(contactListId, remoteSourceId, accountId) {
        if (!this.HasProp("__IAggregateContactManager2")) {
            if ((queryResult := this.QueryInterface(IAggregateContactManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAggregateContactManager2 := IAggregateContactManager2(outPtr)
        }

        return this.__IAggregateContactManager2.SetRemoteIdentificationInformationAsync(contactListId, remoteSourceId, accountId)
    }

;@endregion Instance Methods
}
