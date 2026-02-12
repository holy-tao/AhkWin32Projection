#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatMessage.ahk
#Include .\IChatMessage2.ahk
#Include .\IChatMessage3.ahk
#Include .\IChatMessage4.ahk
#Include .\IChatItem.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a chat message.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatMessage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a list of chat message attachments.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.attachments
     * @type {IVector<ChatMessageAttachment>} 
     */
    Attachments {
        get => this.get_Attachments()
    }

    /**
     * Gets or sets the body of the chat message.
     * @remarks
     * When an application invokes the compose task, the Body property can contain an initialized string value to appear when the compose task is launched.
     * 
     * If a message has more than one recipient and group text is enabled, the default case, the message is sent as an MMS message. In this situation, the message text is included as the first attachment and not in the Body. For a message with a single recipient, the Body is used for an SMS message and [Subject](chatmessage_subject.md) property is valid for an MMS message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.body
     * @type {HSTRING} 
     */
    Body {
        get => this.get_Body()
        set => this.put_Body(value)
    }

    /**
     * Gets the identifier or address of the sender of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.from
     * @type {HSTRING} 
     */
    From {
        get => this.get_From()
        set => this.put_From(value)
    }

    /**
     * Gets the identifier of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets a Boolean value indicating if forwarding is disabled.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.isforwardingdisabled
     * @type {Boolean} 
     */
    IsForwardingDisabled {
        get => this.get_IsForwardingDisabled()
        set => this.put_IsForwardingDisabled(value)
    }

    /**
     * Gets Boolean a value indicating if the message is incoming or outgoing.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.isincoming
     * @type {Boolean} 
     */
    IsIncoming {
        get => this.get_IsIncoming()
        set => this.put_IsIncoming(value)
    }

    /**
     * Gets a Boolean value indicating if the message has been read.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.isread
     * @type {Boolean} 
     */
    IsRead {
        get => this.get_IsRead()
        set => this.put_IsRead(value)
    }

    /**
     * Gets the local timestamp of the message.
     * @remarks
     * The value for LocalTimestamp is the local time of the device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.localtimestamp
     * @type {DateTime} 
     */
    LocalTimestamp {
        get => this.get_LocalTimestamp()
        set => this.put_LocalTimestamp(value)
    }

    /**
     * Gets the network timestamp of the message.
     * @remarks
     * The value for NetworkTimestamp is the phone network based time for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.networktimestamp
     * @type {DateTime} 
     */
    NetworkTimestamp {
        get => this.get_NetworkTimestamp()
        set => this.put_NetworkTimestamp(value)
    }

    /**
     * Gets the list of recipients of the message.
     * @remarks
     * The recipient strings in the list can be either contact names, addresses, or phone numbers.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.recipients
     * @type {IVector<HSTRING>} 
     */
    Recipients {
        get => this.get_Recipients()
    }

    /**
     * Gets the list of send statuses for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.recipientsendstatuses
     * @type {IMapView<HSTRING, Integer>} 
     */
    RecipientSendStatuses {
        get => this.get_RecipientSendStatuses()
    }

    /**
     * Gets the status of the message. Typical states include draft, sent, received, deleted, etc.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
        set => this.put_Status(value)
    }

    /**
     * Gets the subject of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.subject
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
        set => this.put_Subject(value)
    }

    /**
     * Gets the transport friendly name of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.transportfriendlyname
     * @type {HSTRING} 
     */
    TransportFriendlyName {
        get => this.get_TransportFriendlyName()
    }

    /**
     * Gets or sets the transport ID of the message.
     * @remarks
     * Setting this property assigns the transport, SIM slot, to use for sending the chat message. Querying this property will identify the transport that the message was received on or is currently set for sending.
     * 
     * The value for TransportId is the string representation of the SIM slot number.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.transportid
     * @type {HSTRING} 
     */
    TransportId {
        get => this.get_TransportId()
        set => this.put_TransportId(value)
    }

    /**
     * Gets or sets the estimated size of a file to be sent or received.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.estimateddownloadsize
     * @type {Integer} 
     */
    EstimatedDownloadSize {
        get => this.get_EstimatedDownloadSize()
        set => this.put_EstimatedDownloadSize(value)
    }

    /**
     * Gets or sets a Boolean value indicating if the message is an auto-reply.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.isautoreply
     * @type {Boolean} 
     */
    IsAutoReply {
        get => this.get_IsAutoReply()
        set => this.put_IsAutoReply(value)
    }

    /**
     * Gets a Boolean value indicating if reply is disabled on the [ChatMessage](chatmessage.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.isreplydisabled
     * @type {Boolean} 
     */
    IsReplyDisabled {
        get => this.get_IsReplyDisabled()
    }

    /**
     * Gets or sets a Boolean value indicating if the message has been seen.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.isseen
     * @type {Boolean} 
     */
    IsSeen {
        get => this.get_IsSeen()
        set => this.put_IsSeen(value)
    }

    /**
     * Gets a Boolean value indicating if the message is stored on a SIM card.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.issimmessage
     * @type {Boolean} 
     */
    IsSimMessage {
        get => this.get_IsSimMessage()
    }

    /**
     * Gets or sets the type of the [ChatMessage](chatmessage.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.messagekind
     * @type {Integer} 
     */
    MessageKind {
        get => this.get_MessageKind()
        set => this.put_MessageKind(value)
    }

    /**
     * Gets or sets a value indicating the type of message operator, such as SMS, MMS, or RCS.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.messageoperatorkind
     * @type {Integer} 
     */
    MessageOperatorKind {
        get => this.get_MessageOperatorKind()
        set => this.put_MessageOperatorKind(value)
    }

    /**
     * Gets or sets a Boolean value indicating if the message was received during user specified quiet hours.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.isreceivedduringquiethours
     * @type {Boolean} 
     */
    IsReceivedDuringQuietHours {
        get => this.get_IsReceivedDuringQuietHours()
        set => this.put_IsReceivedDuringQuietHours(value)
    }

    /**
     * Gets or sets the remote ID for the [ChatMessage](chatmessage.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.remoteid
     * @type {HSTRING} 
     */
    RemoteId {
        get => this.get_RemoteId()
        set => this.put_RemoteId(value)
    }

    /**
     * Gets or sets a Boolean value indicating if notification of receiving the [ChatMessage](chatmessage.md) should be suppressed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.shouldsuppressnotification
     * @type {Boolean} 
     */
    ShouldSuppressNotification {
        get => this.get_ShouldSuppressNotification()
        set => this.put_ShouldSuppressNotification(value)
    }

    /**
     * Gets or sets the conversation threading info for the [ChatMessage](chatmessage.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.threadinginfo
     * @type {ChatConversationThreadingInfo} 
     */
    ThreadingInfo {
        get => this.get_ThreadingInfo()
        set => this.put_ThreadingInfo(value)
    }

    /**
     * Gets the delivery info for each of the recipients of the [ChatMessage](chatmessage.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.recipientsdeliveryinfos
     * @type {IVector<ChatRecipientDeliveryInfo>} 
     */
    RecipientsDeliveryInfos {
        get => this.get_RecipientsDeliveryInfos()
    }

    /**
     * The ID used to identify a message across devices. This ID is generated on creation for all messages. Clients that copy messages between devices also need to copy this ID in order to uniquely identify the same message on different devices
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.syncid
     * @type {HSTRING} 
     */
    SyncId {
        get => this.get_SyncId()
        set => this.put_SyncId(value)
    }

    /**
     * Gets the item kind.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessage.itemkind
     * @type {Integer} 
     */
    ItemKind {
        get => this.get_ItemKind()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [ChatMessage](chatmessage.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.ChatMessage")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<ChatMessageAttachment>} 
     */
    get_Attachments() {
        if (!this.HasProp("__IChatMessage")) {
            if ((queryResult := this.QueryInterface(IChatMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage := IChatMessage(outPtr)
        }

        return this.__IChatMessage.get_Attachments()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Body() {
        if (!this.HasProp("__IChatMessage")) {
            if ((queryResult := this.QueryInterface(IChatMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage := IChatMessage(outPtr)
        }

        return this.__IChatMessage.get_Body()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Body(value) {
        if (!this.HasProp("__IChatMessage")) {
            if ((queryResult := this.QueryInterface(IChatMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage := IChatMessage(outPtr)
        }

        return this.__IChatMessage.put_Body(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_From() {
        if (!this.HasProp("__IChatMessage")) {
            if ((queryResult := this.QueryInterface(IChatMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage := IChatMessage(outPtr)
        }

        return this.__IChatMessage.get_From()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IChatMessage")) {
            if ((queryResult := this.QueryInterface(IChatMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage := IChatMessage(outPtr)
        }

        return this.__IChatMessage.get_Id()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsForwardingDisabled() {
        if (!this.HasProp("__IChatMessage")) {
            if ((queryResult := this.QueryInterface(IChatMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage := IChatMessage(outPtr)
        }

        return this.__IChatMessage.get_IsForwardingDisabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIncoming() {
        if (!this.HasProp("__IChatMessage")) {
            if ((queryResult := this.QueryInterface(IChatMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage := IChatMessage(outPtr)
        }

        return this.__IChatMessage.get_IsIncoming()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRead() {
        if (!this.HasProp("__IChatMessage")) {
            if ((queryResult := this.QueryInterface(IChatMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage := IChatMessage(outPtr)
        }

        return this.__IChatMessage.get_IsRead()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LocalTimestamp() {
        if (!this.HasProp("__IChatMessage")) {
            if ((queryResult := this.QueryInterface(IChatMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage := IChatMessage(outPtr)
        }

        return this.__IChatMessage.get_LocalTimestamp()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_NetworkTimestamp() {
        if (!this.HasProp("__IChatMessage")) {
            if ((queryResult := this.QueryInterface(IChatMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage := IChatMessage(outPtr)
        }

        return this.__IChatMessage.get_NetworkTimestamp()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Recipients() {
        if (!this.HasProp("__IChatMessage")) {
            if ((queryResult := this.QueryInterface(IChatMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage := IChatMessage(outPtr)
        }

        return this.__IChatMessage.get_Recipients()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, Integer>} 
     */
    get_RecipientSendStatuses() {
        if (!this.HasProp("__IChatMessage")) {
            if ((queryResult := this.QueryInterface(IChatMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage := IChatMessage(outPtr)
        }

        return this.__IChatMessage.get_RecipientSendStatuses()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IChatMessage")) {
            if ((queryResult := this.QueryInterface(IChatMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage := IChatMessage(outPtr)
        }

        return this.__IChatMessage.get_Status()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        if (!this.HasProp("__IChatMessage")) {
            if ((queryResult := this.QueryInterface(IChatMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage := IChatMessage(outPtr)
        }

        return this.__IChatMessage.get_Subject()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TransportFriendlyName() {
        if (!this.HasProp("__IChatMessage")) {
            if ((queryResult := this.QueryInterface(IChatMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage := IChatMessage(outPtr)
        }

        return this.__IChatMessage.get_TransportFriendlyName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TransportId() {
        if (!this.HasProp("__IChatMessage")) {
            if ((queryResult := this.QueryInterface(IChatMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage := IChatMessage(outPtr)
        }

        return this.__IChatMessage.get_TransportId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TransportId(value) {
        if (!this.HasProp("__IChatMessage")) {
            if ((queryResult := this.QueryInterface(IChatMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage := IChatMessage(outPtr)
        }

        return this.__IChatMessage.put_TransportId(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EstimatedDownloadSize() {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.get_EstimatedDownloadSize()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_EstimatedDownloadSize(value) {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.put_EstimatedDownloadSize(value)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_From(value) {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.put_From(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAutoReply() {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.get_IsAutoReply()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAutoReply(value) {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.put_IsAutoReply(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsForwardingDisabled(value) {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.put_IsForwardingDisabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReplyDisabled() {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.get_IsReplyDisabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsIncoming(value) {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.put_IsIncoming(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsRead(value) {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.put_IsRead(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSeen() {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.get_IsSeen()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSeen(value) {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.put_IsSeen(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSimMessage() {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.get_IsSimMessage()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_LocalTimestamp(value) {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.put_LocalTimestamp(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageKind() {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.get_MessageKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MessageKind(value) {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.put_MessageKind(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageOperatorKind() {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.get_MessageOperatorKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MessageOperatorKind(value) {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.put_MessageOperatorKind(value)
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_NetworkTimestamp(value) {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.put_NetworkTimestamp(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReceivedDuringQuietHours() {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.get_IsReceivedDuringQuietHours()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsReceivedDuringQuietHours(value) {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.put_IsReceivedDuringQuietHours(value)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RemoteId(value) {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.put_RemoteId(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Status(value) {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.put_Status(value)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Subject(value) {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.put_Subject(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldSuppressNotification() {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.get_ShouldSuppressNotification()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShouldSuppressNotification(value) {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.put_ShouldSuppressNotification(value)
    }

    /**
     * 
     * @returns {ChatConversationThreadingInfo} 
     */
    get_ThreadingInfo() {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.get_ThreadingInfo()
    }

    /**
     * 
     * @param {ChatConversationThreadingInfo} value 
     * @returns {HRESULT} 
     */
    put_ThreadingInfo(value) {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.put_ThreadingInfo(value)
    }

    /**
     * 
     * @returns {IVector<ChatRecipientDeliveryInfo>} 
     */
    get_RecipientsDeliveryInfos() {
        if (!this.HasProp("__IChatMessage2")) {
            if ((queryResult := this.QueryInterface(IChatMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage2 := IChatMessage2(outPtr)
        }

        return this.__IChatMessage2.get_RecipientsDeliveryInfos()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteId() {
        if (!this.HasProp("__IChatMessage3")) {
            if ((queryResult := this.QueryInterface(IChatMessage3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage3 := IChatMessage3(outPtr)
        }

        return this.__IChatMessage3.get_RemoteId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SyncId() {
        if (!this.HasProp("__IChatMessage4")) {
            if ((queryResult := this.QueryInterface(IChatMessage4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage4 := IChatMessage4(outPtr)
        }

        return this.__IChatMessage4.get_SyncId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SyncId(value) {
        if (!this.HasProp("__IChatMessage4")) {
            if ((queryResult := this.QueryInterface(IChatMessage4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessage4 := IChatMessage4(outPtr)
        }

        return this.__IChatMessage4.put_SyncId(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItemKind() {
        if (!this.HasProp("__IChatItem")) {
            if ((queryResult := this.QueryInterface(IChatItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatItem := IChatItem(outPtr)
        }

        return this.__IChatItem.get_ItemKind()
    }

;@endregion Instance Methods
}
