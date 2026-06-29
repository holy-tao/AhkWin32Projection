#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct MQMSGAUTHENTICATION {
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
    static MQMSG_AUTHENTICATION_NOT_REQUESTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTHENTICATION_REQUESTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTHENTICATED_SIG10 => 1

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTHENTICATION_REQUESTED_EX => 3

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTHENTICATED_SIG20 => 3

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTHENTICATED_SIG30 => 5

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTHENTICATED_SIGXML => 9
}
