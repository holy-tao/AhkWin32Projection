#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct TUNNEL_SUB_TYPE {
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
    static TUNNEL_SUB_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static TUNNEL_SUB_TYPE_CP => 1

    /**
     * @type {Integer (Int32)}
     */
    static TUNNEL_SUB_TYPE_IPTLS => 2

    /**
     * @type {Integer (Int32)}
     */
    static TUNNEL_SUB_TYPE_HA => 3
}
