#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVMEOF_AUTH_DHCHAP_GROUP_ID extends Win32Enum {

    /**
     * Native name: NvmeofAuthDHCHAPGroupNull
     * @type {Integer (Int32)}
     */
    static Null => 0

    /**
     * Native name: NvmeofAuthDHCHAPGroup2048
     * @type {Integer (Int32)}
     */
    static Group2048 => 1

    /**
     * Native name: NvmeofAuthDHCHAPGroup3072
     * @type {Integer (Int32)}
     */
    static Group3072 => 2

    /**
     * Native name: NvmeofAuthDHCHAPGroup4096
     * @type {Integer (Int32)}
     */
    static Group4096 => 3

    /**
     * Native name: NvmeofAuthDHCHAPGroup6144
     * @type {Integer (Int32)}
     */
    static Group6144 => 4

    /**
     * Native name: NvmeofAuthDHCHAPGroup8192
     * @type {Integer (Int32)}
     */
    static Group8192 => 5

    /**
     * Native name: NvmeofAuthDHCHAPGroupMax
     * @type {Integer (Int32)}
     */
    static Max => 255
}
