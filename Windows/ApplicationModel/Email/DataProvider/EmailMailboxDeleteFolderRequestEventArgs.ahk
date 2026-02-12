#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxDeleteFolderRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapusulates information about a folder deletion request event.
 * @remarks
 * Use the instance of this class that is passed as an argument to your [DeleteFolderRequested](emaildataproviderconnection_deletefolderrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdeletefolderrequesteventargs
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxDeleteFolderRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxDeleteFolderRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxDeleteFolderRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [EmailMailboxDeleteFolderRequest](emailmailboxdeletefolderrequest.md) object that describes the details of this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdeletefolderrequesteventargs.request
     * @type {EmailMailboxDeleteFolderRequest} 
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
     * @returns {EmailMailboxDeleteFolderRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IEmailMailboxDeleteFolderRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxDeleteFolderRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxDeleteFolderRequestEventArgs := IEmailMailboxDeleteFolderRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxDeleteFolderRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdeletefolderrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IEmailMailboxDeleteFolderRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxDeleteFolderRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxDeleteFolderRequestEventArgs := IEmailMailboxDeleteFolderRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxDeleteFolderRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
