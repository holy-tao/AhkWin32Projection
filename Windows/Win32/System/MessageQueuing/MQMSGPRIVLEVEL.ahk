#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct MQMSGPRIVLEVEL {
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
    static MQMSG_PRIV_LEVEL_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_PRIV_LEVEL_BODY_BASE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_PRIV_LEVEL_BODY_ENHANCED => 3
}
