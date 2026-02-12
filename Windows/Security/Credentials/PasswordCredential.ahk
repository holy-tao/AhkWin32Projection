#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPasswordCredential.ahk
#Include .\ICredentialFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the password credential store.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.passwordcredential
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class PasswordCredential extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPasswordCredential

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPasswordCredential.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates and initializes a new instance of the [PasswordCredential](passwordcredential.md) object that contains the provided credential data.
     * @param {HSTRING} resource The resource for which the credentials are used.
     * @param {HSTRING} userName The user name that must be present in the credentials. This value must not be null or empty, otherwise an exception will be thrown.
     * @param {HSTRING} password The password for the created credentials. This value must not be null or empty, otherwise an exception will be thrown.
     * @returns {PasswordCredential} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.passwordcredential.#ctor
     */
    static CreatePasswordCredential(resource, userName, password) {
        if (!PasswordCredential.HasProp("__ICredentialFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Credentials.PasswordCredential")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICredentialFactory.IID)
            PasswordCredential.__ICredentialFactory := ICredentialFactory(factoryPtr)
        }

        return PasswordCredential.__ICredentialFactory.CreatePasswordCredential(resource, userName, password)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the resource of the credential.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.passwordcredential.resource
     * @type {HSTRING} 
     */
    Resource {
        get => this.get_Resource()
        set => this.put_Resource(value)
    }

    /**
     * Gets or sets the user name of the credential. This value must not be null or empty, otherwise an exception will be thrown.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.passwordcredential.username
     * @type {HSTRING} 
     */
    UserName {
        get => this.get_UserName()
        set => this.put_UserName(value)
    }

    /**
     * Gets or sets the password string of the credential. This value must not be null or empty, otherwise an exception will be thrown. You must call **[RetrievePassword](passwordcredential_retrievepassword_1065544962.md)** first to set the initial value of this property.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.passwordcredential.password
     * @type {HSTRING} 
     */
    Password {
        get => this.get_Password()
        set => this.put_Password(value)
    }

    /**
     * This API is intended for internal use only should not be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.passwordcredential.properties
     * @type {IPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates and initializes a new, empty instance of the [PasswordCredential](passwordcredential.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.Credentials.PasswordCredential")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Resource() {
        if (!this.HasProp("__IPasswordCredential")) {
            if ((queryResult := this.QueryInterface(IPasswordCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordCredential := IPasswordCredential(outPtr)
        }

        return this.__IPasswordCredential.get_Resource()
    }

    /**
     * 
     * @param {HSTRING} resource 
     * @returns {HRESULT} 
     */
    put_Resource(resource) {
        if (!this.HasProp("__IPasswordCredential")) {
            if ((queryResult := this.QueryInterface(IPasswordCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordCredential := IPasswordCredential(outPtr)
        }

        return this.__IPasswordCredential.put_Resource(resource)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserName() {
        if (!this.HasProp("__IPasswordCredential")) {
            if ((queryResult := this.QueryInterface(IPasswordCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordCredential := IPasswordCredential(outPtr)
        }

        return this.__IPasswordCredential.get_UserName()
    }

    /**
     * 
     * @param {HSTRING} userName 
     * @returns {HRESULT} 
     */
    put_UserName(userName) {
        if (!this.HasProp("__IPasswordCredential")) {
            if ((queryResult := this.QueryInterface(IPasswordCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordCredential := IPasswordCredential(outPtr)
        }

        return this.__IPasswordCredential.put_UserName(userName)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Password() {
        if (!this.HasProp("__IPasswordCredential")) {
            if ((queryResult := this.QueryInterface(IPasswordCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordCredential := IPasswordCredential(outPtr)
        }

        return this.__IPasswordCredential.get_Password()
    }

    /**
     * 
     * @param {HSTRING} password 
     * @returns {HRESULT} 
     */
    put_Password(password) {
        if (!this.HasProp("__IPasswordCredential")) {
            if ((queryResult := this.QueryInterface(IPasswordCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordCredential := IPasswordCredential(outPtr)
        }

        return this.__IPasswordCredential.put_Password(password)
    }

    /**
     * Populates the password for the credential. After the operation returns successfully, you can get the password from the [Password](passwordcredential_password.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.passwordcredential.retrievepassword
     */
    RetrievePassword() {
        if (!this.HasProp("__IPasswordCredential")) {
            if ((queryResult := this.QueryInterface(IPasswordCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordCredential := IPasswordCredential(outPtr)
        }

        return this.__IPasswordCredential.RetrievePassword()
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Properties() {
        if (!this.HasProp("__IPasswordCredential")) {
            if ((queryResult := this.QueryInterface(IPasswordCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordCredential := IPasswordCredential(outPtr)
        }

        return this.__IPasswordCredential.get_Properties()
    }

;@endregion Instance Methods
}
