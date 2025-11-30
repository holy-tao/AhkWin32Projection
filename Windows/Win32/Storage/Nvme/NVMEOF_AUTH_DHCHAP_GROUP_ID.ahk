#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVMEOF_AUTH_DHCHAP_GROUP_ID extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPGroupNull => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPGroup2048 => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPGroup3072 => 2

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPGroup4096 => 3

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPGroup6144 => 4

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPGroup8192 => 5

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPGroupMax => 255
}
