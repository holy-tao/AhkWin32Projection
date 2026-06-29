#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDK_RDMA_TECHNOLOGY {
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
    static NdkUndefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdkiWarp => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdkInfiniBand => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdkRoCE => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdkRoCEv2 => 4

    /**
     * @type {Integer (Int32)}
     */
    static NdkMaxTechnology => 5
}
