#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMessageBatch.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a collection of email messages.
 * @remarks
 * The functionality described in this topic is not available to all UWP apps. As part of the store app submission process, Microsoft must approve your use of these APIs and provision your developer account before you can publish an app that uses them.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessagebatch
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMessageBatch extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMessageBatch

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMessageBatch.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a batch of email messages.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessagebatch.messages
     * @type {IVectorView<EmailMessage>} 
     */
    Messages {
        get => this.get_Messages()
    }

    /**
     * Gets the status of the email batch read.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessagebatch.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<EmailMessage>} 
     */
    get_Messages() {
        if (!this.HasProp("__IEmailMessageBatch")) {
            if ((queryResult := this.QueryInterface(IEmailMessageBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessageBatch := IEmailMessageBatch(outPtr)
        }

        return this.__IEmailMessageBatch.get_Messages()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IEmailMessageBatch")) {
            if ((queryResult := this.QueryInterface(IEmailMessageBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessageBatch := IEmailMessageBatch(outPtr)
        }

        return this.__IEmailMessageBatch.get_Status()
    }

;@endregion Instance Methods
}
