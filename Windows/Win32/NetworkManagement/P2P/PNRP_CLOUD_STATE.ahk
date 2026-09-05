#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PNRP_CLOUD_STATE enumeration specifies the different states a PNRP cloud can be in.
 * @see https://learn.microsoft.com/windows/win32/api/pnrpdef/ne-pnrpdef-pnrp_cloud_state
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class PNRP_CLOUD_STATE extends Win32Enum {

    /**
     * The cloud is not yet initialized.
     * Native name: PNRP_CLOUD_STATE_VIRTUAL
     * @type {Integer (Int32)}
     */
    static VIRTUAL => 0

    /**
     * The cloud is in the process of being initialized.
     * Native name: PNRP_CLOUD_STATE_SYNCHRONISING
     * @type {Integer (Int32)}
     */
    static SYNCHRONISING => 1

    /**
     * The cloud is active.
     * Native name: PNRP_CLOUD_STATE_ACTIVE
     * @type {Integer (Int32)}
     */
    static ACTIVE => 2

    /**
     * The cloud is initialized, but has lost its connection to the network.
     * Native name: PNRP_CLOUD_STATE_DEAD
     * @type {Integer (Int32)}
     */
    static DEAD => 3

    /**
     * The cloud is disabled in the registry.
     * Native name: PNRP_CLOUD_STATE_DISABLED
     * @type {Integer (Int32)}
     */
    static DISABLED => 4

    /**
     * The cloud was active, but has lost access to the network. In this state the cloud can still be used for registration but it is not capable of resolving addresses.
     * Native name: PNRP_CLOUD_STATE_NO_NET
     * @type {Integer (Int32)}
     */
    static NO_NET => 5

    /**
     * The local node bootstrapped, but found no other nodes in the cloud. This can also be the result of a network issue, like a firewall, preventing the local node from locating other nodes within the cloud. It is also important to note that a cloud in the <b>PNRP_CLOUD_STATE_ALONE</b> state may not have registered IP addresses.
     * 
     * <div class="alert"><b>Note</b>  It is possible for a local node to lose network connectivity while in this cloud state and not make the transition to the <b>PNRP_CLOUD_STATE_NO_NET</b> state.</div>
     * <div> </div>
     * Native name: PNRP_CLOUD_STATE_ALONE
     * @type {Integer (Int32)}
     */
    static ALONE => 6
}
