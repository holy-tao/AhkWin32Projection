#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The different states that a listener can be in.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_listener_state
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_LISTENER_STATE extends Win32Enum {

    /**
     * Native name: WS_LISTENER_STATE_CREATED
     * @type {Integer (Int32)}
     */
    static CREATED => 0

    /**
     * Native name: WS_LISTENER_STATE_OPENING
     * @type {Integer (Int32)}
     */
    static OPENING => 1

    /**
     * Native name: WS_LISTENER_STATE_OPEN
     * @type {Integer (Int32)}
     */
    static OPEN => 2

    /**
     * Native name: WS_LISTENER_STATE_FAULTED
     * @type {Integer (Int32)}
     */
    static FAULTED => 3

    /**
     * Native name: WS_LISTENER_STATE_CLOSING
     * @type {Integer (Int32)}
     */
    static CLOSING => 4

    /**
     * Native name: WS_LISTENER_STATE_CLOSED
     * @type {Integer (Int32)}
     */
    static CLOSED => 5
}
