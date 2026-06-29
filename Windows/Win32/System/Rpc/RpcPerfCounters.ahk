#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RpcPerfCounters {
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
    static RpcCurrentUniqueUser => 1

    /**
     * @type {Integer (Int32)}
     */
    static RpcBackEndConnectionAttempts => 2

    /**
     * @type {Integer (Int32)}
     */
    static RpcBackEndConnectionFailed => 3

    /**
     * @type {Integer (Int32)}
     */
    static RpcRequestsPerSecond => 4

    /**
     * @type {Integer (Int32)}
     */
    static RpcIncomingConnections => 5

    /**
     * @type {Integer (Int32)}
     */
    static RpcIncomingBandwidth => 6

    /**
     * @type {Integer (Int32)}
     */
    static RpcOutgoingBandwidth => 7

    /**
     * @type {Integer (Int32)}
     */
    static RpcAttemptedLbsDecisions => 8

    /**
     * @type {Integer (Int32)}
     */
    static RpcFailedLbsDecisions => 9

    /**
     * @type {Integer (Int32)}
     */
    static RpcAttemptedLbsMessages => 10

    /**
     * @type {Integer (Int32)}
     */
    static RpcFailedLbsMessages => 11

    /**
     * @type {Integer (Int32)}
     */
    static RpcLastCounter => 12
}
