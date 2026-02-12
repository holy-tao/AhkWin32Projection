#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMessageReader.ahk
#Include ..\..\..\Guid.ahk

/**
 * Gets a batch of email messages.
 * @remarks
 * Call **GetMessageReader** or **GetMessageReader(EmailQueryOptions)** to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessagereader
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMessageReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMessageReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMessageReader.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Reads a collection of email messages.
     * @returns {IAsyncOperation<EmailMessageBatch>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessagereader.readbatchasync
     */
    ReadBatchAsync() {
        if (!this.HasProp("__IEmailMessageReader")) {
            if ((queryResult := this.QueryInterface(IEmailMessageReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessageReader := IEmailMessageReader(outPtr)
        }

        return this.__IEmailMessageReader.ReadBatchAsync()
    }

;@endregion Instance Methods
}
