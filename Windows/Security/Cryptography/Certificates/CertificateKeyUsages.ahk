#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICertificateKeyUsages.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the usages of a certificate key.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatekeyusages
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class CertificateKeyUsages extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICertificateKeyUsages

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICertificateKeyUsages.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets if the key is for encipher only.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatekeyusages.encipheronly
     * @type {Boolean} 
     */
    EncipherOnly {
        get => this.get_EncipherOnly()
        set => this.put_EncipherOnly(value)
    }

    /**
     * Gets or sets if the key is for cRLSign.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatekeyusages.crlsign
     * @type {Boolean} 
     */
    CrlSign {
        get => this.get_CrlSign()
        set => this.put_CrlSign(value)
    }

    /**
     * Gets or sets if the key is for key certificate sign.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatekeyusages.keycertificatesign
     * @type {Boolean} 
     */
    KeyCertificateSign {
        get => this.get_KeyCertificateSign()
        set => this.put_KeyCertificateSign(value)
    }

    /**
     * Gets or sets if the key is for key agreement.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatekeyusages.keyagreement
     * @type {Boolean} 
     */
    KeyAgreement {
        get => this.get_KeyAgreement()
        set => this.put_KeyAgreement(value)
    }

    /**
     * Gets or sets if the key is for data encipherment.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatekeyusages.dataencipherment
     * @type {Boolean} 
     */
    DataEncipherment {
        get => this.get_DataEncipherment()
        set => this.put_DataEncipherment(value)
    }

    /**
     * Gets or sets if the key is for key encipherment.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatekeyusages.keyencipherment
     * @type {Boolean} 
     */
    KeyEncipherment {
        get => this.get_KeyEncipherment()
        set => this.put_KeyEncipherment(value)
    }

    /**
     * Gets or sets if the key is for non-repudiation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatekeyusages.nonrepudiation
     * @type {Boolean} 
     */
    NonRepudiation {
        get => this.get_NonRepudiation()
        set => this.put_NonRepudiation(value)
    }

    /**
     * Gets or sets if the key is for digital signature.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatekeyusages.digitalsignature
     * @type {Boolean} 
     */
    DigitalSignature {
        get => this.get_DigitalSignature()
        set => this.put_DigitalSignature(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [CertificateKeyUsages](certificatekeyusages.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CertificateKeyUsages")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_EncipherOnly() {
        if (!this.HasProp("__ICertificateKeyUsages")) {
            if ((queryResult := this.QueryInterface(ICertificateKeyUsages.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateKeyUsages := ICertificateKeyUsages(outPtr)
        }

        return this.__ICertificateKeyUsages.get_EncipherOnly()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_EncipherOnly(value) {
        if (!this.HasProp("__ICertificateKeyUsages")) {
            if ((queryResult := this.QueryInterface(ICertificateKeyUsages.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateKeyUsages := ICertificateKeyUsages(outPtr)
        }

        return this.__ICertificateKeyUsages.put_EncipherOnly(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CrlSign() {
        if (!this.HasProp("__ICertificateKeyUsages")) {
            if ((queryResult := this.QueryInterface(ICertificateKeyUsages.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateKeyUsages := ICertificateKeyUsages(outPtr)
        }

        return this.__ICertificateKeyUsages.get_CrlSign()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CrlSign(value) {
        if (!this.HasProp("__ICertificateKeyUsages")) {
            if ((queryResult := this.QueryInterface(ICertificateKeyUsages.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateKeyUsages := ICertificateKeyUsages(outPtr)
        }

        return this.__ICertificateKeyUsages.put_CrlSign(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_KeyCertificateSign() {
        if (!this.HasProp("__ICertificateKeyUsages")) {
            if ((queryResult := this.QueryInterface(ICertificateKeyUsages.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateKeyUsages := ICertificateKeyUsages(outPtr)
        }

        return this.__ICertificateKeyUsages.get_KeyCertificateSign()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_KeyCertificateSign(value) {
        if (!this.HasProp("__ICertificateKeyUsages")) {
            if ((queryResult := this.QueryInterface(ICertificateKeyUsages.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateKeyUsages := ICertificateKeyUsages(outPtr)
        }

        return this.__ICertificateKeyUsages.put_KeyCertificateSign(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_KeyAgreement() {
        if (!this.HasProp("__ICertificateKeyUsages")) {
            if ((queryResult := this.QueryInterface(ICertificateKeyUsages.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateKeyUsages := ICertificateKeyUsages(outPtr)
        }

        return this.__ICertificateKeyUsages.get_KeyAgreement()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_KeyAgreement(value) {
        if (!this.HasProp("__ICertificateKeyUsages")) {
            if ((queryResult := this.QueryInterface(ICertificateKeyUsages.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateKeyUsages := ICertificateKeyUsages(outPtr)
        }

        return this.__ICertificateKeyUsages.put_KeyAgreement(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DataEncipherment() {
        if (!this.HasProp("__ICertificateKeyUsages")) {
            if ((queryResult := this.QueryInterface(ICertificateKeyUsages.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateKeyUsages := ICertificateKeyUsages(outPtr)
        }

        return this.__ICertificateKeyUsages.get_DataEncipherment()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DataEncipherment(value) {
        if (!this.HasProp("__ICertificateKeyUsages")) {
            if ((queryResult := this.QueryInterface(ICertificateKeyUsages.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateKeyUsages := ICertificateKeyUsages(outPtr)
        }

        return this.__ICertificateKeyUsages.put_DataEncipherment(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_KeyEncipherment() {
        if (!this.HasProp("__ICertificateKeyUsages")) {
            if ((queryResult := this.QueryInterface(ICertificateKeyUsages.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateKeyUsages := ICertificateKeyUsages(outPtr)
        }

        return this.__ICertificateKeyUsages.get_KeyEncipherment()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_KeyEncipherment(value) {
        if (!this.HasProp("__ICertificateKeyUsages")) {
            if ((queryResult := this.QueryInterface(ICertificateKeyUsages.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateKeyUsages := ICertificateKeyUsages(outPtr)
        }

        return this.__ICertificateKeyUsages.put_KeyEncipherment(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_NonRepudiation() {
        if (!this.HasProp("__ICertificateKeyUsages")) {
            if ((queryResult := this.QueryInterface(ICertificateKeyUsages.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateKeyUsages := ICertificateKeyUsages(outPtr)
        }

        return this.__ICertificateKeyUsages.get_NonRepudiation()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_NonRepudiation(value) {
        if (!this.HasProp("__ICertificateKeyUsages")) {
            if ((queryResult := this.QueryInterface(ICertificateKeyUsages.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateKeyUsages := ICertificateKeyUsages(outPtr)
        }

        return this.__ICertificateKeyUsages.put_NonRepudiation(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DigitalSignature() {
        if (!this.HasProp("__ICertificateKeyUsages")) {
            if ((queryResult := this.QueryInterface(ICertificateKeyUsages.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateKeyUsages := ICertificateKeyUsages(outPtr)
        }

        return this.__ICertificateKeyUsages.get_DigitalSignature()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DigitalSignature(value) {
        if (!this.HasProp("__ICertificateKeyUsages")) {
            if ((queryResult := this.QueryInterface(ICertificateKeyUsages.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateKeyUsages := ICertificateKeyUsages(outPtr)
        }

        return this.__ICertificateKeyUsages.put_DigitalSignature(value)
    }

;@endregion Instance Methods
}
