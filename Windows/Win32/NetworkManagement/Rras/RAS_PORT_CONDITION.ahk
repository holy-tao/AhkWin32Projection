#Requires AutoHotkey v2.0.0 64-bit

/**
 * The RAS_PORT_CONDITION enumerated type specifies information regarding the connection condition of a given RAS port.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ne-mprapi-ras_port_condition
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RAS_PORT_CONDITION{

    /**
     * The port is not operational.
     * @type {Integer (Int32)}
     */
    static RAS_PORT_NON_OPERATIONAL => 0

    /**
     * The port is disconnected.
     * @type {Integer (Int32)}
     */
    static RAS_PORT_DISCONNECTED => 1

    /**
     * The port is in the process of a call back.
     * @type {Integer (Int32)}
     */
    static RAS_PORT_CALLING_BACK => 2

    /**
     * The port is listening for incoming calls.
     * @type {Integer (Int32)}
     */
    static RAS_PORT_LISTENING => 3

    /**
     * The port is authenticating a user.
     * @type {Integer (Int32)}
     */
    static RAS_PORT_AUTHENTICATING => 4

    /**
     * The port has authenticated a user.
     * @type {Integer (Int32)}
     */
    static RAS_PORT_AUTHENTICATED => 5

    /**
     * The port is initializing.
     * @type {Integer (Int32)}
     */
    static RAS_PORT_INITIALIZING => 6
}
