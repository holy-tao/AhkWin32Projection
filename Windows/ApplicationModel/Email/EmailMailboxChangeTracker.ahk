#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxChangeTracker.ahk
#Include ..\..\..\Guid.ahk

/**
 * The functionality described in this topic is not available to all UWP apps. As part of the store app submission process, Microsoft must approve your use of these APIs and provision your developer account before you can publish an app that uses them.
  * 
  * For more information about the [Windows.ApplicationModel.Email](windows_applicationmodel_email.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * Call **ChangeTracker** to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxchangetracker
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxChangeTracker extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxChangeTracker

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxChangeTracker.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a Boolean value indicating whether change tracking is active.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxchangetracker.istracking
     * @type {Boolean} 
     */
    IsTracking {
        get => this.get_IsTracking()
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
    get_IsTracking() {
        if (!this.HasProp("__IEmailMailboxChangeTracker")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxChangeTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxChangeTracker := IEmailMailboxChangeTracker(outPtr)
        }

        return this.__IEmailMailboxChangeTracker.get_IsTracking()
    }

    /**
     * Enables change tracking on a mailbox.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxchangetracker.enable
     */
    Enable() {
        if (!this.HasProp("__IEmailMailboxChangeTracker")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxChangeTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxChangeTracker := IEmailMailboxChangeTracker(outPtr)
        }

        return this.__IEmailMailboxChangeTracker.Enable()
    }

    /**
     * Gets a reader that will read a batch of changes.
     * @returns {EmailMailboxChangeReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxchangetracker.getchangereader
     */
    GetChangeReader() {
        if (!this.HasProp("__IEmailMailboxChangeTracker")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxChangeTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxChangeTracker := IEmailMailboxChangeTracker(outPtr)
        }

        return this.__IEmailMailboxChangeTracker.GetChangeReader()
    }

    /**
     * Moves the change tracking cursor to now.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxchangetracker.reset
     */
    Reset() {
        if (!this.HasProp("__IEmailMailboxChangeTracker")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxChangeTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxChangeTracker := IEmailMailboxChangeTracker(outPtr)
        }

        return this.__IEmailMailboxChangeTracker.Reset()
    }

;@endregion Instance Methods
}
