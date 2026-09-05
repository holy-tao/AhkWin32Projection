#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_SGL_DESC_SUBTYPE extends Win32Enum {

    /**
     * Native name: NvmeSglDescSubtypeAddress
     * @type {Integer (Int32)}
     */
    static Address => 0

    /**
     * Native name: NvmeSglDescSubtypeOffset
     * @type {Integer (Int32)}
     */
    static Offset => 1

    /**
     * Native name: NvmeSglDescSubtypeTransportA
     * @type {Integer (Int32)}
     */
    static TransportA => 10

    /**
     * Native name: NvmeSglDescSubtypeTransportB
     * @type {Integer (Int32)}
     */
    static TransportB => 11

    /**
     * Native name: NvmeSglDescSubtypeTransportC
     * @type {Integer (Int32)}
     */
    static TransportC => 12

    /**
     * Native name: NvmeSglDescSubtypeTransportD
     * @type {Integer (Int32)}
     */
    static TransportD => 13

    /**
     * Native name: NvmeSglDescSubtypeTransportE
     * @type {Integer (Int32)}
     */
    static TransportE => 14

    /**
     * Native name: NvmeSglDescSubtypeTransportF
     * @type {Integer (Int32)}
     */
    static TransportF => 15
}
