#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactListDeleteContactRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to delete a contact.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistdeletecontactrequesteventargs
 * @namespace Windows.ApplicationModel.Contacts.DataProvider
 * @version WindowsRuntime 1.4
 */
class ContactListDeleteContactRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactListDeleteContactRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactListDeleteContactRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [ContactListDeleteTaskRequest](contactlistdeletecontactrequest.md) object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistdeletecontactrequesteventargs.request
     * @type {ContactListDeleteContactRequest} 
     */
    Request {
        get => this.get_Request()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ContactListDeleteContactRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IContactListDeleteContactRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IContactListDeleteContactRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListDeleteContactRequestEventArgs := IContactListDeleteContactRequestEventArgs(outPtr)
        }

        return this.__IContactListDeleteContactRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistdeletecontactrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IContactListDeleteContactRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IContactListDeleteContactRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListDeleteContactRequestEventArgs := IContactListDeleteContactRequestEventArgs(outPtr)
        }

        return this.__IContactListDeleteContactRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
