#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_REGISTER_STATE enumerated type indicates the network registration state of a Mobile Broadband device.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-mbn_register_state
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_REGISTER_STATE extends Win32Enum{

    /**
     * The device registration state is unknown.  This state may be set upon failure of registration mode change requests.
     * @type {Integer (Int32)}
     */
    static MBN_REGISTER_STATE_NONE => 0

    /**
     * The device is not registered and not searching for a provider.
     * @type {Integer (Int32)}
     */
    static MBN_REGISTER_STATE_DEREGISTERED => 1

    /**
     * The device is not registered and is searching for a provider.
     * @type {Integer (Int32)}
     */
    static MBN_REGISTER_STATE_SEARCHING => 2

    /**
     * The device is on a home provider.
     * @type {Integer (Int32)}
     */
    static MBN_REGISTER_STATE_HOME => 3

    /**
     * The device is on a roaming provider.
     * @type {Integer (Int32)}
     */
    static MBN_REGISTER_STATE_ROAMING => 4

    /**
     * The device is on a roaming partner.
     * @type {Integer (Int32)}
     */
    static MBN_REGISTER_STATE_PARTNER => 5

    /**
     * The device was denied registration.  Emergency voice calls may be made.  This applies to voice and not data.
     * @type {Integer (Int32)}
     */
    static MBN_REGISTER_STATE_DENIED => 6
}
