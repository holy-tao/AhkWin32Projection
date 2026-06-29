#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct SECURITY_MESSAGE_MSG_ID {
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
    static SECURITYMSG_SUCCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITYMSG_FAILURE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITYMSG_ERROR => 3
}
