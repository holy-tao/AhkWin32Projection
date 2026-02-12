#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxCreateFolderRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a folder creation request event.
 * @remarks
 * Use the instance of this class that is passed as an argument to your [CreateFolderRequested](emaildataproviderconnection_createfolderrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxcreatefolderrequesteventargs
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxCreateFolderRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxCreateFolderRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxCreateFolderRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [EmailMailboxCreateFolderRequest](emailmailboxcreatefolderrequest.md) object that describes the details of this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxcreatefolderrequesteventargs.request
     * @type {EmailMailboxCreateFolderRequest} 
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
     * @returns {EmailMailboxCreateFolderRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IEmailMailboxCreateFolderRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCreateFolderRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCreateFolderRequestEventArgs := IEmailMailboxCreateFolderRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxCreateFolderRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxcreatefolderrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IEmailMailboxCreateFolderRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCreateFolderRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCreateFolderRequestEventArgs := IEmailMailboxCreateFolderRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxCreateFolderRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
