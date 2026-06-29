#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SIGNER_SIGN_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
