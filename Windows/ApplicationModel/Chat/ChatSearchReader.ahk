#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatSearchReader.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality to search for chat messages in the [ChatMessageStore](chatmessagestore.md).
 * @remarks
 * Call the [ChatMessageStore.GetSearchReader](chatmessagestore_getsearchreader_1103843978.md) method to obtain an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatsearchreader
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatSearchReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatSearchReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatSearchReader.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns a batch of found items matching the search criteria.
     * @returns {IAsyncOperation<IVectorView<IChatItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatsearchreader.readbatchasync
     */
    ReadBatchAsync() {
        if (!this.HasProp("__IChatSearchReader")) {
            if ((queryResult := this.QueryInterface(IChatSearchReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatSearchReader := IChatSearchReader(outPtr)
        }

        return this.__IChatSearchReader.ReadBatchAsync()
    }

    /**
     * Returns a batch of found items matching the search criteria.
     * @param {Integer} count 
     * @returns {IAsyncOperation<IVectorView<IChatItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatsearchreader.readbatchasync
     */
    ReadBatchWithCountAsync(count) {
        if (!this.HasProp("__IChatSearchReader")) {
            if ((queryResult := this.QueryInterface(IChatSearchReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatSearchReader := IChatSearchReader(outPtr)
        }

        return this.__IChatSearchReader.ReadBatchWithCountAsync(count)
    }

;@endregion Instance Methods
}
