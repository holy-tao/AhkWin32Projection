#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVMEOF_SECURE_CHANNEL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofSCUnspecified => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofSCRequired => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofSCNotRequired => 2

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofSCReserved => 3
}
