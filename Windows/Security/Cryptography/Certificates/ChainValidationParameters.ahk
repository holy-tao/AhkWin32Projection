#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChainValidationParameters.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents values to use when verifying a certificate chain.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.chainvalidationparameters
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ChainValidationParameters extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChainValidationParameters

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChainValidationParameters.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the certificate chain policy to use when verifying the certificate chain.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.chainvalidationparameters.certificatechainpolicy
     * @type {Integer} 
     */
    CertificateChainPolicy {
        get => this.get_CertificateChainPolicy()
        set => this.put_CertificateChainPolicy(value)
    }

    /**
     * Gets or sets the server DNS name to use for SSL policy.
     * @remarks
     * The ServerDnsName property only applies when the [CertificateChainPolicy](chainvalidationparameters_certificatechainpolicy.md) property is set to **Ssl**.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.chainvalidationparameters.serverdnsname
     * @type {HostName} 
     */
    ServerDnsName {
        get => this.get_ServerDnsName()
        set => this.put_ServerDnsName(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [ChainValidationParameters](chainvalidationparameters.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.ChainValidationParameters")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CertificateChainPolicy() {
        if (!this.HasProp("__IChainValidationParameters")) {
            if ((queryResult := this.QueryInterface(IChainValidationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChainValidationParameters := IChainValidationParameters(outPtr)
        }

        return this.__IChainValidationParameters.get_CertificateChainPolicy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CertificateChainPolicy(value) {
        if (!this.HasProp("__IChainValidationParameters")) {
            if ((queryResult := this.QueryInterface(IChainValidationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChainValidationParameters := IChainValidationParameters(outPtr)
        }

        return this.__IChainValidationParameters.put_CertificateChainPolicy(value)
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_ServerDnsName() {
        if (!this.HasProp("__IChainValidationParameters")) {
            if ((queryResult := this.QueryInterface(IChainValidationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChainValidationParameters := IChainValidationParameters(outPtr)
        }

        return this.__IChainValidationParameters.get_ServerDnsName()
    }

    /**
     * 
     * @param {HostName} value 
     * @returns {HRESULT} 
     */
    put_ServerDnsName(value) {
        if (!this.HasProp("__IChainValidationParameters")) {
            if ((queryResult := this.QueryInterface(IChainValidationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChainValidationParameters := IChainValidationParameters(outPtr)
        }

        return this.__IChainValidationParameters.put_ServerDnsName(value)
    }

;@endregion Instance Methods
}
