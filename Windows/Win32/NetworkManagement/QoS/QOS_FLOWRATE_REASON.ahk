#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The QOS_FLOWRATE_REASON enumeration indicates the reason for a change in a flow's bandwidth.
 * @see https://learn.microsoft.com/windows/win32/api/qos2/ne-qos2-qos_flowrate_reason
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
class QOS_FLOWRATE_REASON extends Win32Enum {

    /**
     * Indicates that there has not been a change in the flow.
     * Native name: QOSFlowRateNotApplicable
     * @type {Integer (Int32)}
     */
    static FlowRateNotApplicable => 0

    /**
     * Indicates that the content of a flow has changed.
     * Native name: QOSFlowRateContentChange
     * @type {Integer (Int32)}
     */
    static FlowRateContentChange => 1

    /**
     * Indicates that the flow has changed due to congestion.
     * Native name: QOSFlowRateCongestion
     * @type {Integer (Int32)}
     */
    static FlowRateCongestion => 2

    /**
     * Native name: QOSFlowRateHigherContentEncoding
     * @type {Integer (Int32)}
     */
    static FlowRateHigherContentEncoding => 3

    /**
     * Indicates that the user has caused the flow to change.
     * Native name: QOSFlowRateUserCaused
     * @type {Integer (Int32)}
     */
    static FlowRateUserCaused => 4
}
