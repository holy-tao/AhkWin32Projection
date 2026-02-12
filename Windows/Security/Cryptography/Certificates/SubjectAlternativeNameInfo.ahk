#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISubjectAlternativeNameInfo.ahk
#Include .\ISubjectAlternativeNameInfo2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides info about a subject alternative name.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.subjectalternativenameinfo
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class SubjectAlternativeNameInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISubjectAlternativeNameInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISubjectAlternativeNameInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the email name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.subjectalternativenameinfo.emailname
     * @type {IVectorView<HSTRING>} 
     */
    EmailName {
        get => this.get_EmailName()
    }

    /**
     * Gets the IP address.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.subjectalternativenameinfo.ipaddress
     * @type {IVectorView<HSTRING>} 
     */
    IPAddress {
        get => this.get_IPAddress()
    }

    /**
     * Gets the URL.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.subjectalternativenameinfo.url
     * @type {IVectorView<HSTRING>} 
     */
    Url {
        get => this.get_Url()
    }

    /**
     * Gets the DNS name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.subjectalternativenameinfo.dnsname
     * @type {IVectorView<HSTRING>} 
     */
    DnsName {
        get => this.get_DnsName()
    }

    /**
     * Gets the distinguished name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.subjectalternativenameinfo.distinguishedname
     * @type {IVectorView<HSTRING>} 
     */
    DistinguishedName {
        get => this.get_DistinguishedName()
    }

    /**
     * Gets the principal name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.subjectalternativenameinfo.principalname
     * @type {IVectorView<HSTRING>} 
     */
    PrincipalName {
        get => this.get_PrincipalName()
    }

    /**
     * Gets a vector of email names.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.subjectalternativenameinfo.emailnames
     * @type {IVector<HSTRING>} 
     */
    EmailNames {
        get => this.get_EmailNames()
    }

    /**
     * Gets the IP addresses.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.subjectalternativenameinfo.ipaddresses
     * @type {IVector<HSTRING>} 
     */
    IPAddresses {
        get => this.get_IPAddresses()
    }

    /**
     * Gets a vector of URLs.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.subjectalternativenameinfo.urls
     * @type {IVector<HSTRING>} 
     */
    Urls {
        get => this.get_Urls()
    }

    /**
     * Gets a vector of dns names.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.subjectalternativenameinfo.dnsnames
     * @type {IVector<HSTRING>} 
     */
    DnsNames {
        get => this.get_DnsNames()
    }

    /**
     * Gets a vector of distinguished names.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.subjectalternativenameinfo.distinguishednames
     * @type {IVector<HSTRING>} 
     */
    DistinguishedNames {
        get => this.get_DistinguishedNames()
    }

    /**
     * Gets a vector of principal names.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.subjectalternativenameinfo.principalnames
     * @type {IVector<HSTRING>} 
     */
    PrincipalNames {
        get => this.get_PrincipalNames()
    }

    /**
     * Gets the certificate extension.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.subjectalternativenameinfo.extension
     * @type {CertificateExtension} 
     */
    Extension {
        get => this.get_Extension()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [SubjectAlternativeNameInfo](subjectalternativenameinfo.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.SubjectAlternativeNameInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_EmailName() {
        if (!this.HasProp("__ISubjectAlternativeNameInfo")) {
            if ((queryResult := this.QueryInterface(ISubjectAlternativeNameInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISubjectAlternativeNameInfo := ISubjectAlternativeNameInfo(outPtr)
        }

        return this.__ISubjectAlternativeNameInfo.get_EmailName()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_IPAddress() {
        if (!this.HasProp("__ISubjectAlternativeNameInfo")) {
            if ((queryResult := this.QueryInterface(ISubjectAlternativeNameInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISubjectAlternativeNameInfo := ISubjectAlternativeNameInfo(outPtr)
        }

        return this.__ISubjectAlternativeNameInfo.get_IPAddress()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Url() {
        if (!this.HasProp("__ISubjectAlternativeNameInfo")) {
            if ((queryResult := this.QueryInterface(ISubjectAlternativeNameInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISubjectAlternativeNameInfo := ISubjectAlternativeNameInfo(outPtr)
        }

        return this.__ISubjectAlternativeNameInfo.get_Url()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_DnsName() {
        if (!this.HasProp("__ISubjectAlternativeNameInfo")) {
            if ((queryResult := this.QueryInterface(ISubjectAlternativeNameInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISubjectAlternativeNameInfo := ISubjectAlternativeNameInfo(outPtr)
        }

        return this.__ISubjectAlternativeNameInfo.get_DnsName()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_DistinguishedName() {
        if (!this.HasProp("__ISubjectAlternativeNameInfo")) {
            if ((queryResult := this.QueryInterface(ISubjectAlternativeNameInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISubjectAlternativeNameInfo := ISubjectAlternativeNameInfo(outPtr)
        }

        return this.__ISubjectAlternativeNameInfo.get_DistinguishedName()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_PrincipalName() {
        if (!this.HasProp("__ISubjectAlternativeNameInfo")) {
            if ((queryResult := this.QueryInterface(ISubjectAlternativeNameInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISubjectAlternativeNameInfo := ISubjectAlternativeNameInfo(outPtr)
        }

        return this.__ISubjectAlternativeNameInfo.get_PrincipalName()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_EmailNames() {
        if (!this.HasProp("__ISubjectAlternativeNameInfo2")) {
            if ((queryResult := this.QueryInterface(ISubjectAlternativeNameInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISubjectAlternativeNameInfo2 := ISubjectAlternativeNameInfo2(outPtr)
        }

        return this.__ISubjectAlternativeNameInfo2.get_EmailNames()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_IPAddresses() {
        if (!this.HasProp("__ISubjectAlternativeNameInfo2")) {
            if ((queryResult := this.QueryInterface(ISubjectAlternativeNameInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISubjectAlternativeNameInfo2 := ISubjectAlternativeNameInfo2(outPtr)
        }

        return this.__ISubjectAlternativeNameInfo2.get_IPAddresses()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Urls() {
        if (!this.HasProp("__ISubjectAlternativeNameInfo2")) {
            if ((queryResult := this.QueryInterface(ISubjectAlternativeNameInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISubjectAlternativeNameInfo2 := ISubjectAlternativeNameInfo2(outPtr)
        }

        return this.__ISubjectAlternativeNameInfo2.get_Urls()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_DnsNames() {
        if (!this.HasProp("__ISubjectAlternativeNameInfo2")) {
            if ((queryResult := this.QueryInterface(ISubjectAlternativeNameInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISubjectAlternativeNameInfo2 := ISubjectAlternativeNameInfo2(outPtr)
        }

        return this.__ISubjectAlternativeNameInfo2.get_DnsNames()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_DistinguishedNames() {
        if (!this.HasProp("__ISubjectAlternativeNameInfo2")) {
            if ((queryResult := this.QueryInterface(ISubjectAlternativeNameInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISubjectAlternativeNameInfo2 := ISubjectAlternativeNameInfo2(outPtr)
        }

        return this.__ISubjectAlternativeNameInfo2.get_DistinguishedNames()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_PrincipalNames() {
        if (!this.HasProp("__ISubjectAlternativeNameInfo2")) {
            if ((queryResult := this.QueryInterface(ISubjectAlternativeNameInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISubjectAlternativeNameInfo2 := ISubjectAlternativeNameInfo2(outPtr)
        }

        return this.__ISubjectAlternativeNameInfo2.get_PrincipalNames()
    }

    /**
     * 
     * @returns {CertificateExtension} 
     */
    get_Extension() {
        if (!this.HasProp("__ISubjectAlternativeNameInfo2")) {
            if ((queryResult := this.QueryInterface(ISubjectAlternativeNameInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISubjectAlternativeNameInfo2 := ISubjectAlternativeNameInfo2(outPtr)
        }

        return this.__ISubjectAlternativeNameInfo2.get_Extension()
    }

;@endregion Instance Methods
}
