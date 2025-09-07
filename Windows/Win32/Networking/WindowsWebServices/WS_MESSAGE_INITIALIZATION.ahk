#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies what headers the WsInitializeMessageshould add to the message.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_message_initialization
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_MESSAGE_INITIALIZATION{

    /**
     * The headers of the message are empty.
     * @type {Integer (Int32)}
     */
    static WS_BLANK_MESSAGE => 0

    /**
     * The headers are initialized to be the same as the source message's headers.
     * @type {Integer (Int32)}
     */
    static WS_DUPLICATE_MESSAGE => 1

    /**
     * If using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_addressing_version">WS_ADDRESSING_VERSION_0_9</a> or <b>WS_ADDRESSING_VERSION_1_0</b>,
 *                     then a unique message ID is set as the MessageID header of the message.  
 *                     No other headers are added in the message.
     * @type {Integer (Int32)}
     */
    static WS_REQUEST_MESSAGE => 2

    /**
     * The ReplyTo header of the source message (an <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_endpoint_address">WS_ENDPOINT_ADDRESS</a>)
 *                     is used to address the message.  The MessageID header of the source
 *                     message is used to add a RelatesTo header to the message.  If the message
 *                     will contain a fault reply, then <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_initialization">WS_FAULT_MESSAGE</a> should be
 *                     used instead.
     * @type {Integer (Int32)}
     */
    static WS_REPLY_MESSAGE => 3

    /**
     * The FaultTo or ReplyTo header of the source message (an <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_endpoint_address">WS_ENDPOINT_ADDRESS</a>)
 *                     is used to address the message.  The MessageID header of the source message
 *                     is used to add a RelatesTo header to the message.  This should only be
 *                     used when the contents of the message will contain a fault.
     * @type {Integer (Int32)}
     */
    static WS_FAULT_MESSAGE => 4
}
