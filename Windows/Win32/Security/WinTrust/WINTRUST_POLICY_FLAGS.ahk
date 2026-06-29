#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WINTRUST_POLICY_FLAGS {
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
    static WTPF_TRUSTTEST => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WTPF_TESTCANBEVALID => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WTPF_IGNOREEXPIRATION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WTPF_IGNOREREVOKATION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static WTPF_OFFLINEOK_IND => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static WTPF_OFFLINEOK_COM => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static WTPF_OFFLINEOKNBU_IND => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static WTPF_OFFLINEOKNBU_COM => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static WTPF_VERIFY_V1_OFF => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WTPF_IGNOREREVOCATIONONTS => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static WTPF_ALLOWONLYPERTRUST => 262144
}
