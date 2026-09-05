#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVMEOF_SECURE_CHANNEL_PROTOCOL extends Win32Enum {

    /**
     * Native name: NvmeofSecureChannelConcatNone
     * @type {Integer (Int32)}
     */
    static ConcatNone => 0

    /**
     * Native name: NvmeofSecureChannelConcatWithTLS
     * @type {Integer (Int32)}
     */
    static ConcatWithTLS => 1

    /**
     * Native name: NvmeofSecureChannelNewTLSPSK
     * @type {Integer (Int32)}
     */
    static NewTLSPSK => 2

    /**
     * Native name: NvmeofSecureChannelReplaceTLSPSK
     * @type {Integer (Int32)}
     */
    static ReplaceTLSPSK => 2
}
