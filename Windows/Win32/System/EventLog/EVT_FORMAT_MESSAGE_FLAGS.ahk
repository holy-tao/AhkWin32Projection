#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the values that specify the message string from the event to format.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_format_message_flags
 * @namespace Windows.Win32.System.EventLog
 */
class EVT_FORMAT_MESSAGE_FLAGS extends Win32Enum {

    /**
     * Format the event's message string.
     * Native name: EvtFormatMessageEvent
     * @type {Integer (UInt32)}
     */
    static Event => 1

    /**
     * Format the message string of the level specified in the event.
     * Native name: EvtFormatMessageLevel
     * @type {Integer (UInt32)}
     */
    static Level => 2

    /**
     * Format the message string of the task specified in the event.
     * Native name: EvtFormatMessageTask
     * @type {Integer (UInt32)}
     */
    static Task => 3

    /**
     * Format the message string of the opcode specified in the event.
     * Native name: EvtFormatMessageOpcode
     * @type {Integer (UInt32)}
     */
    static Opcode => 4

    /**
     * Format the message string of the keywords specified in the event. If the event specifies multiple keywords, the formatted string is a list of null-terminated strings. Increment through the strings until your pointer points past the end of the used buffer.
     * Native name: EvtFormatMessageKeyword
     * @type {Integer (UInt32)}
     */
    static Keyword => 5

    /**
     * Format the message string of the channel specified in the event.
     * Native name: EvtFormatMessageChannel
     * @type {Integer (UInt32)}
     */
    static Channel => 6

    /**
     * Format the provider's message string.
     * Native name: EvtFormatMessageProvider
     * @type {Integer (UInt32)}
     */
    static Provider => 7

    /**
     * Format the message string associated with a resource identifier. The provider's metadata contains the resource identifiers; the message compiler assigns a resource identifier to each string when it compiles the manifest.
     * Native name: EvtFormatMessageId
     * @type {Integer (UInt32)}
     */
    static Id => 8

    /**
     * Format all the message strings in the event. The formatted message is an XML string that contains the event details and the message strings. The message strings are included in the <a href="https://docs.microsoft.com/windows/desktop/WES/eventschema-renderingtype-complextype">RenderingInfo</a> section of the event details.
     * Native name: EvtFormatMessageXml
     * @type {Integer (UInt32)}
     */
    static Xml => 9
}
