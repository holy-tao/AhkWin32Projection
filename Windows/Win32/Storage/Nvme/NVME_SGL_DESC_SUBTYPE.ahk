#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_SGL_DESC_SUBTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescSubtypeAddress => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescSubtypeOffset => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescSubtypeTransportA => 10

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescSubtypeTransportB => 11

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescSubtypeTransportC => 12

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescSubtypeTransportD => 13

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescSubtypeTransportE => 14

    /**
     * @type {Integer (Int32)}
     */
    static NvmeSglDescSubtypeTransportF => 15
}
