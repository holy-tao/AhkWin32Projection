#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct MQMSGIDSIZE {
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
    static MQMSG_MSGID_SIZE => 20

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CORRELATIONID_SIZE => 20

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_XACTID_SIZE => 20
}
