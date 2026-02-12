#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactListServerSearchReadBatchRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to read a batch of results from a server-side search.
 * @remarks
 * Use the instance of this class that's passed as an argument to your [ServerSearchReadBatchRequested](contactdataproviderconnection_serversearchreadbatchrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistserversearchreadbatchrequesteventargs
 * @namespace Windows.ApplicationModel.Contacts.DataProvider
 * @version WindowsRuntime 1.4
 */
class ContactListServerSearchReadBatchRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactListServerSearchReadBatchRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactListServerSearchReadBatchRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [ContactListServerSearchReadBatchRequest](contactlistserversearchreadbatchrequest.md) object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistserversearchreadbatchrequesteventargs.request
     * @type {ContactListServerSearchReadBatchRequest} 
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
     * @returns {ContactListServerSearchReadBatchRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IContactListServerSearchReadBatchRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IContactListServerSearchReadBatchRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListServerSearchReadBatchRequestEventArgs := IContactListServerSearchReadBatchRequestEventArgs(outPtr)
        }

        return this.__IContactListServerSearchReadBatchRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistserversearchreadbatchrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IContactListServerSearchReadBatchRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IContactListServerSearchReadBatchRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListServerSearchReadBatchRequestEventArgs := IContactListServerSearchReadBatchRequestEventArgs(outPtr)
        }

        return this.__IContactListServerSearchReadBatchRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
