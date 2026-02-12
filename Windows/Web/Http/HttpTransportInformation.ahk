#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpTransportInformation.ahk
#Include ..\..\Foundation\IStringable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the underlying transport used by the HTTP connection.
 * @remarks
 * The primary use of the HttpTransportInformation object is to get SSL information when SSL is used for the HTTP connection.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.httptransportinformation
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class HttpTransportInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpTransportInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpTransportInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the certificate from the server with the SSL information.
     * @remarks
     * This property gets the server certificate used for an SSL connection. This certificate is provided by the server during the SSL connection negotiation. The properties on the [Certificate](../windows.security.cryptography.certificates/certificate.md) object returned can be used to determine detailed information on the certificate.
     * 
     * This property is useful for notifying the user why an SSL connection failed.
     * 
     * This property can also be used to enforce stronger security than the default connection using the [Certificate](../windows.security.cryptography.certificates/certificate.md) object returned. The [BuildChainAsync](../windows.security.cryptography.certificates/certificate_buildchainasync_1634621379.md) methods and other properties on the [Certificate](../windows.security.cryptography.certificates/certificate.md) object and methods on the [CertificateChain](../windows.security.cryptography.certificates/certificatechain.md) object can be used when an app requires stronger security than the standard SSL negotiation.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httptransportinformation.servercertificate
     * @type {Certificate} 
     */
    ServerCertificate {
        get => this.get_ServerCertificate()
    }

    /**
     * Gets the category of an error on an SSL connection.
     * @remarks
     * SSL server errors should only be ignored in advanced scenarios. Disregarding server certificate errors when the ServerCertificateErrorSeverity property is either **Ignorable** or **Fatal** may result in the loss of privacy or integrity of the content passed over the SSL session.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httptransportinformation.servercertificateerrorseverity
     * @type {Integer} 
     */
    ServerCertificateErrorSeverity {
        get => this.get_ServerCertificateErrorSeverity()
    }

    /**
     * Gets the list of errors that occurred making an SSL connection.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httptransportinformation.servercertificateerrors
     * @type {IVectorView<Integer>} 
     */
    ServerCertificateErrors {
        get => this.get_ServerCertificateErrors()
    }

    /**
     * Gets the intermediate certificates sent by the server during SSL negotiation on this [HttpTransportInformation](httptransportinformation.md) object.
     * @remarks
     * This property returns the intermediate server certificates used for an SSL connection. These certificates are provided by the server during the SSL connection negotiation. The properties on the [Certificate](../windows.security.cryptography.certificates/certificate.md) objects in the returned vector can be used to determine detailed information on the certificates.
     * 
     * This property can also be used to enforce stronger security than the default connection using the [Certificate](../windows.security.cryptography.certificates/certificate.md) objects returned. The [BuildChainAsync](../windows.security.cryptography.certificates/certificate_buildchainasync_1634621379.md) methods and other properties on the [Certificate](../windows.security.cryptography.certificates/certificate.md) objects and methods on the [CertificateChain](../windows.security.cryptography.certificates/certificatechain.md) object can be used when an app requires stronger security than the standard SSL negotiation.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httptransportinformation.serverintermediatecertificates
     * @type {IVectorView<Certificate>} 
     */
    ServerIntermediateCertificates {
        get => this.get_ServerIntermediateCertificates()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_ServerCertificate() {
        if (!this.HasProp("__IHttpTransportInformation")) {
            if ((queryResult := this.QueryInterface(IHttpTransportInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpTransportInformation := IHttpTransportInformation(outPtr)
        }

        return this.__IHttpTransportInformation.get_ServerCertificate()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServerCertificateErrorSeverity() {
        if (!this.HasProp("__IHttpTransportInformation")) {
            if ((queryResult := this.QueryInterface(IHttpTransportInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpTransportInformation := IHttpTransportInformation(outPtr)
        }

        return this.__IHttpTransportInformation.get_ServerCertificateErrorSeverity()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_ServerCertificateErrors() {
        if (!this.HasProp("__IHttpTransportInformation")) {
            if ((queryResult := this.QueryInterface(IHttpTransportInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpTransportInformation := IHttpTransportInformation(outPtr)
        }

        return this.__IHttpTransportInformation.get_ServerCertificateErrors()
    }

    /**
     * 
     * @returns {IVectorView<Certificate>} 
     */
    get_ServerIntermediateCertificates() {
        if (!this.HasProp("__IHttpTransportInformation")) {
            if ((queryResult := this.QueryInterface(IHttpTransportInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpTransportInformation := IHttpTransportInformation(outPtr)
        }

        return this.__IHttpTransportInformation.get_ServerIntermediateCertificates()
    }

    /**
     * Returns a string that represents the current [HttpTransportInformation](httptransportinformation.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httptransportinformation.tostring
     */
    ToString() {
        if (!this.HasProp("__IStringable")) {
            if ((queryResult := this.QueryInterface(IStringable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStringable := IStringable(outPtr)
        }

        return this.__IStringable.ToString()
    }

;@endregion Instance Methods
}
