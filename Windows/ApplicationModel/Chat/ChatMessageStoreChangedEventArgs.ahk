#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatMessageStoreChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the data for the [ChatMessageStoreChanged](chatmessagestore_storechanged.md) event.
 * @remarks
 * An instance of this class is created by the system and passed as an argument to the [ChatMessageStoreChanged](chatmessagestore_storechanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestorechangedeventargs
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageStoreChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatMessageStoreChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatMessageStoreChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the object that changed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestorechangedeventargs.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the type of change that happened.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestorechangedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IChatMessageStoreChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IChatMessageStoreChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStoreChangedEventArgs := IChatMessageStoreChangedEventArgs(outPtr)
        }

        return this.__IChatMessageStoreChangedEventArgs.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IChatMessageStoreChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IChatMessageStoreChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStoreChangedEventArgs := IChatMessageStoreChangedEventArgs(outPtr)
        }

        return this.__IChatMessageStoreChangedEventArgs.get_Kind()
    }

;@endregion Instance Methods
}
