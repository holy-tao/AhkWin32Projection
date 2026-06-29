#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MBN_REGISTER_STATE enumerated type indicates the network registration state of a Mobile Broadband device.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_register_state
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_REGISTER_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
