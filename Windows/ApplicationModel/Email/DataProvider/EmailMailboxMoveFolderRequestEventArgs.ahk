#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxMoveFolderRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to move a folder.
 * @remarks
 * Use the instance of this class that's passed as an argument to your [MoveFolderRequested](emaildataproviderconnection_movefolderrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxmovefolderrequesteventargs
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxMoveFolderRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxMoveFolderRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxMoveFolderRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [EmailMailboxMoveFolderRequest](emailmailboxmovefolderrequest.md) object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxmovefolderrequesteventargs.request
     * @type {EmailMailboxMoveFolderRequest} 
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
     * @returns {EmailMailboxMoveFolderRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IEmailMailboxMoveFolderRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxMoveFolderRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxMoveFolderRequestEventArgs := IEmailMailboxMoveFolderRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxMoveFolderRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxmovefolderrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IEmailMailboxMoveFolderRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxMoveFolderRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxMoveFolderRequestEventArgs := IEmailMailboxMoveFolderRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxMoveFolderRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
