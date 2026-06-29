#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WSA_COMPATIBILITY_BEHAVIOR_ID {
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
    static WsaBehaviorAll => 0

    /**
     * @type {Integer (Int32)}
     */
    static WsaBehaviorReceiveBuffering => 1

    /**
     * @type {Integer (Int32)}
     */
    static WsaBehaviorAutoTuning => 2
}
