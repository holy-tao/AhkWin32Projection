#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatMessageValidationResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides results for validation of chat messages.
 * @remarks
 * Obtain an instance of this class by calling [ValidateMessage](chatmessagestore_validatemessage_660151262.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagevalidationresult
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageValidationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatMessageValidationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatMessageValidationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the maximum number of text fragments allowed for a message. This value has meaning when the SMS text portion of a message is validated.
     * @remarks
     * The SMS text portion of a message is divided into multiple parts if necessary. The MaxPartCount value is the total count of parts allowed for any message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagevalidationresult.maxpartcount
     * @type {IReference<Integer>} 
     */
    MaxPartCount {
        get => this.get_MaxPartCount()
    }

    /**
     * Gets the total number of text fragments needed for this message. This value has meaning when the SMS text portion of a message is validated.
     * @remarks
     * The SMS text portion of a message is divided into multiple parts if necessary. The PartCount value is the total count of parts required to contain this message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagevalidationresult.partcount
     * @type {IReference<Integer>} 
     */
    PartCount {
        get => this.get_PartCount()
    }

    /**
     * Gets the number of characters not used in the final message fragments. This value has meaning when the SMS text portion of a message is validated.
     * @remarks
     * The SMS text portion of a message is divided in to multiple parts if necessary. The RemainingCharacterCountInPart value is the number of character positions that remain unused in the final message fragment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagevalidationresult.remainingcharactercountinpart
     * @type {IReference<Integer>} 
     */
    RemainingCharacterCountInPart {
        get => this.get_RemainingCharacterCountInPart()
    }

    /**
     * Gets the message validation status code.
     * @remarks
     * When Status is not [ChatMessageValidationStatus](chatmessagevalidationstatus.md).Valid, the status result indicates the first error condition found. A message may have additional errors, and a second validation will return the next error found if the previous error is resolved.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagevalidationresult.status
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
     * @returns {IReference<Integer>} 
     */
    get_MaxPartCount() {
        if (!this.HasProp("__IChatMessageValidationResult")) {
            if ((queryResult := this.QueryInterface(IChatMessageValidationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageValidationResult := IChatMessageValidationResult(outPtr)
        }

        return this.__IChatMessageValidationResult.get_MaxPartCount()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PartCount() {
        if (!this.HasProp("__IChatMessageValidationResult")) {
            if ((queryResult := this.QueryInterface(IChatMessageValidationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageValidationResult := IChatMessageValidationResult(outPtr)
        }

        return this.__IChatMessageValidationResult.get_PartCount()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_RemainingCharacterCountInPart() {
        if (!this.HasProp("__IChatMessageValidationResult")) {
            if ((queryResult := this.QueryInterface(IChatMessageValidationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageValidationResult := IChatMessageValidationResult(outPtr)
        }

        return this.__IChatMessageValidationResult.get_RemainingCharacterCountInPart()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IChatMessageValidationResult")) {
            if ((queryResult := this.QueryInterface(IChatMessageValidationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageValidationResult := IChatMessageValidationResult(outPtr)
        }

        return this.__IChatMessageValidationResult.get_Status()
    }

;@endregion Instance Methods
}
