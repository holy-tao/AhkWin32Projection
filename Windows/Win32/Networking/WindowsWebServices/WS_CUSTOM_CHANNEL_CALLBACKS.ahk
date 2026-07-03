#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_ABANDON_MESSAGE_CALLBACK.ahk" { WS_ABANDON_MESSAGE_CALLBACK }
#Import ".\WS_ABORT_CHANNEL_CALLBACK.ahk" { WS_ABORT_CHANNEL_CALLBACK }
#Import ".\WS_CLOSE_CHANNEL_CALLBACK.ahk" { WS_CLOSE_CHANNEL_CALLBACK }
#Import ".\WS_CREATE_CHANNEL_CALLBACK.ahk" { WS_CREATE_CHANNEL_CALLBACK }
#Import ".\WS_FREE_CHANNEL_CALLBACK.ahk" { WS_FREE_CHANNEL_CALLBACK }
#Import ".\WS_GET_CHANNEL_PROPERTY_CALLBACK.ahk" { WS_GET_CHANNEL_PROPERTY_CALLBACK }
#Import ".\WS_OPEN_CHANNEL_CALLBACK.ahk" { WS_OPEN_CHANNEL_CALLBACK }
#Import ".\WS_READ_MESSAGE_END_CALLBACK.ahk" { WS_READ_MESSAGE_END_CALLBACK }
#Import ".\WS_READ_MESSAGE_START_CALLBACK.ahk" { WS_READ_MESSAGE_START_CALLBACK }
#Import ".\WS_RESET_CHANNEL_CALLBACK.ahk" { WS_RESET_CHANNEL_CALLBACK }
#Import ".\WS_SET_CHANNEL_PROPERTY_CALLBACK.ahk" { WS_SET_CHANNEL_PROPERTY_CALLBACK }
#Import ".\WS_SHUTDOWN_SESSION_CHANNEL_CALLBACK.ahk" { WS_SHUTDOWN_SESSION_CHANNEL_CALLBACK }
#Import ".\WS_WRITE_MESSAGE_END_CALLBACK.ahk" { WS_WRITE_MESSAGE_END_CALLBACK }
#Import ".\WS_WRITE_MESSAGE_START_CALLBACK.ahk" { WS_WRITE_MESSAGE_START_CALLBACK }

/**
 * A structure that is used to specify a set of callbacks that form the implementation of a custom channel.
 * @remarks
 * This structure is specified when a channel is created using
 *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannel">WsCreateChannel</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannelforlistener">WsCreateChannelForListener</a> using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_CUSTOM_CHANNEL_CALLBACKS</a>.
 *             
 * 
 * Except where noted, each callback is responsible for validating all parameters and
 *                 that the operation requested is acceptable given the current
 *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_state">WS_CHANNEL_STATE</a>.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_custom_channel_callbacks
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CUSTOM_CHANNEL_CALLBACKS {
    #StructPack 8

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannel">WsCreateChannel</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_channel_callback">WS_CREATE_CHANNEL_CALLBACK</a> for more information.
     */
    createChannelCallback : WS_CREATE_CHANNEL_CALLBACK

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreechannel">WsFreeChannel</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_free_channel_callback">WS_FREE_CHANNEL_CALLBACK</a> for more information.
     */
    freeChannelCallback : WS_FREE_CHANNEL_CALLBACK

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsresetchannel">WsResetChannel</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_reset_channel_callback">WS_RESET_CHANNEL_CALLBACK</a> for more information.
     */
    resetChannelCallback : WS_RESET_CHANNEL_CALLBACK

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsopenchannel">WsOpenChannel</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_open_channel_callback">WS_OPEN_CHANNEL_CALLBACK</a> for more information.
     */
    openChannelCallback : WS_OPEN_CHANNEL_CALLBACK

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsclosechannel">WsCloseChannel</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_close_channel_callback">WS_CLOSE_CHANNEL_CALLBACK</a> for more information.
     */
    closeChannelCallback : WS_CLOSE_CHANNEL_CALLBACK

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsabortchannel">WsAbortChannel</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_abort_channel_callback">WS_ABORT_CHANNEL_CALLBACK</a> for more information.
     */
    abortChannelCallback : WS_ABORT_CHANNEL_CALLBACK

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetchannelproperty">WsGetChannelProperty</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_get_channel_property_callback">WS_GET_CHANNEL_PROPERTY_CALLBACK</a> for more information.
     */
    getChannelPropertyCallback : WS_GET_CHANNEL_PROPERTY_CALLBACK

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetchannelproperty">WsSetChannelProperty</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_set_channel_property_callback">WS_SET_CHANNEL_PROPERTY_CALLBACK</a> for more information.
     */
    setChannelPropertyCallback : WS_SET_CHANNEL_PROPERTY_CALLBACK

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritemessagestart">WsWriteMessageStart</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_write_message_start_callback">WS_WRITE_MESSAGE_START_CALLBACK</a> for more information.
     */
    writeMessageStartCallback : WS_WRITE_MESSAGE_START_CALLBACK

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritemessageend">WsWriteMessageEnd</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_write_message_end_callback">WS_WRITE_MESSAGE_END_CALLBACK</a> for more information.
     */
    writeMessageEndCallback : WS_WRITE_MESSAGE_END_CALLBACK

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadmessagestart">WsReadMessageStart</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_read_message_start_callback">WS_READ_MESSAGE_START_CALLBACK</a> for more information.
     */
    readMessageStartCallback : WS_READ_MESSAGE_START_CALLBACK

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadmessageend">WsReadMessageEnd</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_read_message_end_callback">WS_READ_MESSAGE_END_CALLBACK</a> for more information.
     */
    readMessageEndCallback : WS_READ_MESSAGE_END_CALLBACK

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsabandonmessage">WsAbandonMessage</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_abandon_message_callback">WS_ABANDON_MESSAGE_CALLBACK</a> for more information.
     */
    abandonMessageCallback : WS_ABANDON_MESSAGE_CALLBACK

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsshutdownsessionchannel">WsShutdownSessionChannel</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_shutdown_session_channel_callback">WS_SHUTDOWN_SESSION_CHANNEL_CALLBACK</a> for more information.
     */
    shutdownSessionChannelCallback : WS_SHUTDOWN_SESSION_CHANNEL_CALLBACK

}
