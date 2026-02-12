#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxValidateCertificatesRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request to validate certificates.
 * @remarks
 * Used in your [ValidateCertificatesRequested](emaildataproviderconnection_validatecertificatesrequested.md) event handler. Use the instance of this class that's returned by the [EmailMailboxValidateCertificatesRequestEventArgs.Request](emailmailboxvalidatecertificatesrequesteventargs_request.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxvalidatecertificatesrequest
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxValidateCertificatesRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxValidateCertificatesRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxValidateCertificatesRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the mailbox ID against which the certificates are to be validated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxvalidatecertificatesrequest.emailmailboxid
     * @type {HSTRING} 
     */
    EmailMailboxId {
        get => this.get_EmailMailboxId()
    }

    /**
     * Gets the list of certificates to be validated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxvalidatecertificatesrequest.certificates
     * @type {IVectorView<Certificate>} 
     */
    Certificates {
        get => this.get_Certificates()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EmailMailboxId() {
        if (!this.HasProp("__IEmailMailboxValidateCertificatesRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxValidateCertificatesRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxValidateCertificatesRequest := IEmailMailboxValidateCertificatesRequest(outPtr)
        }

        return this.__IEmailMailboxValidateCertificatesRequest.get_EmailMailboxId()
    }

    /**
     * 
     * @returns {IVectorView<Certificate>} 
     */
    get_Certificates() {
        if (!this.HasProp("__IEmailMailboxValidateCertificatesRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxValidateCertificatesRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxValidateCertificatesRequest := IEmailMailboxValidateCertificatesRequest(outPtr)
        }

        return this.__IEmailMailboxValidateCertificatesRequest.get_Certificates()
    }

    /**
     * Informs the email client that the request was processed successfully. Note that success does not mean that all certificates validated successfully. Rather, it means that all certificates' validation status was assessed.
     * @param {IIterable<Integer>} validationStatuses A list of [EmailCertificateValidationStatus](../windows.applicationmodel.email/emailcertificatevalidationstatus.md) values. The first status value in this list is the status of the first certificate in the [Certificates](emailmailboxvalidatecertificatesrequest_certificates.md) property of the original request.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxvalidatecertificatesrequest.reportcompletedasync
     */
    ReportCompletedAsync(validationStatuses) {
        if (!this.HasProp("__IEmailMailboxValidateCertificatesRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxValidateCertificatesRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxValidateCertificatesRequest := IEmailMailboxValidateCertificatesRequest(outPtr)
        }

        return this.__IEmailMailboxValidateCertificatesRequest.ReportCompletedAsync(validationStatuses)
    }

    /**
     * Informs the client that the request was not processed successfully. Specifically, not all of the certificates' validation state was assessed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxvalidatecertificatesrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IEmailMailboxValidateCertificatesRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxValidateCertificatesRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxValidateCertificatesRequest := IEmailMailboxValidateCertificatesRequest(outPtr)
        }

        return this.__IEmailMailboxValidateCertificatesRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
