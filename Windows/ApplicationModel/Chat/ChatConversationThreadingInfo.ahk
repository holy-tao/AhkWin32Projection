#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatConversationThreadingInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides threading info for a [ChatConversation](chatconversation.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversationthreadinginfo
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatConversationThreadingInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatConversationThreadingInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatConversationThreadingInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the [Contact.Id](../windows.applicationmodel.contacts/contact_id.md) for the remote participant.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversationthreadinginfo.contactid
     * @type {HSTRING} 
     */
    ContactId {
        get => this.get_ContactId()
        set => this.put_ContactId(value)
    }

    /**
     * Gets or sets a string where you can store your own custom threading info.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversationthreadinginfo.custom
     * @type {HSTRING} 
     */
    Custom {
        get => this.get_Custom()
        set => this.put_Custom(value)
    }

    /**
     * Gets or sets the ID of the [ChatConversation](chatconversation.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversationthreadinginfo.conversationid
     * @type {HSTRING} 
     */
    ConversationId {
        get => this.get_ConversationId()
        set => this.put_ConversationId(value)
    }

    /**
     * Gets the list of participants in the [ChatConversation](chatconversation.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversationthreadinginfo.participants
     * @type {IVector<HSTRING>} 
     */
    Participants {
        get => this.get_Participants()
    }

    /**
     * Gets or sets a value that indicates the type of threading info, such as participant, contact ID, conversation ID, and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversationthreadinginfo.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
        set => this.put_Kind(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ChatConversationThreadingInfo](chatconversationthreadinginfo.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.ChatConversationThreadingInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContactId() {
        if (!this.HasProp("__IChatConversationThreadingInfo")) {
            if ((queryResult := this.QueryInterface(IChatConversationThreadingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversationThreadingInfo := IChatConversationThreadingInfo(outPtr)
        }

        return this.__IChatConversationThreadingInfo.get_ContactId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContactId(value) {
        if (!this.HasProp("__IChatConversationThreadingInfo")) {
            if ((queryResult := this.QueryInterface(IChatConversationThreadingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversationThreadingInfo := IChatConversationThreadingInfo(outPtr)
        }

        return this.__IChatConversationThreadingInfo.put_ContactId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Custom() {
        if (!this.HasProp("__IChatConversationThreadingInfo")) {
            if ((queryResult := this.QueryInterface(IChatConversationThreadingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversationThreadingInfo := IChatConversationThreadingInfo(outPtr)
        }

        return this.__IChatConversationThreadingInfo.get_Custom()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Custom(value) {
        if (!this.HasProp("__IChatConversationThreadingInfo")) {
            if ((queryResult := this.QueryInterface(IChatConversationThreadingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversationThreadingInfo := IChatConversationThreadingInfo(outPtr)
        }

        return this.__IChatConversationThreadingInfo.put_Custom(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ConversationId() {
        if (!this.HasProp("__IChatConversationThreadingInfo")) {
            if ((queryResult := this.QueryInterface(IChatConversationThreadingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversationThreadingInfo := IChatConversationThreadingInfo(outPtr)
        }

        return this.__IChatConversationThreadingInfo.get_ConversationId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ConversationId(value) {
        if (!this.HasProp("__IChatConversationThreadingInfo")) {
            if ((queryResult := this.QueryInterface(IChatConversationThreadingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversationThreadingInfo := IChatConversationThreadingInfo(outPtr)
        }

        return this.__IChatConversationThreadingInfo.put_ConversationId(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Participants() {
        if (!this.HasProp("__IChatConversationThreadingInfo")) {
            if ((queryResult := this.QueryInterface(IChatConversationThreadingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversationThreadingInfo := IChatConversationThreadingInfo(outPtr)
        }

        return this.__IChatConversationThreadingInfo.get_Participants()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IChatConversationThreadingInfo")) {
            if ((queryResult := this.QueryInterface(IChatConversationThreadingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversationThreadingInfo := IChatConversationThreadingInfo(outPtr)
        }

        return this.__IChatConversationThreadingInfo.get_Kind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Kind(value) {
        if (!this.HasProp("__IChatConversationThreadingInfo")) {
            if ((queryResult := this.QueryInterface(IChatConversationThreadingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversationThreadingInfo := IChatConversationThreadingInfo(outPtr)
        }

        return this.__IChatConversationThreadingInfo.put_Kind(value)
    }

;@endregion Instance Methods
}
