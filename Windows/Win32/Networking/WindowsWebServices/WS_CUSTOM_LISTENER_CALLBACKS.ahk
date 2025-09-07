#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class WS_CUSTOM_LISTENER_CALLBACKS extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_listener_callback">WS_CREATE_LISTENER_CALLBACK</a> for more information.
     * @type {Pointer<Ptr>}
     */
    createListenerCallback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreelistener">WsFreeListener</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_free_listener_callback">WS_FREE_LISTENER_CALLBACK</a> for more information.
     * @type {Pointer<Ptr>}
     */
    freeListenerCallback {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsresetlistener">WsResetListener</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_reset_listener_callback">WS_RESET_LISTENER_CALLBACK</a> for more information.
     * @type {Pointer<Ptr>}
     */
    resetListenerCallback {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsopenlistener">WsOpenListener</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_open_listener_callback">WS_OPEN_LISTENER_CALLBACK</a> for more information.
     * @type {Pointer<Ptr>}
     */
    openListenerCallback {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscloselistener">WsCloseListener</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_close_listener_callback">WS_CLOSE_LISTENER_CALLBACK</a> for more information.
     * @type {Pointer<Ptr>}
     */
    closeListenerCallback {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsabortlistener">WsAbortListener</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_abort_listener_callback">WS_ABORT_LISTENER_CALLBACK</a> for more information.
     * @type {Pointer<Ptr>}
     */
    abortListenerCallback {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetlistenerproperty">WsGetListenerProperty</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_get_listener_property_callback">WS_GET_LISTENER_PROPERTY_CALLBACK</a> for more information.
     * @type {Pointer<Ptr>}
     */
    getListenerPropertyCallback {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetlistenerproperty">WsSetListenerProperty</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_set_listener_property_callback">WS_SET_LISTENER_PROPERTY_CALLBACK</a> for more information.
     * @type {Pointer<Ptr>}
     */
    setListenerPropertyCallback {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannelforlistener">WsCreateChannelForListener</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_channel_for_listener_callback">WS_CREATE_CHANNEL_FOR_LISTENER_CALLBACK</a> for more information.
     * @type {Pointer<Ptr>}
     */
    createChannelForListenerCallback {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The callback that implements <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsacceptchannel">WsAcceptChannel</a>.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_accept_channel_callback">WS_ACCEPT_CHANNEL_CALLBACK</a> for more information.
     * @type {Pointer<Ptr>}
     */
    acceptChannelCallback {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
