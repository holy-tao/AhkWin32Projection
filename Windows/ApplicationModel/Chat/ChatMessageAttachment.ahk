#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatMessageAttachment.ahk
#Include .\IChatMessageAttachment2.ahk
#Include .\IChatMessageAttachmentFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an attachment to a chat message.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessageattachment
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageAttachment extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatMessageAttachment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatMessageAttachment.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [ChatMessageAttachment](chatmessageattachment.md) class.
     * @param {HSTRING} mimeType The MIME type of the attachment.
     * @param {IRandomAccessStreamReference} dataStreamReference A stream containing the attachment data.
     * @returns {ChatMessageAttachment} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessageattachment.#ctor
     */
    static CreateChatMessageAttachment(mimeType, dataStreamReference) {
        if (!ChatMessageAttachment.HasProp("__IChatMessageAttachmentFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.ChatMessageAttachment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IChatMessageAttachmentFactory.IID)
            ChatMessageAttachment.__IChatMessageAttachmentFactory := IChatMessageAttachmentFactory(factoryPtr)
        }

        return ChatMessageAttachment.__IChatMessageAttachmentFactory.CreateChatMessageAttachment(mimeType, dataStreamReference)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a stream reference for a message attachment.
     * @remarks
     * The data source for an attachment is accessed through a [IRandomAccessStreamReference](../windows.storage.streams/irandomaccessstreamreference.md) interface. The DataStreamReference property is set to the stream reference that encapsulates the attachment data.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessageattachment.datastreamreference
     * @type {IRandomAccessStreamReference} 
     */
    DataStreamReference {
        get => this.get_DataStreamReference()
        set => this.put_DataStreamReference(value)
    }

    /**
     * Gets or sets the identifier for the attachment group to which this attachment belongs.
     * @remarks
     * Attachment groups contain one or more attachments. All attachments belonging to a message are part of the same group. The GroupId identifies the attachments associated with a particular message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessageattachment.groupid
     * @type {Integer} 
     */
    GroupId {
        get => this.get_GroupId()
        set => this.put_GroupId(value)
    }

    /**
     * Gets or sets the MIME type of the attachment.
     * @remarks
     * A chat application handles an attachment based on the MIME type set in this property. Attachments for outgoing messages have MimeType set to a type string for recipient handling, such as “image/jpeg”.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessageattachment.mimetype
     * @type {HSTRING} 
     */
    MimeType {
        get => this.get_MimeType()
        set => this.put_MimeType(value)
    }

    /**
     * Gets or sets the text encoded representation of the attachment object.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessageattachment.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * Gets or sets the thumbnail image for the attachment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessageattachment.thumbnail
     * @type {IRandomAccessStreamReference} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
        set => this.put_Thumbnail(value)
    }

    /**
     * Gets or sets the progress of transferring the attachment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessageattachment.transferprogress
     * @type {Float} 
     */
    TransferProgress {
        get => this.get_TransferProgress()
        set => this.put_TransferProgress(value)
    }

    /**
     * Gets or sets the original file name of the attachment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessageattachment.originalfilename
     * @type {HSTRING} 
     */
    OriginalFileName {
        get => this.get_OriginalFileName()
        set => this.put_OriginalFileName(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_DataStreamReference() {
        if (!this.HasProp("__IChatMessageAttachment")) {
            if ((queryResult := this.QueryInterface(IChatMessageAttachment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageAttachment := IChatMessageAttachment(outPtr)
        }

        return this.__IChatMessageAttachment.get_DataStreamReference()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_DataStreamReference(value) {
        if (!this.HasProp("__IChatMessageAttachment")) {
            if ((queryResult := this.QueryInterface(IChatMessageAttachment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageAttachment := IChatMessageAttachment(outPtr)
        }

        return this.__IChatMessageAttachment.put_DataStreamReference(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GroupId() {
        if (!this.HasProp("__IChatMessageAttachment")) {
            if ((queryResult := this.QueryInterface(IChatMessageAttachment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageAttachment := IChatMessageAttachment(outPtr)
        }

        return this.__IChatMessageAttachment.get_GroupId()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_GroupId(value) {
        if (!this.HasProp("__IChatMessageAttachment")) {
            if ((queryResult := this.QueryInterface(IChatMessageAttachment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageAttachment := IChatMessageAttachment(outPtr)
        }

        return this.__IChatMessageAttachment.put_GroupId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MimeType() {
        if (!this.HasProp("__IChatMessageAttachment")) {
            if ((queryResult := this.QueryInterface(IChatMessageAttachment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageAttachment := IChatMessageAttachment(outPtr)
        }

        return this.__IChatMessageAttachment.get_MimeType()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_MimeType(value) {
        if (!this.HasProp("__IChatMessageAttachment")) {
            if ((queryResult := this.QueryInterface(IChatMessageAttachment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageAttachment := IChatMessageAttachment(outPtr)
        }

        return this.__IChatMessageAttachment.put_MimeType(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__IChatMessageAttachment")) {
            if ((queryResult := this.QueryInterface(IChatMessageAttachment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageAttachment := IChatMessageAttachment(outPtr)
        }

        return this.__IChatMessageAttachment.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if (!this.HasProp("__IChatMessageAttachment")) {
            if ((queryResult := this.QueryInterface(IChatMessageAttachment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageAttachment := IChatMessageAttachment(outPtr)
        }

        return this.__IChatMessageAttachment.put_Text(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Thumbnail() {
        if (!this.HasProp("__IChatMessageAttachment2")) {
            if ((queryResult := this.QueryInterface(IChatMessageAttachment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageAttachment2 := IChatMessageAttachment2(outPtr)
        }

        return this.__IChatMessageAttachment2.get_Thumbnail()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Thumbnail(value) {
        if (!this.HasProp("__IChatMessageAttachment2")) {
            if ((queryResult := this.QueryInterface(IChatMessageAttachment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageAttachment2 := IChatMessageAttachment2(outPtr)
        }

        return this.__IChatMessageAttachment2.put_Thumbnail(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TransferProgress() {
        if (!this.HasProp("__IChatMessageAttachment2")) {
            if ((queryResult := this.QueryInterface(IChatMessageAttachment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageAttachment2 := IChatMessageAttachment2(outPtr)
        }

        return this.__IChatMessageAttachment2.get_TransferProgress()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_TransferProgress(value) {
        if (!this.HasProp("__IChatMessageAttachment2")) {
            if ((queryResult := this.QueryInterface(IChatMessageAttachment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageAttachment2 := IChatMessageAttachment2(outPtr)
        }

        return this.__IChatMessageAttachment2.put_TransferProgress(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OriginalFileName() {
        if (!this.HasProp("__IChatMessageAttachment2")) {
            if ((queryResult := this.QueryInterface(IChatMessageAttachment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageAttachment2 := IChatMessageAttachment2(outPtr)
        }

        return this.__IChatMessageAttachment2.get_OriginalFileName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_OriginalFileName(value) {
        if (!this.HasProp("__IChatMessageAttachment2")) {
            if ((queryResult := this.QueryInterface(IChatMessageAttachment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageAttachment2 := IChatMessageAttachment2(outPtr)
        }

        return this.__IChatMessageAttachment2.put_OriginalFileName(value)
    }

;@endregion Instance Methods
}
