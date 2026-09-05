#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The RAS_PORT_CONDITION enumerated type specifies information regarding the connection condition of a given RAS port.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ne-mprapi-ras_port_condition
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
class RAS_PORT_CONDITION extends Win32Enum {

    /**
     * The port is not operational.
     * Native name: RAS_PORT_NON_OPERATIONAL
     * @type {Integer (Int32)}
     */
    static NON_OPERATIONAL => 0

    /**
     * The port is disconnected.
     * Native name: RAS_PORT_DISCONNECTED
     * @type {Integer (Int32)}
     */
    static DISCONNECTED => 1

    /**
     * The port is in the process of a call back.
     * Native name: RAS_PORT_CALLING_BACK
     * @type {Integer (Int32)}
     */
    static CALLING_BACK => 2

    /**
     * The port is listening for incoming calls.
     * Native name: RAS_PORT_LISTENING
     * @type {Integer (Int32)}
     */
    static LISTENING => 3

    /**
     * The port is authenticating a user.
     * Native name: RAS_PORT_AUTHENTICATING
     * @type {Integer (Int32)}
     */
    static AUTHENTICATING => 4

    /**
     * The port has authenticated a user.
     * Native name: RAS_PORT_AUTHENTICATED
     * @type {Integer (Int32)}
     */
    static AUTHENTICATED => 5

    /**
     * The port is initializing.
     * Native name: RAS_PORT_INITIALIZING
     * @type {Integer (Int32)}
     */
    static INITIALIZING => 6
}
