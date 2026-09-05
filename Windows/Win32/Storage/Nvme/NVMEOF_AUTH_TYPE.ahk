#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVMEOF_AUTH_TYPE extends Win32Enum {

    /**
     * Native name: NvmeofAuthTypeCommonMessages
     * @type {Integer (Int32)}
     */
    static CommonMessages => 0

    /**
     * Native name: NvmeofAuthTypeDHCHAPMessages
     * @type {Integer (Int32)}
     */
    static TypeDHCHAPMessages => 1
}
