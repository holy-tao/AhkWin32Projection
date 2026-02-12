#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the validation state of a chat message such as valid, no recipients, or too many attachments.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagevalidationstatus
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageValidationStatus extends Win32Enum{

    /**
     * Valid
     * @type {Integer (Int32)}
     */
    static Valid => 0

    /**
     * No recipients
     * @type {Integer (Int32)}
     */
    static NoRecipients => 1

    /**
     * Invalid data
     * @type {Integer (Int32)}
     */
    static InvalidData => 2

    /**
     * Message too large
     * @type {Integer (Int32)}
     */
    static MessageTooLarge => 3

    /**
     * Too many recipients
     * @type {Integer (Int32)}
     */
    static TooManyRecipients => 4

    /**
     * Transport inactive
     * @type {Integer (Int32)}
     */
    static TransportInactive => 5

    /**
     * Transport not found
     * @type {Integer (Int32)}
     */
    static TransportNotFound => 6

    /**
     * Too many attachments
     * @type {Integer (Int32)}
     */
    static TooManyAttachments => 7

    /**
     * Invalid recipients
     * @type {Integer (Int32)}
     */
    static InvalidRecipients => 8

    /**
     * Invalid body
     * @type {Integer (Int32)}
     */
    static InvalidBody => 9

    /**
     * Invalid other
     * @type {Integer (Int32)}
     */
    static InvalidOther => 10

    /**
     * Valid with large message
     * @type {Integer (Int32)}
     */
    static ValidWithLargeMessage => 11

    /**
     * Voice roaming restriction
     * @type {Integer (Int32)}
     */
    static VoiceRoamingRestriction => 12

    /**
     * Data roaming restriction
     * @type {Integer (Int32)}
     */
    static DataRoamingRestriction => 13
}
