#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxChangeReader.ahk
#Include ..\..\..\Guid.ahk

/**
 * The functionality described in this topic is not available to all UWP apps. As part of the store app submission process, Microsoft must approve your use of these APIs and provision your developer account before you can publish an app that uses them.
  * 
  * For more information about the [Windows.ApplicationModel.Email](windows_applicationmodel_email.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * Call **GetChangeReader** to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxchangereader
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxChangeReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxChangeReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxChangeReader.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Accepts all changes.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxchangereader.acceptchanges
     */
    AcceptChanges() {
        if (!this.HasProp("__IEmailMailboxChangeReader")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxChangeReader := IEmailMailboxChangeReader(outPtr)
        }

        return this.__IEmailMailboxChangeReader.AcceptChanges()
    }

    /**
     * Accepts all changes through the current change.
     * @param {EmailMailboxChange} lastChangeToAcknowledge The current change.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxchangereader.acceptchangesthrough
     */
    AcceptChangesThrough(lastChangeToAcknowledge) {
        if (!this.HasProp("__IEmailMailboxChangeReader")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxChangeReader := IEmailMailboxChangeReader(outPtr)
        }

        return this.__IEmailMailboxChangeReader.AcceptChangesThrough(lastChangeToAcknowledge)
    }

    /**
     * Reads a collection of changes.
     * @returns {IAsyncOperation<IVectorView<EmailMailboxChange>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxchangereader.readbatchasync
     */
    ReadBatchAsync() {
        if (!this.HasProp("__IEmailMailboxChangeReader")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxChangeReader := IEmailMailboxChangeReader(outPtr)
        }

        return this.__IEmailMailboxChangeReader.ReadBatchAsync()
    }

;@endregion Instance Methods
}
