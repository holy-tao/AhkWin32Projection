#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailAttachment.ahk
#Include .\IEmailAttachment2.ahk
#Include .\IEmailAttachmentFactory.ahk
#Include .\IEmailAttachmentFactory2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an email attachment.
 * @remarks
 * Attachments that you add to an email by using the [EmailAttachment](/uwp/api/windows.applicationmodel.email.emailattachment) class will appear only in the Mail app. If users have any other mail program configured as their default mail program, the compose window will appear without the attachment. This is a known issue.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailattachment
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailAttachment extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailAttachment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailAttachment.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [EmailAttachment](emailattachment.md) class with the specified random access stream.
     * @param {HSTRING} fileName The file name to use for the attachment.
     * @param {IRandomAccessStreamReference} data A random access stream containing the data for the attachment.
     * @returns {EmailAttachment} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailattachment.#ctor
     */
    static Create(fileName, data) {
        if (!EmailAttachment.HasProp("__IEmailAttachmentFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Email.EmailAttachment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEmailAttachmentFactory.IID)
            EmailAttachment.__IEmailAttachmentFactory := IEmailAttachmentFactory(factoryPtr)
        }

        return EmailAttachment.__IEmailAttachmentFactory.Create(fileName, data)
    }

    /**
     * Initializes a new instance of the [EmailAttachment](emailattachment.md) class.
     * @param {HSTRING} fileName The filename of the attachment.
     * @param {IRandomAccessStreamReference} data The stream to use to download the attachment.
     * @param {HSTRING} mimeType The MIME type of the attachment.
     * @returns {EmailAttachment} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailattachment.#ctor
     */
    static Create1(fileName, data, mimeType) {
        if (!EmailAttachment.HasProp("__IEmailAttachmentFactory2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Email.EmailAttachment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEmailAttachmentFactory2.IID)
            EmailAttachment.__IEmailAttachmentFactory2 := IEmailAttachmentFactory2(factoryPtr)
        }

        return EmailAttachment.__IEmailAttachmentFactory2.Create(fileName, data, mimeType)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the displayed file name for the email attachment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailattachment.filename
     * @type {HSTRING} 
     */
    FileName {
        get => this.get_FileName()
        set => this.put_FileName(value)
    }

    /**
     * Gets or sets the email attachment's data.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailattachment.data
     * @type {IRandomAccessStreamReference} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * Gets the locally unique ID for the email attachment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailattachment.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets or sets a value that identifies the content of the attachment on a remote system.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailattachment.contentid
     * @type {HSTRING} 
     */
    ContentId {
        get => this.get_ContentId()
        set => this.put_ContentId(value)
    }

    /**
     * Gets or sets the location of an email attachment as a Uniform Resource Identifier (URI).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailattachment.contentlocation
     * @type {HSTRING} 
     */
    ContentLocation {
        get => this.get_ContentLocation()
        set => this.put_ContentLocation(value)
    }

    /**
     * Gets or sets the download state of the email attachment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailattachment.downloadstate
     * @type {Integer} 
     */
    DownloadState {
        get => this.get_DownloadState()
        set => this.put_DownloadState(value)
    }

    /**
     * Gets or sets the estimated download size of the attachment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailattachment.estimateddownloadsizeinbytes
     * @type {Integer} 
     */
    EstimatedDownloadSizeInBytes {
        get => this.get_EstimatedDownloadSizeInBytes()
        set => this.put_EstimatedDownloadSizeInBytes(value)
    }

    /**
     * Gets a Boolean value indicating if the attachment came from the base message.
     * @remarks
     * If you remove a base attachment, you cannot use smart-send.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailattachment.isfrombasemessage
     * @type {Boolean} 
     */
    IsFromBaseMessage {
        get => this.get_IsFromBaseMessage()
    }

    /**
     * Gets or sets a Boolean property indicating if the attachment is included inline, in the body of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailattachment.isinline
     * @type {Boolean} 
     */
    IsInline {
        get => this.get_IsInline()
        set => this.put_IsInline(value)
    }

    /**
     * Gets or sets the MIME type of the attachment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailattachment.mimetype
     * @type {HSTRING} 
     */
    MimeType {
        get => this.get_MimeType()
        set => this.put_MimeType(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [EmailAttachment](emailattachment.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Email.EmailAttachment")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FileName() {
        if (!this.HasProp("__IEmailAttachment")) {
            if ((queryResult := this.QueryInterface(IEmailAttachment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailAttachment := IEmailAttachment(outPtr)
        }

        return this.__IEmailAttachment.get_FileName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_FileName(value) {
        if (!this.HasProp("__IEmailAttachment")) {
            if ((queryResult := this.QueryInterface(IEmailAttachment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailAttachment := IEmailAttachment(outPtr)
        }

        return this.__IEmailAttachment.put_FileName(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Data() {
        if (!this.HasProp("__IEmailAttachment")) {
            if ((queryResult := this.QueryInterface(IEmailAttachment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailAttachment := IEmailAttachment(outPtr)
        }

        return this.__IEmailAttachment.get_Data()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        if (!this.HasProp("__IEmailAttachment")) {
            if ((queryResult := this.QueryInterface(IEmailAttachment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailAttachment := IEmailAttachment(outPtr)
        }

        return this.__IEmailAttachment.put_Data(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IEmailAttachment2")) {
            if ((queryResult := this.QueryInterface(IEmailAttachment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailAttachment2 := IEmailAttachment2(outPtr)
        }

        return this.__IEmailAttachment2.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentId() {
        if (!this.HasProp("__IEmailAttachment2")) {
            if ((queryResult := this.QueryInterface(IEmailAttachment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailAttachment2 := IEmailAttachment2(outPtr)
        }

        return this.__IEmailAttachment2.get_ContentId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContentId(value) {
        if (!this.HasProp("__IEmailAttachment2")) {
            if ((queryResult := this.QueryInterface(IEmailAttachment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailAttachment2 := IEmailAttachment2(outPtr)
        }

        return this.__IEmailAttachment2.put_ContentId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentLocation() {
        if (!this.HasProp("__IEmailAttachment2")) {
            if ((queryResult := this.QueryInterface(IEmailAttachment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailAttachment2 := IEmailAttachment2(outPtr)
        }

        return this.__IEmailAttachment2.get_ContentLocation()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContentLocation(value) {
        if (!this.HasProp("__IEmailAttachment2")) {
            if ((queryResult := this.QueryInterface(IEmailAttachment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailAttachment2 := IEmailAttachment2(outPtr)
        }

        return this.__IEmailAttachment2.put_ContentLocation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DownloadState() {
        if (!this.HasProp("__IEmailAttachment2")) {
            if ((queryResult := this.QueryInterface(IEmailAttachment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailAttachment2 := IEmailAttachment2(outPtr)
        }

        return this.__IEmailAttachment2.get_DownloadState()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DownloadState(value) {
        if (!this.HasProp("__IEmailAttachment2")) {
            if ((queryResult := this.QueryInterface(IEmailAttachment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailAttachment2 := IEmailAttachment2(outPtr)
        }

        return this.__IEmailAttachment2.put_DownloadState(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EstimatedDownloadSizeInBytes() {
        if (!this.HasProp("__IEmailAttachment2")) {
            if ((queryResult := this.QueryInterface(IEmailAttachment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailAttachment2 := IEmailAttachment2(outPtr)
        }

        return this.__IEmailAttachment2.get_EstimatedDownloadSizeInBytes()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_EstimatedDownloadSizeInBytes(value) {
        if (!this.HasProp("__IEmailAttachment2")) {
            if ((queryResult := this.QueryInterface(IEmailAttachment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailAttachment2 := IEmailAttachment2(outPtr)
        }

        return this.__IEmailAttachment2.put_EstimatedDownloadSizeInBytes(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFromBaseMessage() {
        if (!this.HasProp("__IEmailAttachment2")) {
            if ((queryResult := this.QueryInterface(IEmailAttachment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailAttachment2 := IEmailAttachment2(outPtr)
        }

        return this.__IEmailAttachment2.get_IsFromBaseMessage()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInline() {
        if (!this.HasProp("__IEmailAttachment2")) {
            if ((queryResult := this.QueryInterface(IEmailAttachment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailAttachment2 := IEmailAttachment2(outPtr)
        }

        return this.__IEmailAttachment2.get_IsInline()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsInline(value) {
        if (!this.HasProp("__IEmailAttachment2")) {
            if ((queryResult := this.QueryInterface(IEmailAttachment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailAttachment2 := IEmailAttachment2(outPtr)
        }

        return this.__IEmailAttachment2.put_IsInline(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MimeType() {
        if (!this.HasProp("__IEmailAttachment2")) {
            if ((queryResult := this.QueryInterface(IEmailAttachment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailAttachment2 := IEmailAttachment2(outPtr)
        }

        return this.__IEmailAttachment2.get_MimeType()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_MimeType(value) {
        if (!this.HasProp("__IEmailAttachment2")) {
            if ((queryResult := this.QueryInterface(IEmailAttachment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailAttachment2 := IEmailAttachment2(outPtr)
        }

        return this.__IEmailAttachment2.put_MimeType(value)
    }

;@endregion Instance Methods
}
