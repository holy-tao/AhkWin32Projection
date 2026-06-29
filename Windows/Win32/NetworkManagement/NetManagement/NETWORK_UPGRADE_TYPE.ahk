#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct NETWORK_UPGRADE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static NSF_WIN16_UPGRADE => 16

    /**
     * @type {Integer (Int32)}
     */
    static NSF_WIN95_UPGRADE => 32

    /**
     * @type {Integer (Int32)}
     */
    static NSF_WINNT_WKS_UPGRADE => 64

    /**
     * @type {Integer (Int32)}
     */
    static NSF_WINNT_SVR_UPGRADE => 128

    /**
     * @type {Integer (Int32)}
     */
    static NSF_WINNT_SBS_UPGRADE => 256

    /**
     * @type {Integer (Int32)}
     */
    static NSF_COMPONENT_UPDATE => 512
}
