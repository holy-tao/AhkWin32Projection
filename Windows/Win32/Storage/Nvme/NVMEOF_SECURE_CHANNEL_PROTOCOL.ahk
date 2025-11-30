#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVMEOF_SECURE_CHANNEL_PROTOCOL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofSecureChannelConcatNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofSecureChannelConcatWithTLS => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofSecureChannelNewTLSPSK => 2

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofSecureChannelReplaceTLSPSK => 2
}
