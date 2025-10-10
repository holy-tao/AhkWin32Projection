#Requires AutoHotkey v2.0.0 64-bit

/**
 * The QOS_SHAPING enumeration defines the shaping behavior of a flow.
 * @see https://docs.microsoft.com/windows/win32/api//qos2/ne-qos2-qos_shaping
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QOS_SHAPING{

    /**
     * Indicates that the Windows packet scheduler (Pacer) will be used to enforce the requested flow rate. Data packets that exceed the rate are delayed until appropriate in order to maintain the specified flow rate.  If the network supports prioritization, packets will always receive conformant priority values when QOSShapeFlow is specified.
     * @type {Integer (Int32)}
     */
    static QOSShapeOnly => 0

    /**
     * Indicates that the Windows Scheduler will be used to enforce the requested flow rate. Data packets exceeding the rate are delayed accordingly.  Packets receive conformant priority values.
     * @type {Integer (Int32)}
     */
    static QOSShapeAndMark => 1

    /**
     * Indicates that the flow rate requested will not be enforced.  Data packets that would exceed the flow rate will receive a priority that indicates they are non-conformant.  This may lead to lost and reordered packets.
     * @type {Integer (Int32)}
     */
    static QOSUseNonConformantMarkings => 2
}
