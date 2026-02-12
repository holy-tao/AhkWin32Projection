#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICertificateQuery.ahk
#Include .\ICertificateQuery2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents parameters for a query for certificates from the certificate store for an app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatequery
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class CertificateQuery extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICertificateQuery

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICertificateQuery.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a collection of object identifiers (OIDs) for the enhanced key usage extension to search for.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatequery.enhancedkeyusages
     * @type {IVector<HSTRING>} 
     */
    EnhancedKeyUsages {
        get => this.get_EnhancedKeyUsages()
    }

    /**
     * Gets or sets the name of the certificate issuer to search for.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatequery.issuername
     * @type {HSTRING} 
     */
    IssuerName {
        get => this.get_IssuerName()
        set => this.put_IssuerName(value)
    }

    /**
     * Gets or sets the certificate friendly name to search for.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatequery.friendlyname
     * @type {HSTRING} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
        set => this.put_FriendlyName(value)
    }

    /**
     * Gets or sets a certificate thumbprint to search for.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatequery.thumbprint
     */
    Thumbprint {
        get => this.get_Thumbprint()
        set => this.put_Thumbprint(value)
    }

    /**
     * Gets or sets a value that indicates whether only hardware certificates (SC or TPM) are to be returned from the query.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatequery.hardwareonly
     * @type {Boolean} 
     */
    HardwareOnly {
        get => this.get_HardwareOnly()
        set => this.put_HardwareOnly(value)
    }

    /**
     * Gets or sets whether to include duplicates.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatequery.includeduplicates
     * @type {Boolean} 
     */
    IncludeDuplicates {
        get => this.get_IncludeDuplicates()
        set => this.put_IncludeDuplicates(value)
    }

    /**
     * Gets or sets whether to include expired certificates.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatequery.includeexpiredcertificates
     * @type {Boolean} 
     */
    IncludeExpiredCertificates {
        get => this.get_IncludeExpiredCertificates()
        set => this.put_IncludeExpiredCertificates(value)
    }

    /**
     * Gets or sets the store name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatequery.storename
     * @type {HSTRING} 
     */
    StoreName {
        get => this.get_StoreName()
        set => this.put_StoreName(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of a certificate query.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CertificateQuery")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_EnhancedKeyUsages() {
        if (!this.HasProp("__ICertificateQuery")) {
            if ((queryResult := this.QueryInterface(ICertificateQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateQuery := ICertificateQuery(outPtr)
        }

        return this.__ICertificateQuery.get_EnhancedKeyUsages()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IssuerName() {
        if (!this.HasProp("__ICertificateQuery")) {
            if ((queryResult := this.QueryInterface(ICertificateQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateQuery := ICertificateQuery(outPtr)
        }

        return this.__ICertificateQuery.get_IssuerName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_IssuerName(value) {
        if (!this.HasProp("__ICertificateQuery")) {
            if ((queryResult := this.QueryInterface(ICertificateQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateQuery := ICertificateQuery(outPtr)
        }

        return this.__ICertificateQuery.put_IssuerName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FriendlyName() {
        if (!this.HasProp("__ICertificateQuery")) {
            if ((queryResult := this.QueryInterface(ICertificateQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateQuery := ICertificateQuery(outPtr)
        }

        return this.__ICertificateQuery.get_FriendlyName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_FriendlyName(value) {
        if (!this.HasProp("__ICertificateQuery")) {
            if ((queryResult := this.QueryInterface(ICertificateQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateQuery := ICertificateQuery(outPtr)
        }

        return this.__ICertificateQuery.put_FriendlyName(value)
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_Thumbprint(value) {
        if (!this.HasProp("__ICertificateQuery")) {
            if ((queryResult := this.QueryInterface(ICertificateQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateQuery := ICertificateQuery(outPtr)
        }

        return this.__ICertificateQuery.get_Thumbprint(value)
    }

    /**
     * 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    put_Thumbprint(value_length, value) {
        if (!this.HasProp("__ICertificateQuery")) {
            if ((queryResult := this.QueryInterface(ICertificateQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateQuery := ICertificateQuery(outPtr)
        }

        return this.__ICertificateQuery.put_Thumbprint(value_length, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HardwareOnly() {
        if (!this.HasProp("__ICertificateQuery")) {
            if ((queryResult := this.QueryInterface(ICertificateQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateQuery := ICertificateQuery(outPtr)
        }

        return this.__ICertificateQuery.get_HardwareOnly()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_HardwareOnly(value) {
        if (!this.HasProp("__ICertificateQuery")) {
            if ((queryResult := this.QueryInterface(ICertificateQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateQuery := ICertificateQuery(outPtr)
        }

        return this.__ICertificateQuery.put_HardwareOnly(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeDuplicates() {
        if (!this.HasProp("__ICertificateQuery2")) {
            if ((queryResult := this.QueryInterface(ICertificateQuery2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateQuery2 := ICertificateQuery2(outPtr)
        }

        return this.__ICertificateQuery2.get_IncludeDuplicates()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IncludeDuplicates(value) {
        if (!this.HasProp("__ICertificateQuery2")) {
            if ((queryResult := this.QueryInterface(ICertificateQuery2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateQuery2 := ICertificateQuery2(outPtr)
        }

        return this.__ICertificateQuery2.put_IncludeDuplicates(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeExpiredCertificates() {
        if (!this.HasProp("__ICertificateQuery2")) {
            if ((queryResult := this.QueryInterface(ICertificateQuery2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateQuery2 := ICertificateQuery2(outPtr)
        }

        return this.__ICertificateQuery2.get_IncludeExpiredCertificates()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IncludeExpiredCertificates(value) {
        if (!this.HasProp("__ICertificateQuery2")) {
            if ((queryResult := this.QueryInterface(ICertificateQuery2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateQuery2 := ICertificateQuery2(outPtr)
        }

        return this.__ICertificateQuery2.put_IncludeExpiredCertificates(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StoreName() {
        if (!this.HasProp("__ICertificateQuery2")) {
            if ((queryResult := this.QueryInterface(ICertificateQuery2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateQuery2 := ICertificateQuery2(outPtr)
        }

        return this.__ICertificateQuery2.get_StoreName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_StoreName(value) {
        if (!this.HasProp("__ICertificateQuery2")) {
            if ((queryResult := this.QueryInterface(ICertificateQuery2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateQuery2 := ICertificateQuery2(outPtr)
        }

        return this.__ICertificateQuery2.put_StoreName(value)
    }

;@endregion Instance Methods
}
