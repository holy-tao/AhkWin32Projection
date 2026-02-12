#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactListSyncManagerSyncRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to sync a contact list.
 * @remarks
 * Use the instance of this class that's passed as an argument to your [SyncRequested](contactdataproviderconnection_syncrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistsyncmanagersyncrequesteventargs
 * @namespace Windows.ApplicationModel.Contacts.DataProvider
 * @version WindowsRuntime 1.4
 */
class ContactListSyncManagerSyncRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactListSyncManagerSyncRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactListSyncManagerSyncRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [ContactListSyncManagerSyncRequest](contactlistsyncmanagersyncrequest.md) object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistsyncmanagersyncrequesteventargs.request
     * @type {ContactListSyncManagerSyncRequest} 
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
     * @returns {ContactListSyncManagerSyncRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IContactListSyncManagerSyncRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IContactListSyncManagerSyncRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncManagerSyncRequestEventArgs := IContactListSyncManagerSyncRequestEventArgs(outPtr)
        }

        return this.__IContactListSyncManagerSyncRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistsyncmanagersyncrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IContactListSyncManagerSyncRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IContactListSyncManagerSyncRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncManagerSyncRequestEventArgs := IContactListSyncManagerSyncRequestEventArgs(outPtr)
        }

        return this.__IContactListSyncManagerSyncRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
