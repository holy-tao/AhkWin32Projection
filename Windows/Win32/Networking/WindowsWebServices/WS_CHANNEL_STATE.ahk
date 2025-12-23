#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The different states that a channel can be in.
 * @remarks
 * The following are the state transitions for a channel.
 *             
 * 
 * :::image type="content" source="./images/ChannelStates.png" border="false" alt-text="Diagram of the state transitions for a Channel object. A second diagram shows the Sub-states for the Channel's Open state.":::
 * 
 * A channel may move to the <b>WS_CHANNEL_STATE_FAULTED</b> 
 *                 state even if <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsabortchannel">WsAbortChannel</a> was never called.
 *                 This will only occur if the channel can no longer be used.
 *             
 * 
 * Note that only the valid state transitions are shown.  Using
 *                 a function not shown for a given state will result in an
 *                 <b>WS_E_INVALID_OPERATION</b> error being returned from
 *                 the function (or crash in the case of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreechannel">WsFreeChannel</a>).
 *             For information on error codes, see<a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_channel_state
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CHANNEL_STATE extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_CHANNEL_STATE_CREATED => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_CHANNEL_STATE_OPENING => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_CHANNEL_STATE_ACCEPTING => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_CHANNEL_STATE_OPEN => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_CHANNEL_STATE_FAULTED => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_CHANNEL_STATE_CLOSING => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_CHANNEL_STATE_CLOSED => 6
}
