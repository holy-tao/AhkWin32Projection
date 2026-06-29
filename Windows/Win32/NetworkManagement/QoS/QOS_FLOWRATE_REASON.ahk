#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The QOS_FLOWRATE_REASON enumeration indicates the reason for a change in a flow's bandwidth.
 * @see https://learn.microsoft.com/windows/win32/api/qos2/ne-qos2-qos_flowrate_reason
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct QOS_FLOWRATE_REASON {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that there has not been a change in the flow.
     * @type {Integer (Int32)}
     */
    static QOSFlowRateNotApplicable => 0

    /**
     * Indicates that the content of a flow has changed.
     * @type {Integer (Int32)}
     */
    static QOSFlowRateContentChange => 1

    /**
     * Indicates that the flow has changed due to congestion.
     * @type {Integer (Int32)}
     */
    static QOSFlowRateCongestion => 2

    /**
     * @type {Integer (Int32)}
     */
    static QOSFlowRateHigherContentEncoding => 3

    /**
     * Indicates that the user has caused the flow to change.
     * @type {Integer (Int32)}
     */
    static QOSFlowRateUserCaused => 4
}
