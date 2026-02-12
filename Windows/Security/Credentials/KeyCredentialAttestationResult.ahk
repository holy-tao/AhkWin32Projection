#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKeyCredentialAttestationResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the results of the [KeyCredential.GetAttestationAsync](keycredential_getattestationasync_144904369.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialattestationresult
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class KeyCredentialAttestationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IKeyCredentialAttestationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IKeyCredentialAttestationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the chain of certificates used to verify the attestation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialattestationresult.certificatechainbuffer
     * @type {IBuffer} 
     */
    CertificateChainBuffer {
        get => this.get_CertificateChainBuffer()
    }

    /**
     * Gets the attestation information for the KeyCredential.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialattestationresult.attestationbuffer
     * @type {IBuffer} 
     */
    AttestationBuffer {
        get => this.get_AttestationBuffer()
    }

    /**
     * Gets the status of the key credential attestation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialattestationresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_CertificateChainBuffer() {
        if (!this.HasProp("__IKeyCredentialAttestationResult")) {
            if ((queryResult := this.QueryInterface(IKeyCredentialAttestationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyCredentialAttestationResult := IKeyCredentialAttestationResult(outPtr)
        }

        return this.__IKeyCredentialAttestationResult.get_CertificateChainBuffer()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_AttestationBuffer() {
        if (!this.HasProp("__IKeyCredentialAttestationResult")) {
            if ((queryResult := this.QueryInterface(IKeyCredentialAttestationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyCredentialAttestationResult := IKeyCredentialAttestationResult(outPtr)
        }

        return this.__IKeyCredentialAttestationResult.get_AttestationBuffer()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IKeyCredentialAttestationResult")) {
            if ((queryResult := this.QueryInterface(IKeyCredentialAttestationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyCredentialAttestationResult := IKeyCredentialAttestationResult(outPtr)
        }

        return this.__IKeyCredentialAttestationResult.get_Status()
    }

;@endregion Instance Methods
}
