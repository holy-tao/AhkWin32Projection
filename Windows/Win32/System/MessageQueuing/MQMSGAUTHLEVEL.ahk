#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct MQMSGAUTHLEVEL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTH_LEVEL_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTH_LEVEL_ALWAYS => 1

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTH_LEVEL_MSMQ10 => 2

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTH_LEVEL_SIG10 => 2

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTH_LEVEL_MSMQ20 => 4

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTH_LEVEL_SIG20 => 4

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTH_LEVEL_SIG30 => 8
}
