#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMessage.ahk
#Include .\IEmailMessage2.ahk
#Include .\IEmailMessage3.ahk
#Include .\IEmailMessage4.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an email message.
 * @remarks
 * For an example of using this class, see [Send email](/windows/uwp/contacts-and-calendar/sending-email).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMessage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the subject of the email message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.subject
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
        set => this.put_Subject(value)
    }

    /**
     * Gets or sets the body of the email message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.body
     * @type {HSTRING} 
     */
    Body {
        get => this.get_Body()
        set => this.put_Body(value)
    }

    /**
     * Gets the direct recipients of the email message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.to
     * @type {IVector<EmailRecipient>} 
     */
    To {
        get => this.get_To()
    }

    /**
     * Gets the recipients CC'd to the email message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.cc
     * @type {IVector<EmailRecipient>} 
     */
    CC {
        get => this.get_CC()
    }

    /**
     * Gets the recipients BCC'd to the email message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.bcc
     * @type {IVector<EmailRecipient>} 
     */
    Bcc {
        get => this.get_Bcc()
    }

    /**
     * Gets the attachments of the email message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.attachments
     * @type {IVector<EmailAttachment>} 
     */
    Attachments {
        get => this.get_Attachments()
    }

    /**
     * Gets the identifier of an email message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets or sets the identifier that can be used by a service provider to access the email message on the client machine.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.remoteid
     * @type {HSTRING} 
     */
    RemoteId {
        get => this.get_RemoteId()
        set => this.put_RemoteId(value)
    }

    /**
     * Gets the identifier of the mailbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.mailboxid
     * @type {HSTRING} 
     */
    MailboxId {
        get => this.get_MailboxId()
    }

    /**
     * Gets the identifier for a conversation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.conversationid
     * @type {HSTRING} 
     */
    ConversationId {
        get => this.get_ConversationId()
    }

    /**
     * Gets the identifier of a folder in the inbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.folderid
     * @type {HSTRING} 
     */
    FolderId {
        get => this.get_FolderId()
    }

    /**
     * Gets or sets a Boolean value indicating whether images may be embedded in the html encoded email message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.allowinternetimages
     * @type {Boolean} 
     */
    AllowInternetImages {
        get => this.get_AllowInternetImages()
        set => this.put_AllowInternetImages(value)
    }

    /**
     * Gets the current change number which is incremented for each change made to an email message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.changenumber
     * @type {Integer} 
     */
    ChangeNumber {
        get => this.get_ChangeNumber()
    }

    /**
     * Gets or sets the download status of an email message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.downloadstate
     * @type {Integer} 
     */
    DownloadState {
        get => this.get_DownloadState()
        set => this.put_DownloadState(value)
    }

    /**
     * Gets or sets the estimated size, in bytes, of an email message download.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.estimateddownloadsizeinbytes
     * @type {Integer} 
     */
    EstimatedDownloadSizeInBytes {
        get => this.get_EstimatedDownloadSizeInBytes()
        set => this.put_EstimatedDownloadSizeInBytes(value)
    }

    /**
     * Represents the flag status of an email message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.flagstate
     * @type {Integer} 
     */
    FlagState {
        get => this.get_FlagState()
        set => this.put_FlagState(value)
    }

    /**
     * Gets a Boolean value indicating whether this email message contains partial bodies.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.haspartialbodies
     * @type {Boolean} 
     */
    HasPartialBodies {
        get => this.get_HasPartialBodies()
    }

    /**
     * Gets the importance of an email message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.importance
     * @type {Integer} 
     */
    Importance {
        get => this.get_Importance()
        set => this.put_Importance(value)
    }

    /**
     * Gets the identifier for the email message to which this message is a response.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.inresponsetomessageid
     * @type {HSTRING} 
     */
    InResponseToMessageId {
        get => this.get_InResponseToMessageId()
    }

    /**
     * Gets or sets the Information Rights Management (IRM) information for this email message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.irminfo
     * @type {EmailIrmInfo} 
     */
    IrmInfo {
        get => this.get_IrmInfo()
        set => this.put_IrmInfo(value)
    }

    /**
     * Gets a Boolean value indicating whether this message is a draft.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.isdraftmessage
     * @type {Boolean} 
     */
    IsDraftMessage {
        get => this.get_IsDraftMessage()
    }

    /**
     * Gets a Boolean value indicating whether the email message has been read.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.isread
     * @type {Boolean} 
     */
    IsRead {
        get => this.get_IsRead()
        set => this.put_IsRead(value)
    }

    /**
     * Gets a Boolean value indicating whether the email message has been seen.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.isseen
     * @type {Boolean} 
     */
    IsSeen {
        get => this.get_IsSeen()
        set => this.put_IsSeen(value)
    }

    /**
     * Gets a Boolean value indicating whether the email message is a temporary server search message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.isserversearchmessage
     * @type {Boolean} 
     */
    IsServerSearchMessage {
        get => this.get_IsServerSearchMessage()
    }

    /**
     * Gets a Boolean value indicating whether the response email message is allowed to attempt a smart send, only sending that portion of the email message that has changed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.issmartsendable
     * @type {Boolean} 
     */
    IsSmartSendable {
        get => this.get_IsSmartSendable()
    }

    /**
     * Gets or sets a string that indicates the class of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.messageclass
     * @type {HSTRING} 
     */
    MessageClass {
        get => this.get_MessageClass()
        set => this.put_MessageClass(value)
    }

    /**
     * Gets the subject line of an email message stripped of additional prefixes such as fwd: and re:
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.normalizedsubject
     * @type {HSTRING} 
     */
    NormalizedSubject {
        get => this.get_NormalizedSubject()
    }

    /**
     * Gets or sets the integer that identifies the original flavor of the character set used so that when the email message is condensed from wide character format (16-bit) to ASCII or other 8-bit encoding, in cases of later encoding questions, this integer can be used to recreate the original character set.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.originalcodepage
     * @type {Integer} 
     */
    OriginalCodePage {
        get => this.get_OriginalCodePage()
        set => this.put_OriginalCodePage(value)
    }

    /**
     * Gets or sets the short preview string that represents the longer email message in the list view of emails.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.preview
     * @type {HSTRING} 
     */
    Preview {
        get => this.get_Preview()
        set => this.put_Preview(value)
    }

    /**
     * Gets the last kind of response sent in reference to this email message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.lastresponsekind
     * @type {Integer} 
     */
    LastResponseKind {
        get => this.get_LastResponseKind()
        set => this.put_LastResponseKind(value)
    }

    /**
     * Gets or sets the mailbox from which the email message was sent.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.sender
     * @type {EmailRecipient} 
     */
    Sender {
        get => this.get_Sender()
        set => this.put_Sender(value)
    }

    /**
     * Gets or sets the time an email was sent.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.senttime
     * @type {IReference<DateTime>} 
     */
    SentTime {
        get => this.get_SentTime()
        set => this.put_SentTime(value)
    }

    /**
     * Gets the information associated with this meeting.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.meetinginfo
     * @type {EmailMeetingInfo} 
     */
    MeetingInfo {
        get => this.get_MeetingInfo()
        set => this.put_MeetingInfo(value)
    }

    /**
     * Gets or sets the S/MIME data associated with an email message. For more information, see the [Certificate class](/uwp/api/windows.security.cryptography.certificates.certificate).
     * @remarks
     * For more information about S/MIME encryption and certificates, see [Secure/Multipurpose Internet Mail Extensions (S/MIME) Version 3.2
     * 
     *                          Message Specification.](https://tools.ietf.org/html/rfc5751 )
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.smimedata
     * @type {IRandomAccessStreamReference} 
     */
    SmimeData {
        get => this.get_SmimeData()
        set => this.put_SmimeData(value)
    }

    /**
     * Gets or sets the type of S/MIME encryption/signature for the email message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.smimekind
     * @type {Integer} 
     */
    SmimeKind {
        get => this.get_SmimeKind()
        set => this.put_SmimeKind(value)
    }

    /**
     * Gets the recipients that are configured to receive a reply to the email message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.replyto
     * @type {IVector<EmailRecipient>} 
     */
    ReplyTo {
        get => this.get_ReplyTo()
    }

    /**
     * Gets or sets an object that identifies the name and address of the person sending the message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.sentrepresenting
     * @type {EmailRecipient} 
     */
    SentRepresenting {
        get => this.get_SentRepresenting()
        set => this.put_SentRepresenting(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [EmailMessage](emailmessage.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Email.EmailMessage")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        if (!this.HasProp("__IEmailMessage")) {
            if ((queryResult := this.QueryInterface(IEmailMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage := IEmailMessage(outPtr)
        }

        return this.__IEmailMessage.get_Subject()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Subject(value) {
        if (!this.HasProp("__IEmailMessage")) {
            if ((queryResult := this.QueryInterface(IEmailMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage := IEmailMessage(outPtr)
        }

        return this.__IEmailMessage.put_Subject(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Body() {
        if (!this.HasProp("__IEmailMessage")) {
            if ((queryResult := this.QueryInterface(IEmailMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage := IEmailMessage(outPtr)
        }

        return this.__IEmailMessage.get_Body()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Body(value) {
        if (!this.HasProp("__IEmailMessage")) {
            if ((queryResult := this.QueryInterface(IEmailMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage := IEmailMessage(outPtr)
        }

        return this.__IEmailMessage.put_Body(value)
    }

    /**
     * 
     * @returns {IVector<EmailRecipient>} 
     */
    get_To() {
        if (!this.HasProp("__IEmailMessage")) {
            if ((queryResult := this.QueryInterface(IEmailMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage := IEmailMessage(outPtr)
        }

        return this.__IEmailMessage.get_To()
    }

    /**
     * 
     * @returns {IVector<EmailRecipient>} 
     */
    get_CC() {
        if (!this.HasProp("__IEmailMessage")) {
            if ((queryResult := this.QueryInterface(IEmailMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage := IEmailMessage(outPtr)
        }

        return this.__IEmailMessage.get_CC()
    }

    /**
     * 
     * @returns {IVector<EmailRecipient>} 
     */
    get_Bcc() {
        if (!this.HasProp("__IEmailMessage")) {
            if ((queryResult := this.QueryInterface(IEmailMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage := IEmailMessage(outPtr)
        }

        return this.__IEmailMessage.get_Bcc()
    }

    /**
     * 
     * @returns {IVector<EmailAttachment>} 
     */
    get_Attachments() {
        if (!this.HasProp("__IEmailMessage")) {
            if ((queryResult := this.QueryInterface(IEmailMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage := IEmailMessage(outPtr)
        }

        return this.__IEmailMessage.get_Attachments()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteId() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_RemoteId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RemoteId(value) {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.put_RemoteId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MailboxId() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_MailboxId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ConversationId() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_ConversationId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FolderId() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_FolderId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowInternetImages() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_AllowInternetImages()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowInternetImages(value) {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.put_AllowInternetImages(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChangeNumber() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_ChangeNumber()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DownloadState() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_DownloadState()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DownloadState(value) {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.put_DownloadState(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EstimatedDownloadSizeInBytes() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_EstimatedDownloadSizeInBytes()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_EstimatedDownloadSizeInBytes(value) {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.put_EstimatedDownloadSizeInBytes(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FlagState() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_FlagState()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FlagState(value) {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.put_FlagState(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasPartialBodies() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_HasPartialBodies()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Importance() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_Importance()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Importance(value) {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.put_Importance(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InResponseToMessageId() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_InResponseToMessageId()
    }

    /**
     * 
     * @returns {EmailIrmInfo} 
     */
    get_IrmInfo() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_IrmInfo()
    }

    /**
     * 
     * @param {EmailIrmInfo} value 
     * @returns {HRESULT} 
     */
    put_IrmInfo(value) {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.put_IrmInfo(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDraftMessage() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_IsDraftMessage()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRead() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_IsRead()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsRead(value) {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.put_IsRead(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSeen() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_IsSeen()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSeen(value) {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.put_IsSeen(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsServerSearchMessage() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_IsServerSearchMessage()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSmartSendable() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_IsSmartSendable()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MessageClass() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_MessageClass()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_MessageClass(value) {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.put_MessageClass(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NormalizedSubject() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_NormalizedSubject()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OriginalCodePage() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_OriginalCodePage()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OriginalCodePage(value) {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.put_OriginalCodePage(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Preview() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_Preview()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Preview(value) {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.put_Preview(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastResponseKind() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_LastResponseKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LastResponseKind(value) {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.put_LastResponseKind(value)
    }

    /**
     * 
     * @returns {EmailRecipient} 
     */
    get_Sender() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_Sender()
    }

    /**
     * 
     * @param {EmailRecipient} value 
     * @returns {HRESULT} 
     */
    put_Sender(value) {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.put_Sender(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_SentTime() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_SentTime()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_SentTime(value) {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.put_SentTime(value)
    }

    /**
     * 
     * @returns {EmailMeetingInfo} 
     */
    get_MeetingInfo() {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.get_MeetingInfo()
    }

    /**
     * 
     * @param {EmailMeetingInfo} value 
     * @returns {HRESULT} 
     */
    put_MeetingInfo(value) {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.put_MeetingInfo(value)
    }

    /**
     * Gets the requested email stream such as plain text or HTML.
     * @param {Integer} type The kind of message body; plain text or HTML.
     * @returns {IRandomAccessStreamReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.getbodystream
     */
    GetBodyStream(type) {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.GetBodyStream(type)
    }

    /**
     * Sets the value of the specified body stream in an email message.
     * @param {Integer} type Indicates which body stream, plain text or HTML.
     * @param {IRandomAccessStreamReference} stream The message for the specified body stream.
     * 
     * >[!Note]
     * The [EmailManager.ShowComposeNewEmailAsync](emailmanager_showcomposenewemailasync_1879015237.md), and [EmailManagerForUser.ShowComposeNewEmailAsync](emailmanagerforuser_showcomposenewemailasync_1879015237.md) methods won't recognize an HTML formatted body. You can only use those methods to send email in plain text.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmessage.setbodystream
     */
    SetBodyStream(type, stream) {
        if (!this.HasProp("__IEmailMessage2")) {
            if ((queryResult := this.QueryInterface(IEmailMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage2 := IEmailMessage2(outPtr)
        }

        return this.__IEmailMessage2.SetBodyStream(type, stream)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_SmimeData() {
        if (!this.HasProp("__IEmailMessage3")) {
            if ((queryResult := this.QueryInterface(IEmailMessage3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage3 := IEmailMessage3(outPtr)
        }

        return this.__IEmailMessage3.get_SmimeData()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_SmimeData(value) {
        if (!this.HasProp("__IEmailMessage3")) {
            if ((queryResult := this.QueryInterface(IEmailMessage3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage3 := IEmailMessage3(outPtr)
        }

        return this.__IEmailMessage3.put_SmimeData(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SmimeKind() {
        if (!this.HasProp("__IEmailMessage3")) {
            if ((queryResult := this.QueryInterface(IEmailMessage3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage3 := IEmailMessage3(outPtr)
        }

        return this.__IEmailMessage3.get_SmimeKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SmimeKind(value) {
        if (!this.HasProp("__IEmailMessage3")) {
            if ((queryResult := this.QueryInterface(IEmailMessage3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage3 := IEmailMessage3(outPtr)
        }

        return this.__IEmailMessage3.put_SmimeKind(value)
    }

    /**
     * 
     * @returns {IVector<EmailRecipient>} 
     */
    get_ReplyTo() {
        if (!this.HasProp("__IEmailMessage4")) {
            if ((queryResult := this.QueryInterface(IEmailMessage4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage4 := IEmailMessage4(outPtr)
        }

        return this.__IEmailMessage4.get_ReplyTo()
    }

    /**
     * 
     * @returns {EmailRecipient} 
     */
    get_SentRepresenting() {
        if (!this.HasProp("__IEmailMessage4")) {
            if ((queryResult := this.QueryInterface(IEmailMessage4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage4 := IEmailMessage4(outPtr)
        }

        return this.__IEmailMessage4.get_SentRepresenting()
    }

    /**
     * 
     * @param {EmailRecipient} value 
     * @returns {HRESULT} 
     */
    put_SentRepresenting(value) {
        if (!this.HasProp("__IEmailMessage4")) {
            if ((queryResult := this.QueryInterface(IEmailMessage4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMessage4 := IEmailMessage4(outPtr)
        }

        return this.__IEmailMessage4.put_SentRepresenting(value)
    }

;@endregion Instance Methods
}
