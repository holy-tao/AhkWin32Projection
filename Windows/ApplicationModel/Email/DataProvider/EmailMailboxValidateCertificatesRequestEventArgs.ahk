#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxValidateCertificatesRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to validate certificates.
 * @remarks
 * Use the instance of this class that's passed as an argument to your [ValidateCertificatesRequested](emaildataproviderconnection_validatecertificatesrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxvalidatecertificatesrequesteventargs
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxValidateCertificatesRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxValidateCertificatesRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxValidateCertificatesRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [EmailMailboxValidateCertificatesRequest](emailmailboxvalidatecertificatesrequest.md) object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxvalidatecertificatesrequesteventargs.request
     * @type {EmailMailboxValidateCertificatesRequest} 
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
     * @returns {EmailMailboxValidateCertificatesRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IEmailMailboxValidateCertificatesRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxValidateCertificatesRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxValidateCertificatesRequestEventArgs := IEmailMailboxValidateCertificatesRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxValidateCertificatesRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxvalidatecertificatesrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IEmailMailboxValidateCertificatesRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxValidateCertificatesRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxValidateCertificatesRequestEventArgs := IEmailMailboxValidateCertificatesRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxValidateCertificatesRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
