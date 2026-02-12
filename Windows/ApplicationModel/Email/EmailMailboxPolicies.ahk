#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxPolicies.ahk
#Include .\IEmailMailboxPolicies2.ahk
#Include .\IEmailMailboxPolicies3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the encryption and signing policies associates with an email mailbox.
 * @remarks
 * The **Policies ** property provides access to an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxpolicies
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxPolicies extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxPolicies

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxPolicies.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the allowable SMIME encryption algorithms for the purpose of negotiating with an app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxpolicies.allowedsmimeencryptionalgorithmnegotiation
     * @type {Integer} 
     */
    AllowedSmimeEncryptionAlgorithmNegotiation {
        get => this.get_AllowedSmimeEncryptionAlgorithmNegotiation()
        set => this.put_AllowedSmimeEncryptionAlgorithmNegotiation(value)
    }

    /**
     * Gets or sets a Boolean value that indicates whether software certificates are allowed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxpolicies.allowsmimesoftcertificates
     * @type {Boolean} 
     */
    AllowSmimeSoftCertificates {
        get => this.get_AllowSmimeSoftCertificates()
        set => this.put_AllowSmimeSoftCertificates(value)
    }

    /**
     * Gets or sets the required SMIME encryption algorithm.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxpolicies.requiredsmimeencryptionalgorithm
     * @type {IReference<Integer>} 
     */
    RequiredSmimeEncryptionAlgorithm {
        get => this.get_RequiredSmimeEncryptionAlgorithm()
        set => this.put_RequiredSmimeEncryptionAlgorithm(value)
    }

    /**
     * Gets or sets the required SMIME signing algorithm.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxpolicies.requiredsmimesigningalgorithm
     * @type {IReference<Integer>} 
     */
    RequiredSmimeSigningAlgorithm {
        get => this.get_RequiredSmimeSigningAlgorithm()
        set => this.put_RequiredSmimeSigningAlgorithm(value)
    }

    /**
     * Gets or sets a Boolean value that indicates whether the sync provider that represents the email mailbox only accepts encrypted messages.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxpolicies.mustencryptsmimemessages
     * @type {Boolean} 
     */
    MustEncryptSmimeMessages {
        get => this.get_MustEncryptSmimeMessages()
        set => this.put_MustEncryptSmimeMessages(value)
    }

    /**
     * Gets or sets a Boolean value that indicates whether the sync provider that represents the email mailbox only accepts signed messages.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxpolicies.mustsignsmimemessages
     * @type {Boolean} 
     */
    MustSignSmimeMessages {
        get => this.get_MustSignSmimeMessages()
        set => this.put_MustSignSmimeMessages(value)
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
    get_AllowedSmimeEncryptionAlgorithmNegotiation() {
        if (!this.HasProp("__IEmailMailboxPolicies")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxPolicies.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxPolicies := IEmailMailboxPolicies(outPtr)
        }

        return this.__IEmailMailboxPolicies.get_AllowedSmimeEncryptionAlgorithmNegotiation()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowSmimeSoftCertificates() {
        if (!this.HasProp("__IEmailMailboxPolicies")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxPolicies.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxPolicies := IEmailMailboxPolicies(outPtr)
        }

        return this.__IEmailMailboxPolicies.get_AllowSmimeSoftCertificates()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_RequiredSmimeEncryptionAlgorithm() {
        if (!this.HasProp("__IEmailMailboxPolicies")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxPolicies.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxPolicies := IEmailMailboxPolicies(outPtr)
        }

        return this.__IEmailMailboxPolicies.get_RequiredSmimeEncryptionAlgorithm()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_RequiredSmimeSigningAlgorithm() {
        if (!this.HasProp("__IEmailMailboxPolicies")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxPolicies.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxPolicies := IEmailMailboxPolicies(outPtr)
        }

        return this.__IEmailMailboxPolicies.get_RequiredSmimeSigningAlgorithm()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MustEncryptSmimeMessages() {
        if (!this.HasProp("__IEmailMailboxPolicies2")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxPolicies2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxPolicies2 := IEmailMailboxPolicies2(outPtr)
        }

        return this.__IEmailMailboxPolicies2.get_MustEncryptSmimeMessages()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MustSignSmimeMessages() {
        if (!this.HasProp("__IEmailMailboxPolicies2")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxPolicies2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxPolicies2 := IEmailMailboxPolicies2(outPtr)
        }

        return this.__IEmailMailboxPolicies2.get_MustSignSmimeMessages()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AllowedSmimeEncryptionAlgorithmNegotiation(value) {
        if (!this.HasProp("__IEmailMailboxPolicies3")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxPolicies3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxPolicies3 := IEmailMailboxPolicies3(outPtr)
        }

        return this.__IEmailMailboxPolicies3.put_AllowedSmimeEncryptionAlgorithmNegotiation(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowSmimeSoftCertificates(value) {
        if (!this.HasProp("__IEmailMailboxPolicies3")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxPolicies3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxPolicies3 := IEmailMailboxPolicies3(outPtr)
        }

        return this.__IEmailMailboxPolicies3.put_AllowSmimeSoftCertificates(value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_RequiredSmimeEncryptionAlgorithm(value) {
        if (!this.HasProp("__IEmailMailboxPolicies3")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxPolicies3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxPolicies3 := IEmailMailboxPolicies3(outPtr)
        }

        return this.__IEmailMailboxPolicies3.put_RequiredSmimeEncryptionAlgorithm(value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_RequiredSmimeSigningAlgorithm(value) {
        if (!this.HasProp("__IEmailMailboxPolicies3")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxPolicies3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxPolicies3 := IEmailMailboxPolicies3(outPtr)
        }

        return this.__IEmailMailboxPolicies3.put_RequiredSmimeSigningAlgorithm(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_MustEncryptSmimeMessages(value) {
        if (!this.HasProp("__IEmailMailboxPolicies3")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxPolicies3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxPolicies3 := IEmailMailboxPolicies3(outPtr)
        }

        return this.__IEmailMailboxPolicies3.put_MustEncryptSmimeMessages(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_MustSignSmimeMessages(value) {
        if (!this.HasProp("__IEmailMailboxPolicies3")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxPolicies3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxPolicies3 := IEmailMailboxPolicies3(outPtr)
        }

        return this.__IEmailMailboxPolicies3.put_MustSignSmimeMessages(value)
    }

;@endregion Instance Methods
}
