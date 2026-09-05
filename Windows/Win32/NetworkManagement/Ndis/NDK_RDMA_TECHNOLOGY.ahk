#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDK_RDMA_TECHNOLOGY extends Win32Enum {

    /**
     * Native name: NdkUndefined
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdkiWarp => 1

    /**
     * Native name: NdkInfiniBand
     * @type {Integer (Int32)}
     */
    static InfiniBand => 2

    /**
     * Native name: NdkRoCE
     * @type {Integer (Int32)}
     */
    static RoCE => 3

    /**
     * Native name: NdkRoCEv2
     * @type {Integer (Int32)}
     */
    static RoCEv2 => 4

    /**
     * Native name: NdkMaxTechnology
     * @type {Integer (Int32)}
     */
    static MaxTechnology => 5
}
