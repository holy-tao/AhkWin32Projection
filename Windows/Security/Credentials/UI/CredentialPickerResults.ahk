#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICredentialPickerResults.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Describes the results of the dialog box operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpickerresults
 * @namespace Windows.Security.Credentials.UI
 * @version WindowsRuntime 1.4
 */
class CredentialPickerResults extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICredentialPickerResults

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICredentialPickerResults.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the value of the error code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpickerresults.errorcode
     * @type {Integer} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

    /**
     * Gets the state of the "Save Credentials" check box.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpickerresults.credentialsaveoption
     * @type {Integer} 
     */
    CredentialSaveOption {
        get => this.get_CredentialSaveOption()
    }

    /**
     * Gets the status of the credential save operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpickerresults.credentialsaved
     * @type {Boolean} 
     */
    CredentialSaved {
        get => this.get_CredentialSaved()
    }

    /**
     * Gets the opaque credential.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpickerresults.credential
     * @type {IBuffer} 
     */
    Credential {
        get => this.get_Credential()
    }

    /**
     * Gets the domain name portion of the unpacked credential.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpickerresults.credentialdomainname
     * @type {HSTRING} 
     */
    CredentialDomainName {
        get => this.get_CredentialDomainName()
    }

    /**
     * Gets the user name of the unpacked credential.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpickerresults.credentialusername
     * @type {HSTRING} 
     */
    CredentialUserName {
        get => this.get_CredentialUserName()
    }

    /**
     * Gets the password portion of the unpacked credential.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpickerresults.credentialpassword
     * @type {HSTRING} 
     */
    CredentialPassword {
        get => this.get_CredentialPassword()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__ICredentialPickerResults")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerResults := ICredentialPickerResults(outPtr)
        }

        return this.__ICredentialPickerResults.get_ErrorCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CredentialSaveOption() {
        if (!this.HasProp("__ICredentialPickerResults")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerResults := ICredentialPickerResults(outPtr)
        }

        return this.__ICredentialPickerResults.get_CredentialSaveOption()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CredentialSaved() {
        if (!this.HasProp("__ICredentialPickerResults")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerResults := ICredentialPickerResults(outPtr)
        }

        return this.__ICredentialPickerResults.get_CredentialSaved()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Credential() {
        if (!this.HasProp("__ICredentialPickerResults")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerResults := ICredentialPickerResults(outPtr)
        }

        return this.__ICredentialPickerResults.get_Credential()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CredentialDomainName() {
        if (!this.HasProp("__ICredentialPickerResults")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerResults := ICredentialPickerResults(outPtr)
        }

        return this.__ICredentialPickerResults.get_CredentialDomainName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CredentialUserName() {
        if (!this.HasProp("__ICredentialPickerResults")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerResults := ICredentialPickerResults(outPtr)
        }

        return this.__ICredentialPickerResults.get_CredentialUserName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CredentialPassword() {
        if (!this.HasProp("__ICredentialPickerResults")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerResults := ICredentialPickerResults(outPtr)
        }

        return this.__ICredentialPickerResults.get_CredentialPassword()
    }

;@endregion Instance Methods
}
