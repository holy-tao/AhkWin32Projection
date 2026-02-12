#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatMessageReader.ahk
#Include .\IChatMessageReader2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides methods for reading messages from the message store.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagereader
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatMessageReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatMessageReader.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns a batch list of chat messages from the message store limited to the specified size.
     * @returns {IAsyncOperation<IVectorView<ChatMessage>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagereader.readbatchasync
     */
    ReadBatchAsync() {
        if (!this.HasProp("__IChatMessageReader")) {
            if ((queryResult := this.QueryInterface(IChatMessageReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageReader := IChatMessageReader(outPtr)
        }

        return this.__IChatMessageReader.ReadBatchAsync()
    }

    /**
     * Returns a batch list of chat messages from the message store.
     * @remarks
     * This method returns an [IReadOnlyList](/dotnet/api/system.collections.generic.ireadonlylist-1?view=dotnet-uwp-10.0&preserve-view=true) of [ChatMessage class](chatmessage.md) objects. The method is invoked as an [IAsyncOperation](/previous-versions/bb776309(v=vs.85)) as shown in the following example:
     * 
     * ```
     * IReadOnlyList<ChatMessage> msgList = await messageStore.GetMessageReader.ReadBatchAsync();
     * 
     * ```
     * @param {Integer} count 
     * @returns {IAsyncOperation<IVectorView<ChatMessage>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagereader.readbatchasync
     */
    ReadBatchWithCountAsync(count) {
        if (!this.HasProp("__IChatMessageReader2")) {
            if ((queryResult := this.QueryInterface(IChatMessageReader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageReader2 := IChatMessageReader2(outPtr)
        }

        return this.__IChatMessageReader2.ReadBatchWithCountAsync(count)
    }

;@endregion Instance Methods
}
