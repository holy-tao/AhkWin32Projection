#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailConversationBatch.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a group of [EmailConversation](emailconversation.md) objects for batch processing.
 * @remarks
 * Obtain an instance of this class by calling [EmailConversationReader.ReadBatchAsync](emailconversationreader_readbatchasync_888788553.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversationbatch
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailConversationBatch extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailConversationBatch

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailConversationBatch.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a list of [EmailConversation](emailconversation.md) objects to use for batch processing.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversationbatch.conversations
     * @type {IVectorView<EmailConversation>} 
     */
    Conversations {
        get => this.get_Conversations()
    }

    /**
     * Gets the status of the last batch processing operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailconversationbatch.status
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
     * @returns {IVectorView<EmailConversation>} 
     */
    get_Conversations() {
        if (!this.HasProp("__IEmailConversationBatch")) {
            if ((queryResult := this.QueryInterface(IEmailConversationBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailConversationBatch := IEmailConversationBatch(outPtr)
        }

        return this.__IEmailConversationBatch.get_Conversations()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IEmailConversationBatch")) {
            if ((queryResult := this.QueryInterface(IEmailConversationBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailConversationBatch := IEmailConversationBatch(outPtr)
        }

        return this.__IEmailConversationBatch.get_Status()
    }

;@endregion Instance Methods
}
