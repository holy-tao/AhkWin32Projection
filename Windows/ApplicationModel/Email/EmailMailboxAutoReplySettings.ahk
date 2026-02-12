#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxAutoReplySettings.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the settings for the automatic reply functionality of an email account.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxautoreplysettings
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxAutoReplySettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxAutoReplySettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxAutoReplySettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a Boolean value indicating whether automatic replies are enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxautoreplysettings.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * Gets or sets whether the automated response email message is encoded as HTML or plain text.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxautoreplysettings.responsekind
     * @type {Integer} 
     */
    ResponseKind {
        get => this.get_ResponseKind()
        set => this.put_ResponseKind(value)
    }

    /**
     * Represents the start time for the automated reply period.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxautoreplysettings.starttime
     * @type {IReference<DateTime>} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * Represents the end time for the automated reply period.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxautoreplysettings.endtime
     * @type {IReference<DateTime>} 
     */
    EndTime {
        get => this.get_EndTime()
        set => this.put_EndTime(value)
    }

    /**
     * Gets the automatic reply message intended for an email message from an internal sender.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxautoreplysettings.internalreply
     * @type {EmailMailboxAutoReply} 
     */
    InternalReply {
        get => this.get_InternalReply()
    }

    /**
     * Gets the automatic reply message intended for an email message from a known external sender.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxautoreplysettings.knownexternalreply
     * @type {EmailMailboxAutoReply} 
     */
    KnownExternalReply {
        get => this.get_KnownExternalReply()
    }

    /**
     * Gets the automatic reply message intended for an email message from an unknown external sender.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxautoreplysettings.unknownexternalreply
     * @type {EmailMailboxAutoReply} 
     */
    UnknownExternalReply {
        get => this.get_UnknownExternalReply()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of an  object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Email.EmailMailboxAutoReplySettings")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IEmailMailboxAutoReplySettings")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxAutoReplySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxAutoReplySettings := IEmailMailboxAutoReplySettings(outPtr)
        }

        return this.__IEmailMailboxAutoReplySettings.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        if (!this.HasProp("__IEmailMailboxAutoReplySettings")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxAutoReplySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxAutoReplySettings := IEmailMailboxAutoReplySettings(outPtr)
        }

        return this.__IEmailMailboxAutoReplySettings.put_IsEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResponseKind() {
        if (!this.HasProp("__IEmailMailboxAutoReplySettings")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxAutoReplySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxAutoReplySettings := IEmailMailboxAutoReplySettings(outPtr)
        }

        return this.__IEmailMailboxAutoReplySettings.get_ResponseKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ResponseKind(value) {
        if (!this.HasProp("__IEmailMailboxAutoReplySettings")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxAutoReplySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxAutoReplySettings := IEmailMailboxAutoReplySettings(outPtr)
        }

        return this.__IEmailMailboxAutoReplySettings.put_ResponseKind(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_StartTime() {
        if (!this.HasProp("__IEmailMailboxAutoReplySettings")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxAutoReplySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxAutoReplySettings := IEmailMailboxAutoReplySettings(outPtr)
        }

        return this.__IEmailMailboxAutoReplySettings.get_StartTime()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_StartTime(value) {
        if (!this.HasProp("__IEmailMailboxAutoReplySettings")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxAutoReplySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxAutoReplySettings := IEmailMailboxAutoReplySettings(outPtr)
        }

        return this.__IEmailMailboxAutoReplySettings.put_StartTime(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_EndTime() {
        if (!this.HasProp("__IEmailMailboxAutoReplySettings")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxAutoReplySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxAutoReplySettings := IEmailMailboxAutoReplySettings(outPtr)
        }

        return this.__IEmailMailboxAutoReplySettings.get_EndTime()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_EndTime(value) {
        if (!this.HasProp("__IEmailMailboxAutoReplySettings")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxAutoReplySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxAutoReplySettings := IEmailMailboxAutoReplySettings(outPtr)
        }

        return this.__IEmailMailboxAutoReplySettings.put_EndTime(value)
    }

    /**
     * 
     * @returns {EmailMailboxAutoReply} 
     */
    get_InternalReply() {
        if (!this.HasProp("__IEmailMailboxAutoReplySettings")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxAutoReplySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxAutoReplySettings := IEmailMailboxAutoReplySettings(outPtr)
        }

        return this.__IEmailMailboxAutoReplySettings.get_InternalReply()
    }

    /**
     * 
     * @returns {EmailMailboxAutoReply} 
     */
    get_KnownExternalReply() {
        if (!this.HasProp("__IEmailMailboxAutoReplySettings")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxAutoReplySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxAutoReplySettings := IEmailMailboxAutoReplySettings(outPtr)
        }

        return this.__IEmailMailboxAutoReplySettings.get_KnownExternalReply()
    }

    /**
     * 
     * @returns {EmailMailboxAutoReply} 
     */
    get_UnknownExternalReply() {
        if (!this.HasProp("__IEmailMailboxAutoReplySettings")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxAutoReplySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxAutoReplySettings := IEmailMailboxAutoReplySettings(outPtr)
        }

        return this.__IEmailMailboxAutoReplySettings.get_UnknownExternalReply()
    }

;@endregion Instance Methods
}
