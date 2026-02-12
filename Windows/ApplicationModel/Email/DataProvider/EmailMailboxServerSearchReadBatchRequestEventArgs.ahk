#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxServerSearchReadBatchRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to read a batch of results from a server-side search.
 * @remarks
 * Use the instance of this class that's passed as an argument to your [ServerSearchReadBatchRequested](emaildataproviderconnection_serversearchreadbatchrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxserversearchreadbatchrequesteventargs
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxServerSearchReadBatchRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxServerSearchReadBatchRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxServerSearchReadBatchRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [EmailMailboxServerSearchReadBatchRequest](emailmailboxserversearchreadbatchrequest.md) object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxserversearchreadbatchrequesteventargs.request
     * @type {EmailMailboxServerSearchReadBatchRequest} 
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
     * @returns {EmailMailboxServerSearchReadBatchRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IEmailMailboxServerSearchReadBatchRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxServerSearchReadBatchRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxServerSearchReadBatchRequestEventArgs := IEmailMailboxServerSearchReadBatchRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxServerSearchReadBatchRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxserversearchreadbatchrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IEmailMailboxServerSearchReadBatchRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxServerSearchReadBatchRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxServerSearchReadBatchRequestEventArgs := IEmailMailboxServerSearchReadBatchRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxServerSearchReadBatchRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
