#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies what headers the WsInitializeMessageshould add to the message.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_message_initialization
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_MESSAGE_INITIALIZATION extends Win32Enum {

    /**
     * The headers of the message are empty.
     * Native name: WS_BLANK_MESSAGE
     * @type {Integer (Int32)}
     */
    static BLANK_MESSAGE => 0

    /**
     * The headers are initialized to be the same as the source message's headers.
     * Native name: WS_DUPLICATE_MESSAGE
     * @type {Integer (Int32)}
     */
    static DUPLICATE_MESSAGE => 1

    /**
     * If using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_addressing_version">WS_ADDRESSING_VERSION_0_9</a> or <b>WS_ADDRESSING_VERSION_1_0</b>,
     *                     then a unique message ID is set as the MessageID header of the message.  
     *                     No other headers are added in the message.
     * Native name: WS_REQUEST_MESSAGE
     * @type {Integer (Int32)}
     */
    static REQUEST_MESSAGE => 2

    /**
     * The ReplyTo header of the source message (an <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_endpoint_address">WS_ENDPOINT_ADDRESS</a>)
     *                     is used to address the message.  The MessageID header of the source
     *                     message is used to add a RelatesTo header to the message.  If the message
     *                     will contain a fault reply, then <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_initialization">WS_FAULT_MESSAGE</a> should be
     *                     used instead.
     * Native name: WS_REPLY_MESSAGE
     * @type {Integer (Int32)}
     */
    static REPLY_MESSAGE => 3

    /**
     * The FaultTo or ReplyTo header of the source message (an <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_endpoint_address">WS_ENDPOINT_ADDRESS</a>)
     *                     is used to address the message.  The MessageID header of the source message
     *                     is used to add a RelatesTo header to the message.  This should only be
     *                     used when the contents of the message will contain a fault.
     * Native name: WS_FAULT_MESSAGE
     * @type {Integer (Int32)}
     */
    static FAULT_MESSAGE => 4
}
