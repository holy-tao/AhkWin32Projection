#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The QOS_FLOWRATE_REASON enumeration indicates the reason for a change in a flow's bandwidth.
 * @see https://learn.microsoft.com/windows/win32/api/qos2/ne-qos2-qos_flowrate_reason
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QOS_FLOWRATE_REASON extends Win32Enum{

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
     * 
     * @type {Integer (Int32)}
     */
    static QOSFlowRateHigherContentEncoding => 3

    /**
     * Indicates that the user has caused the flow to change.
     * @type {Integer (Int32)}
     */
    static QOSFlowRateUserCaused => 4
}
