#Requires AutoHotkey v2.0.0 64-bit

/**
 * The different states that a listener can be in.
 * @remarks
 * 
 * The following are the state transitions for a Listener.
 * 
 * :::image type="content" source="./images/ListenerStates.png" border="false" alt-text="Diagram showing the possible states of a Listener object and the transitions between them.":::
 * 
 * A listener will only move to <b>WS_LISTENER_STATE_FAULTED</b> 
 *                 state if <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsabortlistener">WsAbortListener</a> is called.
 *             
 * 
 * Note that only the valid state transitions are shown.  Using
 *                 a function not shown for a given state will result in an
 *                 <b>WS_E_INVALID_OPERATION</b> error being returned from
 *                 the function (or crash in the case of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreelistener">WsFreeListener</a>).
 *             See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_listener_state
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_LISTENER_STATE{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_STATE_CREATED => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_STATE_OPENING => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_STATE_OPEN => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_STATE_FAULTED => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_STATE_CLOSING => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_STATE_CLOSED => 5
}
