#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_REGISTER_STATE enumerated type indicates the network registration state of a Mobile Broadband device.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_register_state
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_REGISTER_STATE extends Win32Enum {

    /**
     * The device registration state is unknown.  This state may be set upon failure of registration mode change requests.
     * Native name: MBN_REGISTER_STATE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The device is not registered and not searching for a provider.
     * Native name: MBN_REGISTER_STATE_DEREGISTERED
     * @type {Integer (Int32)}
     */
    static DEREGISTERED => 1

    /**
     * The device is not registered and is searching for a provider.
     * Native name: MBN_REGISTER_STATE_SEARCHING
     * @type {Integer (Int32)}
     */
    static SEARCHING => 2

    /**
     * The device is on a home provider.
     * Native name: MBN_REGISTER_STATE_HOME
     * @type {Integer (Int32)}
     */
    static HOME => 3

    /**
     * The device is on a roaming provider.
     * Native name: MBN_REGISTER_STATE_ROAMING
     * @type {Integer (Int32)}
     */
    static ROAMING => 4

    /**
     * The device is on a roaming partner.
     * Native name: MBN_REGISTER_STATE_PARTNER
     * @type {Integer (Int32)}
     */
    static PARTNER => 5

    /**
     * The device was denied registration.  Emergency voice calls may be made.  This applies to voice and not data.
     * Native name: MBN_REGISTER_STATE_DENIED
     * @type {Integer (Int32)}
     */
    static DENIED => 6
}
