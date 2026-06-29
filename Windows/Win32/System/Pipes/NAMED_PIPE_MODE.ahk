#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Pipes
 */
export default struct NAMED_PIPE_MODE {
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
    static PIPE_WAIT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_NOWAIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_READMODE_BYTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_READMODE_MESSAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_CLIENT_END => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_SERVER_END => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_TYPE_BYTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_TYPE_MESSAGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_ACCEPT_REMOTE_CLIENTS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_REJECT_REMOTE_CLIENTS => 8
}
