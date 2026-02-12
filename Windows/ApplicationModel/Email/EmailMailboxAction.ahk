#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxAction.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data about a change that occurred to a mailbox.
 * @remarks
 * The functionality described in this topic is not available to all UWP apps. As part of the store app submission process, Microsoft must approve your use of these APIs and provision your developer account before you can publish an app that uses them.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxaction
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxAction extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxAction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxAction.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the value that represents the kind of change that happened to the mailbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxaction.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the number that identifies the change that happened to the mailbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxaction.changenumber
     * @type {Integer} 
     */
    ChangeNumber {
        get => this.get_ChangeNumber()
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
    get_Kind() {
        if (!this.HasProp("__IEmailMailboxAction")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxAction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxAction := IEmailMailboxAction(outPtr)
        }

        return this.__IEmailMailboxAction.get_Kind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChangeNumber() {
        if (!this.HasProp("__IEmailMailboxAction")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxAction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxAction := IEmailMailboxAction(outPtr)
        }

        return this.__IEmailMailboxAction.get_ChangeNumber()
    }

;@endregion Instance Methods
}
