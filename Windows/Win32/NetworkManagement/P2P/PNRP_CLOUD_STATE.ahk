#Requires AutoHotkey v2.0.0 64-bit

/**
 * The PNRP_CLOUD_STATE enumeration specifies the different states a PNRP cloud can be in.
 * @see https://learn.microsoft.com/windows/win32/api/pnrpdef/ne-pnrpdef-pnrp_cloud_state
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PNRP_CLOUD_STATE{

    /**
     * The cloud is not yet initialized.
     * @type {Integer (Int32)}
     */
    static PNRP_CLOUD_STATE_VIRTUAL => 0

    /**
     * The cloud is in the process of being initialized.
     * @type {Integer (Int32)}
     */
    static PNRP_CLOUD_STATE_SYNCHRONISING => 1

    /**
     * The cloud is active.
     * @type {Integer (Int32)}
     */
    static PNRP_CLOUD_STATE_ACTIVE => 2

    /**
     * The cloud is initialized, but has lost its connection to the network.
     * @type {Integer (Int32)}
     */
    static PNRP_CLOUD_STATE_DEAD => 3

    /**
     * The cloud is disabled in the registry.
     * @type {Integer (Int32)}
     */
    static PNRP_CLOUD_STATE_DISABLED => 4

    /**
     * The cloud was active, but has lost access to the network. In this state the cloud can still be used for registration but it is not capable of resolving addresses.
     * @type {Integer (Int32)}
     */
    static PNRP_CLOUD_STATE_NO_NET => 5

    /**
     * The local node bootstrapped, but found no other nodes in the cloud. This can also be the result of a network issue, like a firewall, preventing the local node from locating other nodes within the cloud. It is also important to note that a cloud in the <b>PNRP_CLOUD_STATE_ALONE</b> state may not have registered IP addresses.
 * 
 * <div class="alert"><b>Note</b>  It is possible for a local node to lose network connectivity while in this cloud state and not make the transition to the <b>PNRP_CLOUD_STATE_NO_NET</b> state.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static PNRP_CLOUD_STATE_ALONE => 6
}
