#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxAutoReply.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an auto-reply message set on a mailbox.
 * @remarks
 * Call **InternalReply** or **KnownExternalReply** or **UnknownExternalReply** to get an instance of this class.
 * 
 * The functionality described in this topic is not available to all UWP apps. As part of the store app submission process, Microsoft must approve your use of these APIs and provision your developer account before you can publish an app that uses them.
 * 
 * For more information about the [Windows.ApplicationModel.Email](windows_applicationmodel_email.md) namespace, please work with your Microsoft Account Team representative.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxautoreply
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxAutoReply extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxAutoReply

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxAutoReply.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a Boolean value that indicates if the auto-reply message is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxautoreply.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * Gets or sets the auto-reply response text.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxautoreply.response
     * @type {HSTRING} 
     */
    Response {
        get => this.get_Response()
        set => this.put_Response(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IEmailMailboxAutoReply")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxAutoReply.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxAutoReply := IEmailMailboxAutoReply(outPtr)
        }

        return this.__IEmailMailboxAutoReply.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        if (!this.HasProp("__IEmailMailboxAutoReply")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxAutoReply.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxAutoReply := IEmailMailboxAutoReply(outPtr)
        }

        return this.__IEmailMailboxAutoReply.put_IsEnabled(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Response() {
        if (!this.HasProp("__IEmailMailboxAutoReply")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxAutoReply.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxAutoReply := IEmailMailboxAutoReply(outPtr)
        }

        return this.__IEmailMailboxAutoReply.get_Response()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Response(value) {
        if (!this.HasProp("__IEmailMailboxAutoReply")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxAutoReply.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxAutoReply := IEmailMailboxAutoReply(outPtr)
        }

        return this.__IEmailMailboxAutoReply.put_Response(value)
    }

;@endregion Instance Methods
}
