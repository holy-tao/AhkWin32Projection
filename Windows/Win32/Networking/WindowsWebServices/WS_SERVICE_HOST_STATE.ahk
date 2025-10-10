#Requires AutoHotkey v2.0.0 64-bit

/**
 * The states that a service host can be in.
 * @remarks
 * 
  * The following are the state transitions for a service host.
  * 
  * :::image type="content" source="./images/ServiceHostStates.png" border="false" alt-text="Diagram showing the possible states of a service host object and the transitions between them.":::
  * 
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_service_host_state
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SERVICE_HOST_STATE{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_HOST_STATE_CREATED => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_HOST_STATE_OPENING => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_HOST_STATE_OPEN => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_HOST_STATE_CLOSING => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_HOST_STATE_CLOSED => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_HOST_STATE_FAULTED => 5
}
