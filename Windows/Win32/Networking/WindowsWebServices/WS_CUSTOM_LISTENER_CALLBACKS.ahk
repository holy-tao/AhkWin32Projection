#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A structure that is used to specify a set of callbacks that form the implementation of a custom listener.
 * @remarks
 * This structure is specified when a listener is created using
 *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a> 
 *                 using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_property_id">WS_LISTENER_PROPERTY_CUSTOM_LISTENER_CALLBACKS</a>.
 *             
 * 
 * Except where noted, each callback is responsible for validating all parameters and
 *                 that the operation requested is acceptable given the current
 *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_state">WS_LISTENER_STATE</a>.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_custom_listener_callbacks
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CUSTOM_LISTENER_CALLBACKS {
    #StructPack 8

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_listener_callback">WS_CREATE_LISTENER_CALLBACK</a> for more information.
     */
    createListenerCallback : IntPtr

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreelistener">WsFreeListener</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_free_listener_callback">WS_FREE_LISTENER_CALLBACK</a> for more information.
     */
    freeListenerCallback : IntPtr

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsresetlistener">WsResetListener</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_reset_listener_callback">WS_RESET_LISTENER_CALLBACK</a> for more information.
     */
    resetListenerCallback : IntPtr

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsopenlistener">WsOpenListener</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_open_listener_callback">WS_OPEN_LISTENER_CALLBACK</a> for more information.
     */
    openListenerCallback : IntPtr

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscloselistener">WsCloseListener</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_close_listener_callback">WS_CLOSE_LISTENER_CALLBACK</a> for more information.
     */
    closeListenerCallback : IntPtr

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsabortlistener">WsAbortListener</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_abort_listener_callback">WS_ABORT_LISTENER_CALLBACK</a> for more information.
     */
    abortListenerCallback : IntPtr

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetlistenerproperty">WsGetListenerProperty</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_get_listener_property_callback">WS_GET_LISTENER_PROPERTY_CALLBACK</a> for more information.
     */
    getListenerPropertyCallback : IntPtr

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetlistenerproperty">WsSetListenerProperty</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_set_listener_property_callback">WS_SET_LISTENER_PROPERTY_CALLBACK</a> for more information.
     */
    setListenerPropertyCallback : IntPtr

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannelforlistener">WsCreateChannelForListener</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_channel_for_listener_callback">WS_CREATE_CHANNEL_FOR_LISTENER_CALLBACK</a> for more information.
     */
    createChannelForListenerCallback : IntPtr

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsacceptchannel">WsAcceptChannel</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_accept_channel_callback">WS_ACCEPT_CHANNEL_CALLBACK</a> for more information.
     */
    acceptChannelCallback : IntPtr

}
