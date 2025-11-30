#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SIGNER_SIGN_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static SIG_APPEND => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SPC_INC_PE_RESOURCES_FLAG => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SPC_INC_PE_DEBUG_INFO_FLAG => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SPC_INC_PE_IMPORT_ADDR_TABLE_FLAG => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SPC_EXC_PE_PAGE_HASHES_FLAG => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SPC_INC_PE_PAGE_HASHES_FLAG => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SPC_DIGEST_GENERATE_FLAG => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SPC_DIGEST_SIGN_FLAG => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SPC_DIGEST_SIGN_EX_FLAG => 16384
}
