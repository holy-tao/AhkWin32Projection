#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxEmptyFolderRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to empty a folder.
 * @remarks
 * Use the instance of this class that is passed as an argument to your [EmptyFolderRequested](emaildataproviderconnection_emptyfolderrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxemptyfolderrequesteventargs
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxEmptyFolderRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxEmptyFolderRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxEmptyFolderRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [EmailMailboxEmptyFolderRequest](emailmailboxemptyfolderrequest.md) object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxemptyfolderrequesteventargs.request
     * @type {EmailMailboxEmptyFolderRequest} 
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
     * @returns {EmailMailboxEmptyFolderRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IEmailMailboxEmptyFolderRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxEmptyFolderRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxEmptyFolderRequestEventArgs := IEmailMailboxEmptyFolderRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxEmptyFolderRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxemptyfolderrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IEmailMailboxEmptyFolderRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxEmptyFolderRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxEmptyFolderRequestEventArgs := IEmailMailboxEmptyFolderRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxEmptyFolderRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
