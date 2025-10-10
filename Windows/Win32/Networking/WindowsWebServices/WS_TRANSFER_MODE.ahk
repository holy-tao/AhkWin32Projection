#Requires AutoHotkey v2.0.0 64-bit

/**
 * Whether messages that are sent or received are streamed or buffered.
 * @remarks
 * 
  * This value is specified for a channel using the 
  *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_TRANSFER_MODE</a> channel property.
  *             
  * 
  * The streaming programming model can be used regardless of which 
  *                 transfer mode is used.  In the case where streaming is not used, the calls
  *                 to the calls to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfillbody">WsFillBody</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsflushbody">WsFlushBody</a> are NOPs.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_transfer_mode
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_TRANSFER_MODE{

    /**
     * Setting this flag means messages are delivered in chunks.  The start of the message
 *                     (opening tag, headers, and opening body tag) will be returned to the application
 *                     when <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadmessagestart">WsReadMessageStart</a> completes.  It is up to the application to call
 *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfillbody">WsFillBody</a> before reading each chunk of the message body.  The end of
 *                     the message (closing body and envelope tags) will be read when <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadmessageend">WsReadMessageEnd</a>is called.
 *                 
 * 
 * Not setting this flag means the entire message is read and buffered
 *                     in memory before <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadmessagestart">WsReadMessageStart</a> indicates completion.
     * @type {Integer (Int32)}
     */
    static WS_STREAMED_INPUT_TRANSFER_MODE => 1

    /**
     * Setting this flag means messages are transmitted in chunks.  The start of the message (opening
 *                     envelope tag, headers, and opening body tag) will be transmitted when <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritemessagestart">WsWriteMessageStart</a>is called.  It is up to the application to call <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsflushbody">WsFlushBody</a> after writing each chunk 
 *                     of the message body to cause the chunk to be transmitted.
 *                     Any remaining body data will be transmitted when <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritemessageend">WsWriteMessageEnd</a> is called, along with
 *                     the end of the message (closing body and envelope tags).
 *                 
 * 
 * Not setting this flag means the entire message is buffered in 
 *                     memory and is only transmitted once <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritemessageend">WsWriteMessageEnd</a> is called.
     * @type {Integer (Int32)}
     */
    static WS_STREAMED_OUTPUT_TRANSFER_MODE => 2

    /**
     * Messages that are written or read are buffered.
 *                 
 * 
 * This is equivalent to specifying neither
 *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_transfer_mode">WS_STREAMED_INPUT_TRANSFER_MODE</a> nor
 *                     <b>WS_STREAMED_OUTPUT_TRANSFER_MODE</b>.
     * @type {Integer (Int32)}
     */
    static WS_BUFFERED_TRANSFER_MODE => 0

    /**
     * Messages that are written or read are streamed.
 *                 
 * 
 * This is equivalent to specifying both
 *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_transfer_mode">WS_STREAMED_INPUT_TRANSFER_MODE</a> and
 *                     <b>WS_STREAMED_OUTPUT_TRANSFER_MODE</b>.
     * @type {Integer (Int32)}
     */
    static WS_STREAMED_TRANSFER_MODE => 3
}
