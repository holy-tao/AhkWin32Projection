#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the values that specify the message string from the event to format.
 * @see https://docs.microsoft.com/windows/win32/api//winevt/ne-winevt-evt_format_message_flags
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_FORMAT_MESSAGE_FLAGS{

    /**
     * Format the event's message string.
     * @type {Integer (UInt32)}
     */
    static EvtFormatMessageEvent => 1

    /**
     * Format the message string of the level specified in the event.
     * @type {Integer (UInt32)}
     */
    static EvtFormatMessageLevel => 2

    /**
     * Format the message string of the task specified in the event.
     * @type {Integer (UInt32)}
     */
    static EvtFormatMessageTask => 3

    /**
     * Format the message string of the opcode specified in the event.
     * @type {Integer (UInt32)}
     */
    static EvtFormatMessageOpcode => 4

    /**
     * Format the message string of the keywords specified in the event. If the event specifies multiple keywords, the formatted string is a list of null-terminated strings. Increment through the strings until your pointer points past the end of the used buffer.
     * @type {Integer (UInt32)}
     */
    static EvtFormatMessageKeyword => 5

    /**
     * Format the message string of the channel specified in the event.
     * @type {Integer (UInt32)}
     */
    static EvtFormatMessageChannel => 6

    /**
     * Format the provider's message string.
     * @type {Integer (UInt32)}
     */
    static EvtFormatMessageProvider => 7

    /**
     * Format the message string associated with a resource identifier. The provider's metadata contains the resource identifiers; the message compiler assigns a resource identifier to each string when it compiles the manifest.
     * @type {Integer (UInt32)}
     */
    static EvtFormatMessageId => 8

    /**
     * Format all the message strings in the event. The formatted message is an XML string that contains the event details and the message strings. The message strings are included in the <a href="https://docs.microsoft.com/windows/desktop/WES/eventschema-renderingtype-complextype">RenderingInfo</a> section of the event details.
     * @type {Integer (UInt32)}
     */
    static EvtFormatMessageXml => 9
}
