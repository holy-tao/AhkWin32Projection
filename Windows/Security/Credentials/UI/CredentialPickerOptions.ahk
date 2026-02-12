#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICredentialPickerOptions.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Controls the appearance and behavior of a credential prompt.
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpickeroptions
 * @namespace Windows.Security.Credentials.UI
 * @version WindowsRuntime 1.4
 */
class CredentialPickerOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICredentialPickerOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICredentialPickerOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the caption text that is displayed to the user.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpickeroptions.caption
     * @type {HSTRING} 
     */
    Caption {
        get => this.get_Caption()
        set => this.put_Caption(value)
    }

    /**
     * Gets or sets the body of text that displays to the user.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpickeroptions.message
     * @type {HSTRING} 
     */
    Message {
        get => this.get_Message()
        set => this.put_Message(value)
    }

    /**
     * Gets or sets the error code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpickeroptions.errorcode
     * @type {Integer} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
        set => this.put_ErrorCode(value)
    }

    /**
     * Gets or sets the name of the target computer.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpickeroptions.targetname
     * @type {HSTRING} 
     */
    TargetName {
        get => this.get_TargetName()
        set => this.put_TargetName(value)
    }

    /**
     * Gets or sets the authentication protocol.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpickeroptions.authenticationprotocol
     * @type {Integer} 
     */
    AuthenticationProtocol {
        get => this.get_AuthenticationProtocol()
        set => this.put_AuthenticationProtocol(value)
    }

    /**
     * Gets or sets whether the authentication protocol is custom rather than a standard authentication protocol.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpickeroptions.customauthenticationprotocol
     * @type {HSTRING} 
     */
    CustomAuthenticationProtocol {
        get => this.get_CustomAuthenticationProtocol()
        set => this.put_CustomAuthenticationProtocol(value)
    }

    /**
     * Gets or sets whether to fill dialog box fields with previous credentials.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpickeroptions.previouscredential
     * @type {IBuffer} 
     */
    PreviousCredential {
        get => this.get_PreviousCredential()
        set => this.put_PreviousCredential(value)
    }

    /**
     * Gets or sets the option of whether the dialog box is displayed.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpickeroptions.alwaysdisplaydialog
     * @type {Boolean} 
     */
    AlwaysDisplayDialog {
        get => this.get_AlwaysDisplayDialog()
        set => this.put_AlwaysDisplayDialog(value)
    }

    /**
     * Gets or sets whether the caller wants to save the credentials.
     * @remarks
     * If CallerSavesCredential is False and the user checks the **Save Credentials** check box, the entered credentials are stored in [Credential Manager](http://windows.microsoft.com/en-US/Windows7/What-is-Credential-Manager) by default. However, if CallerSavesCredential is set to True and the user checks the **Save Credentials** check box, it is up to caller to store the entered credentials securely. For secure credential storage, please refer to [Credential Locker](../windows.security.credentials/passwordvault.md).
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpickeroptions.callersavescredential
     * @type {Boolean} 
     */
    CallerSavesCredential {
        get => this.get_CallerSavesCredential()
        set => this.put_CallerSavesCredential(value)
    }

    /**
     * Gets or sets the option on saving credentials.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.credentialpickeroptions.credentialsaveoption
     * @type {Integer} 
     */
    CredentialSaveOption {
        get => this.get_CredentialSaveOption()
        set => this.put_CredentialSaveOption(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates and initializes a new, empty instance of the [CredentialPickerOptions](credentialpickeroptions.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.Credentials.UI.CredentialPickerOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Caption(value) {
        if (!this.HasProp("__ICredentialPickerOptions")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerOptions := ICredentialPickerOptions(outPtr)
        }

        return this.__ICredentialPickerOptions.put_Caption(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Caption() {
        if (!this.HasProp("__ICredentialPickerOptions")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerOptions := ICredentialPickerOptions(outPtr)
        }

        return this.__ICredentialPickerOptions.get_Caption()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Message(value) {
        if (!this.HasProp("__ICredentialPickerOptions")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerOptions := ICredentialPickerOptions(outPtr)
        }

        return this.__ICredentialPickerOptions.put_Message(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Message() {
        if (!this.HasProp("__ICredentialPickerOptions")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerOptions := ICredentialPickerOptions(outPtr)
        }

        return this.__ICredentialPickerOptions.get_Message()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ErrorCode(value) {
        if (!this.HasProp("__ICredentialPickerOptions")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerOptions := ICredentialPickerOptions(outPtr)
        }

        return this.__ICredentialPickerOptions.put_ErrorCode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__ICredentialPickerOptions")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerOptions := ICredentialPickerOptions(outPtr)
        }

        return this.__ICredentialPickerOptions.get_ErrorCode()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TargetName(value) {
        if (!this.HasProp("__ICredentialPickerOptions")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerOptions := ICredentialPickerOptions(outPtr)
        }

        return this.__ICredentialPickerOptions.put_TargetName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TargetName() {
        if (!this.HasProp("__ICredentialPickerOptions")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerOptions := ICredentialPickerOptions(outPtr)
        }

        return this.__ICredentialPickerOptions.get_TargetName()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AuthenticationProtocol(value) {
        if (!this.HasProp("__ICredentialPickerOptions")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerOptions := ICredentialPickerOptions(outPtr)
        }

        return this.__ICredentialPickerOptions.put_AuthenticationProtocol(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AuthenticationProtocol() {
        if (!this.HasProp("__ICredentialPickerOptions")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerOptions := ICredentialPickerOptions(outPtr)
        }

        return this.__ICredentialPickerOptions.get_AuthenticationProtocol()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CustomAuthenticationProtocol(value) {
        if (!this.HasProp("__ICredentialPickerOptions")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerOptions := ICredentialPickerOptions(outPtr)
        }

        return this.__ICredentialPickerOptions.put_CustomAuthenticationProtocol(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CustomAuthenticationProtocol() {
        if (!this.HasProp("__ICredentialPickerOptions")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerOptions := ICredentialPickerOptions(outPtr)
        }

        return this.__ICredentialPickerOptions.get_CustomAuthenticationProtocol()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_PreviousCredential(value) {
        if (!this.HasProp("__ICredentialPickerOptions")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerOptions := ICredentialPickerOptions(outPtr)
        }

        return this.__ICredentialPickerOptions.put_PreviousCredential(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_PreviousCredential() {
        if (!this.HasProp("__ICredentialPickerOptions")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerOptions := ICredentialPickerOptions(outPtr)
        }

        return this.__ICredentialPickerOptions.get_PreviousCredential()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AlwaysDisplayDialog(value) {
        if (!this.HasProp("__ICredentialPickerOptions")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerOptions := ICredentialPickerOptions(outPtr)
        }

        return this.__ICredentialPickerOptions.put_AlwaysDisplayDialog(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AlwaysDisplayDialog() {
        if (!this.HasProp("__ICredentialPickerOptions")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerOptions := ICredentialPickerOptions(outPtr)
        }

        return this.__ICredentialPickerOptions.get_AlwaysDisplayDialog()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CallerSavesCredential(value) {
        if (!this.HasProp("__ICredentialPickerOptions")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerOptions := ICredentialPickerOptions(outPtr)
        }

        return this.__ICredentialPickerOptions.put_CallerSavesCredential(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CallerSavesCredential() {
        if (!this.HasProp("__ICredentialPickerOptions")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerOptions := ICredentialPickerOptions(outPtr)
        }

        return this.__ICredentialPickerOptions.get_CallerSavesCredential()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CredentialSaveOption(value) {
        if (!this.HasProp("__ICredentialPickerOptions")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerOptions := ICredentialPickerOptions(outPtr)
        }

        return this.__ICredentialPickerOptions.put_CredentialSaveOption(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CredentialSaveOption() {
        if (!this.HasProp("__ICredentialPickerOptions")) {
            if ((queryResult := this.QueryInterface(ICredentialPickerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICredentialPickerOptions := ICredentialPickerOptions(outPtr)
        }

        return this.__ICredentialPickerOptions.get_CredentialSaveOption()
    }

;@endregion Instance Methods
}
