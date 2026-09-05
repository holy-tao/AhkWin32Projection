#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The QOS_QUERY_FLOW enumeration indicates the type of information a QOSQueryFlow function will request.
 * @see https://learn.microsoft.com/windows/win32/api/qos2/ne-qos2-qos_query_flow
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
class QOS_QUERY_FLOW extends Win32Enum {

    /**
     * Indicates an information request for the flow fundamentals. This information includes bottleneck bandwidth, available bandwidth, and the average Round Trip Time (RTT)
     * Native name: QOSQueryFlowFundamentals
     * @type {Integer (Int32)}
     */
    static Fundamentals => 0

    /**
     * Indicates a request for information detailing the QoS priority being added to flow packets.
     * Native name: QOSQueryPacketPriority
     * @type {Integer (Int32)}
     */
    static PacketPriority => 1

    /**
     * Indicates a request for the flow rate specified during the creation of an agreement with the QoS subsystem via the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qossetflow">QOSSetFlow</a>  function.
     * Native name: QOSQueryOutgoingRate
     * @type {Integer (Int32)}
     */
    static OutgoingRate => 2
}
