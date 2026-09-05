#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class RpcPerfCounters extends Win32Enum {

    /**
     * Native name: RpcCurrentUniqueUser
     * @type {Integer (Int32)}
     */
    static CurrentUniqueUser => 1

    /**
     * Native name: RpcBackEndConnectionAttempts
     * @type {Integer (Int32)}
     */
    static BackEndConnectionAttempts => 2

    /**
     * Native name: RpcBackEndConnectionFailed
     * @type {Integer (Int32)}
     */
    static BackEndConnectionFailed => 3

    /**
     * Native name: RpcRequestsPerSecond
     * @type {Integer (Int32)}
     */
    static RequestsPerSecond => 4

    /**
     * Native name: RpcIncomingConnections
     * @type {Integer (Int32)}
     */
    static IncomingConnections => 5

    /**
     * Native name: RpcIncomingBandwidth
     * @type {Integer (Int32)}
     */
    static IncomingBandwidth => 6

    /**
     * Native name: RpcOutgoingBandwidth
     * @type {Integer (Int32)}
     */
    static OutgoingBandwidth => 7

    /**
     * Native name: RpcAttemptedLbsDecisions
     * @type {Integer (Int32)}
     */
    static AttemptedLbsDecisions => 8

    /**
     * Native name: RpcFailedLbsDecisions
     * @type {Integer (Int32)}
     */
    static FailedLbsDecisions => 9

    /**
     * Native name: RpcAttemptedLbsMessages
     * @type {Integer (Int32)}
     */
    static AttemptedLbsMessages => 10

    /**
     * Native name: RpcFailedLbsMessages
     * @type {Integer (Int32)}
     */
    static FailedLbsMessages => 11

    /**
     * Native name: RpcLastCounter
     * @type {Integer (Int32)}
     */
    static LastCounter => 12
}
