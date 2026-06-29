#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct TCP_RTO_ALGORITHM {
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
    static TcpRtoAlgorithmOther => 1

    /**
     * @type {Integer (Int32)}
     */
    static TcpRtoAlgorithmConstant => 2

    /**
     * @type {Integer (Int32)}
     */
    static TcpRtoAlgorithmRsre => 3

    /**
     * @type {Integer (Int32)}
     */
    static TcpRtoAlgorithmVanj => 4

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_RTO_OTHER => 1

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_RTO_CONSTANT => 2

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_RTO_RSRE => 3

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_RTO_VANJ => 4
}
