#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailConversationReader.ahk
#Include ..\..\..\Guid.ahk

/**
 * Reads a batch of email conversations.
 * @remarks
 * Call [GetConversationReader](emailstore_getconversationreader_388570943.md) or [GetConversationReader(EmailQueryOptions)](emailstore_getconversationreader_964157301.md) to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversationreader
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailConversationReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailConversationReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailConversationReader.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Asynchronously reads a batch of email conversations.
     * @returns {IAsyncOperation<EmailConversationBatch>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversationreader.readbatchasync
     */
    ReadBatchAsync() {
        if (!this.HasProp("__IEmailConversationReader")) {
            if ((queryResult := this.QueryInterface(IEmailConversationReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailConversationReader := IEmailConversationReader(outPtr)
        }

        return this.__IEmailConversationReader.ReadBatchAsync()
    }

;@endregion Instance Methods
}
