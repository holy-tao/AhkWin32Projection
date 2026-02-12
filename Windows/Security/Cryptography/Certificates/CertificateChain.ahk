#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICertificateChain.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a certificate chain used for signature verification.
 * @remarks
 * A certificate chain is a hierarchal collection of certificates that leads from the end user or computer back to a root of trust, typically the root certification authority (CA).
 * 
 * To obtain a CertificateChain object, call the [Certificate.BuildChainAsync](/uwp/api/windows.security.cryptography.certificates.certificate.buildchainasync) method.
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatechain
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class CertificateChain extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICertificateChain

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICertificateChain.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Verifies whether or not the certificate chain is valid using the specified validation parameters.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatechain.validate
     */
    Validate() {
        if (!this.HasProp("__ICertificateChain")) {
            if ((queryResult := this.QueryInterface(ICertificateChain.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateChain := ICertificateChain(outPtr)
        }

        return this.__ICertificateChain.Validate()
    }

    /**
     * Verifies whether or not the certificate chain is valid.
     * @param {ChainValidationParameters} parameter 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatechain.validate
     */
    ValidateWithParameters(parameter) {
        if (!this.HasProp("__ICertificateChain")) {
            if ((queryResult := this.QueryInterface(ICertificateChain.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateChain := ICertificateChain(outPtr)
        }

        return this.__ICertificateChain.ValidateWithParameters(parameter)
    }

    /**
     * Gets the list of certificates from the certificate chain.
     * @param {Boolean} includeRoot True to include the root certificate in the results; otherwise false.
     * @returns {IVectorView<Certificate>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatechain.getcertificates
     */
    GetCertificates(includeRoot) {
        if (!this.HasProp("__ICertificateChain")) {
            if ((queryResult := this.QueryInterface(ICertificateChain.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateChain := ICertificateChain(outPtr)
        }

        return this.__ICertificateChain.GetCertificates(includeRoot)
    }

;@endregion Instance Methods
}
