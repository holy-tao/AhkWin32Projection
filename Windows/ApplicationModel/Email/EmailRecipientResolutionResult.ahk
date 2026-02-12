#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailRecipientResolutionResult.ahk
#Include .\IEmailRecipientResolutionResult2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of an attempt to resolve an email recipient.
 * @remarks
 * Call [ResolveRecipientsAsync](emailmailbox_resolverecipientsasync_1555064140.md) to retrieve an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailrecipientresolutionresult
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailRecipientResolutionResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailRecipientResolutionResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailRecipientResolutionResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the state of an attempt to resolve an email recipient.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailrecipientresolutionresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
        set => this.put_Status(value)
    }

    /**
     * Gets the public key for an email recipient.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailrecipientresolutionresult.publickeys
     * @type {IVectorView<Certificate>} 
     */
    PublicKeys {
        get => this.get_PublicKeys()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Instantiates a new instance of the [EmailRecipientResolutionResult](emailrecipientresolutionresult.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Email.EmailRecipientResolutionResult")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IEmailRecipientResolutionResult")) {
            if ((queryResult := this.QueryInterface(IEmailRecipientResolutionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailRecipientResolutionResult := IEmailRecipientResolutionResult(outPtr)
        }

        return this.__IEmailRecipientResolutionResult.get_Status()
    }

    /**
     * 
     * @returns {IVectorView<Certificate>} 
     */
    get_PublicKeys() {
        if (!this.HasProp("__IEmailRecipientResolutionResult")) {
            if ((queryResult := this.QueryInterface(IEmailRecipientResolutionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailRecipientResolutionResult := IEmailRecipientResolutionResult(outPtr)
        }

        return this.__IEmailRecipientResolutionResult.get_PublicKeys()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Status(value) {
        if (!this.HasProp("__IEmailRecipientResolutionResult2")) {
            if ((queryResult := this.QueryInterface(IEmailRecipientResolutionResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailRecipientResolutionResult2 := IEmailRecipientResolutionResult2(outPtr)
        }

        return this.__IEmailRecipientResolutionResult2.put_Status(value)
    }

    /**
     * Sets the public keys for an email recipient.
     * @param {IIterable<Certificate>} value An iterable collection of certificates.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailrecipientresolutionresult.setpublickeys
     */
    SetPublicKeys(value) {
        if (!this.HasProp("__IEmailRecipientResolutionResult2")) {
            if ((queryResult := this.QueryInterface(IEmailRecipientResolutionResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailRecipientResolutionResult2 := IEmailRecipientResolutionResult2(outPtr)
        }

        return this.__IEmailRecipientResolutionResult2.SetPublicKeys(value)
    }

;@endregion Instance Methods
}
