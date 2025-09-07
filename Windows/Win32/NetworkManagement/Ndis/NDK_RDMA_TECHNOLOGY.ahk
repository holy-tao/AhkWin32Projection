#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDK_RDMA_TECHNOLOGY{

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
