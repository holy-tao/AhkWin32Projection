#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_MANDATORY_POLICY_ID {
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
    static TOKEN_MANDATORY_POLICY_OFF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_MANDATORY_POLICY_NO_WRITE_UP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_MANDATORY_POLICY_NEW_PROCESS_MIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_MANDATORY_POLICY_VALID_MASK => 3
}
