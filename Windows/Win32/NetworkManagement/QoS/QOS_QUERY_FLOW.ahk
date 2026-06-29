#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The QOS_QUERY_FLOW enumeration indicates the type of information a QOSQueryFlow function will request.
 * @see https://learn.microsoft.com/windows/win32/api/qos2/ne-qos2-qos_query_flow
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct QOS_QUERY_FLOW {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates an information request for the flow fundamentals. This information includes bottleneck bandwidth, available bandwidth, and the average Round Trip Time (RTT)
     * @type {Integer (Int32)}
     */
    static QOSQueryFlowFundamentals => 0

    /**
     * Indicates a request for information detailing the QoS priority being added to flow packets.
     * @type {Integer (Int32)}
     */
    static QOSQueryPacketPriority => 1

    /**
     * Indicates a request for the flow rate specified during the creation of an agreement with the QoS subsystem via the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qossetflow">QOSSetFlow</a>  function.
     * @type {Integer (Int32)}
     */
    static QOSQueryOutgoingRate => 2
}
