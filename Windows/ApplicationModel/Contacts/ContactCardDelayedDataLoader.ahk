#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactCardDelayedDataLoader.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a delayed data loader for a contact card.
 * @remarks
 * Call [ContactManager.ShowDelayLoadedContactCard](contactmanager_showdelayloadedcontactcard_1685487355.md) to show a contact card with delayed data loader.
 * 
 * For info about how to manage contacts, see [Managing contact cards](/previous-versions/windows/apps/dn518181(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactcarddelayeddataloader
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactCardDelayedDataLoader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactCardDelayedDataLoader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactCardDelayedDataLoader.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Updates the contact card with the [Contact](contact.md) object and completes the contact card UI.
     * @remarks
     * > [!NOTE]
     * > The contact card will time out within four seconds after [ShowDelayLoadedContactCard](contactmanager_showdelayloadedcontactcard_1685487355.md) returns. So, if SetData isn't called within this four second interval, the contact card UI becomes final, and no more updates can be applied. You can call SetData only once and before you call [Close](contactcarddelayeddataloader_close_811482585.md). If you call SetData twice or after [Close](contactcarddelayeddataloader_close_811482585.md), SetData fails with an exception; the **HRESULT** error code is **HRESULT_FROM_WIN32(ERROR_INVALID_STATE)**.
     * 
     * For info about how to manage contacts, see [Contacts and calendar](/windows/uwp/contacts-and-calendar/).
     * @param {Contact} contact_ The contact to update the contact card with.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactcarddelayeddataloader.setdata
     */
    SetData(contact_) {
        if (!this.HasProp("__IContactCardDelayedDataLoader")) {
            if ((queryResult := this.QueryInterface(IContactCardDelayedDataLoader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactCardDelayedDataLoader := IContactCardDelayedDataLoader(outPtr)
        }

        return this.__IContactCardDelayedDataLoader.SetData(contact_)
    }

    /**
     * Closes the delayed data loader. This informs the contact card to complete the UI (for example, remove any progress indications, like the progress bar) because no more updates to the contact card UI will be requested. The user then can determine that the contact data shown in the UI is complete.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactcarddelayeddataloader.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
