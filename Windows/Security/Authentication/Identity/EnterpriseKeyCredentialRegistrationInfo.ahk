#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEnterpriseKeyCredentialRegistrationInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about an enterprise key credential registration.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.enterprisekeycredentialregistrationinfo
 * @namespace Windows.Security.Authentication.Identity
 * @version WindowsRuntime 1.4
 */
class EnterpriseKeyCredentialRegistrationInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEnterpriseKeyCredentialRegistrationInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEnterpriseKeyCredentialRegistrationInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the tenant Id.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.enterprisekeycredentialregistrationinfo.tenantid
     * @type {HSTRING} 
     */
    TenantId {
        get => this.get_TenantId()
    }

    /**
     * Gets the tenant name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.enterprisekeycredentialregistrationinfo.tenantname
     * @type {HSTRING} 
     */
    TenantName {
        get => this.get_TenantName()
    }

    /**
     * Gets the subject.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.enterprisekeycredentialregistrationinfo.subject
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
    }

    /**
     * Gets the key Id.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.enterprisekeycredentialregistrationinfo.keyid
     * @type {HSTRING} 
     */
    KeyId {
        get => this.get_KeyId()
    }

    /**
     * Gets the key name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.enterprisekeycredentialregistrationinfo.keyname
     * @type {HSTRING} 
     */
    KeyName {
        get => this.get_KeyName()
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
    get_TenantId() {
        if (!this.HasProp("__IEnterpriseKeyCredentialRegistrationInfo")) {
            if ((queryResult := this.QueryInterface(IEnterpriseKeyCredentialRegistrationInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEnterpriseKeyCredentialRegistrationInfo := IEnterpriseKeyCredentialRegistrationInfo(outPtr)
        }

        return this.__IEnterpriseKeyCredentialRegistrationInfo.get_TenantId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TenantName() {
        if (!this.HasProp("__IEnterpriseKeyCredentialRegistrationInfo")) {
            if ((queryResult := this.QueryInterface(IEnterpriseKeyCredentialRegistrationInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEnterpriseKeyCredentialRegistrationInfo := IEnterpriseKeyCredentialRegistrationInfo(outPtr)
        }

        return this.__IEnterpriseKeyCredentialRegistrationInfo.get_TenantName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        if (!this.HasProp("__IEnterpriseKeyCredentialRegistrationInfo")) {
            if ((queryResult := this.QueryInterface(IEnterpriseKeyCredentialRegistrationInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEnterpriseKeyCredentialRegistrationInfo := IEnterpriseKeyCredentialRegistrationInfo(outPtr)
        }

        return this.__IEnterpriseKeyCredentialRegistrationInfo.get_Subject()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KeyId() {
        if (!this.HasProp("__IEnterpriseKeyCredentialRegistrationInfo")) {
            if ((queryResult := this.QueryInterface(IEnterpriseKeyCredentialRegistrationInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEnterpriseKeyCredentialRegistrationInfo := IEnterpriseKeyCredentialRegistrationInfo(outPtr)
        }

        return this.__IEnterpriseKeyCredentialRegistrationInfo.get_KeyId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KeyName() {
        if (!this.HasProp("__IEnterpriseKeyCredentialRegistrationInfo")) {
            if ((queryResult := this.QueryInterface(IEnterpriseKeyCredentialRegistrationInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEnterpriseKeyCredentialRegistrationInfo := IEnterpriseKeyCredentialRegistrationInfo(outPtr)
        }

        return this.__IEnterpriseKeyCredentialRegistrationInfo.get_KeyName()
    }

;@endregion Instance Methods
}
