#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct CRED_PERSIST {
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
    static CRED_PERSIST_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_PERSIST_SESSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_PERSIST_LOCAL_MACHINE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_PERSIST_ENTERPRISE => 3
}
