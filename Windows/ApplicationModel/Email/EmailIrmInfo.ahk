#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailIrmInfo.ahk
#Include .\IEmailIrmInfoFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents email information rights management (IRM) info.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailirminfo
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailIrmInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailIrmInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailIrmInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [EmailIrmInfo](emailirminfo.md) class using the specified IRM expiration time and template.
     * @param {DateTime} expiration The time when the information rights management (IRM) permissions expire.
     * @param {EmailIrmTemplate} irmTemplate The IRM template to apply to the message.
     * @returns {EmailIrmInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailirminfo.#ctor
     */
    static Create(expiration, irmTemplate) {
        if (!EmailIrmInfo.HasProp("__IEmailIrmInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Email.EmailIrmInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEmailIrmInfoFactory.IID)
            EmailIrmInfo.__IEmailIrmInfoFactory := IEmailIrmInfoFactory(factoryPtr)
        }

        return EmailIrmInfo.__IEmailIrmInfoFactory.Create(expiration, irmTemplate)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a Boolean value that indicates if an email message is allowed to be edited.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailirminfo.canedit
     * @type {Boolean} 
     */
    CanEdit {
        get => this.get_CanEdit()
        set => this.put_CanEdit(value)
    }

    /**
     * Gets or sets a Boolean value that indicates if the user can copy the contents of an email message to the clipboard.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailirminfo.canextractdata
     * @type {Boolean} 
     */
    CanExtractData {
        get => this.get_CanExtractData()
        set => this.put_CanExtractData(value)
    }

    /**
     * Gets or sets a Boolean value that indicates if the email message is allowed to be forwarded.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailirminfo.canforward
     * @type {Boolean} 
     */
    CanForward {
        get => this.get_CanForward()
        set => this.put_CanForward(value)
    }

    /**
     * Gets or sets a Boolean value that indicates if the user is allowed to change any of the email recipients when responding.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailirminfo.canmodifyrecipientsonresponse
     * @type {Boolean} 
     */
    CanModifyRecipientsOnResponse {
        get => this.get_CanModifyRecipientsOnResponse()
        set => this.put_CanModifyRecipientsOnResponse(value)
    }

    /**
     * Gets or sets a Boolean value that indicates if the user is allowed to print the contents of the email message or any attachments.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailirminfo.canprintdata
     * @type {Boolean} 
     */
    CanPrintData {
        get => this.get_CanPrintData()
        set => this.put_CanPrintData(value)
    }

    /**
     * Gets or sets a Boolean value that indicates if the recipient is allowed to remove information rights management (IRM) when responding.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailirminfo.canremoveirmonresponse
     * @type {Boolean} 
     */
    CanRemoveIrmOnResponse {
        get => this.get_CanRemoveIrmOnResponse()
        set => this.put_CanRemoveIrmOnResponse(value)
    }

    /**
     * Gets or sets a Boolean value that indicates if the recipient is allowed to reply to the email message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailirminfo.canreply
     * @type {Boolean} 
     */
    CanReply {
        get => this.get_CanReply()
        set => this.put_CanReply(value)
    }

    /**
     * Gets or sets a Boolean value that indicates if the recipient is allowed to reply all to the email message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailirminfo.canreplyall
     * @type {Boolean} 
     */
    CanReplyAll {
        get => this.get_CanReplyAll()
        set => this.put_CanReplyAll(value)
    }

    /**
     * Gets or sets the expiration date for the information rights management (IRM) permissions.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailirminfo.expirationdate
     * @type {DateTime} 
     */
    ExpirationDate {
        get => this.get_ExpirationDate()
        set => this.put_ExpirationDate(value)
    }

    /**
     * Gets or sets a Boolean value that indicates if the sender is the information rights management (IRM) originator.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailirminfo.isirmoriginator
     * @type {Boolean} 
     */
    IsIrmOriginator {
        get => this.get_IsIrmOriginator()
        set => this.put_IsIrmOriginator(value)
    }

    /**
     * Gets or sets a Boolean value that indicates if programmatic access to the message is allowed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailirminfo.isprogramaticaccessallowed
     * @type {Boolean} 
     */
    IsProgramaticAccessAllowed {
        get => this.get_IsProgramaticAccessAllowed()
        set => this.put_IsProgramaticAccessAllowed(value)
    }

    /**
     * Gets or sets the [EmailIrmTemplate](emailirmtemplate.md) used to create the information rights management (IRM) info.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailirminfo.template
     * @type {EmailIrmTemplate} 
     */
    Template {
        get => this.get_Template()
        set => this.put_Template(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [EmailIrmInfo](emailirminfo.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Email.EmailIrmInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanEdit() {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.get_CanEdit()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanEdit(value) {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.put_CanEdit(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanExtractData() {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.get_CanExtractData()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanExtractData(value) {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.put_CanExtractData(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanForward() {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.get_CanForward()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanForward(value) {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.put_CanForward(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanModifyRecipientsOnResponse() {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.get_CanModifyRecipientsOnResponse()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanModifyRecipientsOnResponse(value) {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.put_CanModifyRecipientsOnResponse(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanPrintData() {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.get_CanPrintData()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanPrintData(value) {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.put_CanPrintData(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanRemoveIrmOnResponse() {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.get_CanRemoveIrmOnResponse()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanRemoveIrmOnResponse(value) {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.put_CanRemoveIrmOnResponse(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanReply() {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.get_CanReply()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanReply(value) {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.put_CanReply(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanReplyAll() {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.get_CanReplyAll()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanReplyAll(value) {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.put_CanReplyAll(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ExpirationDate() {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.get_ExpirationDate()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_ExpirationDate(value) {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.put_ExpirationDate(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIrmOriginator() {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.get_IsIrmOriginator()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsIrmOriginator(value) {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.put_IsIrmOriginator(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsProgramaticAccessAllowed() {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.get_IsProgramaticAccessAllowed()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsProgramaticAccessAllowed(value) {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.put_IsProgramaticAccessAllowed(value)
    }

    /**
     * 
     * @returns {EmailIrmTemplate} 
     */
    get_Template() {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.get_Template()
    }

    /**
     * 
     * @param {EmailIrmTemplate} value 
     * @returns {HRESULT} 
     */
    put_Template(value) {
        if (!this.HasProp("__IEmailIrmInfo")) {
            if ((queryResult := this.QueryInterface(IEmailIrmInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmInfo := IEmailIrmInfo(outPtr)
        }

        return this.__IEmailIrmInfo.put_Template(value)
    }

;@endregion Instance Methods
}
