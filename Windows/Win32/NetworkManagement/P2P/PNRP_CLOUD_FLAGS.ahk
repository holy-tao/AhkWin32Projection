#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PNRP_CLOUD_FLAGS enumeration specifies the validity of a cloud name.
 * @see https://learn.microsoft.com/windows/win32/api/pnrpdef/ne-pnrpdef-pnrp_cloud_flags
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PNRP_CLOUD_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The cloud name is valid on the network.
     * @type {Integer (Int32)}
     */
    static PNRP_CLOUD_NO_FLAGS => 0

    /**
     * The cloud name is not valid on other computers.
     * @type {Integer (Int32)}
     */
    static PNRP_CLOUD_NAME_LOCAL => 1

    /**
     * The cloud is configured to be resolve only.  Names cannot be published to the cloud from this computer.
     * @type {Integer (Int32)}
     */
    static PNRP_CLOUD_RESOLVE_ONLY => 2

    /**
     * This machine is a full participant in the cloud, and can publish and resolve names.
     * @type {Integer (Int32)}
     */
    static PNRP_CLOUD_FULL_PARTICIPANT => 4
}
