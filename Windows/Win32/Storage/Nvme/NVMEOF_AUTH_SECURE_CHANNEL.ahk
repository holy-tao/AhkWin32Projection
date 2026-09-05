#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVMEOF_AUTH_SECURE_CHANNEL extends Win32Enum {

    /**
     * Native name: NvmeofAuthSCUnspecified
     * @type {Integer (Int32)}
     */
    static AuthSCUnspecified => 0

    /**
     * Native name: NvmeofAuthSCAuthRequired
     * @type {Integer (Int32)}
     */
    static AuthSCAuthRequired => 1

    /**
     * Native name: NvmeofAuthSCAuthConcatSCRequired
     * @type {Integer (Int32)}
     */
    static AuthSCAuthConcatSCRequired => 2

    /**
     * Native name: NvmeofAuthSCReserved
     * @type {Integer (Int32)}
     */
    static AuthSCReserved => 3
}
