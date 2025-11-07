#Requires AutoHotkey v2.0.0 64-bit

/**
 * The QOS_TRAFFIC_TYPE enumeration defines the various traffic types. Each flow has a single traffic type. This allows the QOS subsystem to apply user-specified policies to each type.
 * @remarks
 * 
 * 802.1p tags are  added to sent traffic only when the following conditions are met:<ul>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosaddsockettoflow">QOSAddSocketToFlow</a> is called without the QOS_NON_ADAPTIVE_FLOW flag</li>
 * <li> The destination host is on the local link and not across a router</li>
 * <li>The qWAVE subsystem has determined that 802.1p tagged packets are not discarded by a network element on the end-to-end path
 * </li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//qos2/ne-qos2-qos_traffic_type
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QOS_TRAFFIC_TYPE{

    /**
     * Flow traffic has the same network priority as regular traffic not associated with QOS.
 * 
 * This traffic type is the same as not specifying priority, and as a result,  the DSCP mark and 802.1p tag are not added to sent traffic.
     * @type {Integer (Int32)}
     */
    static QOSTrafficTypeBestEffort => 0

    /**
     * Flow traffic has a network priority lower than that of <b>QOSTrafficTypeBestEffort</b>.  This traffic type could be used for traffic of an application doing data backup.
 * 
 * Sent traffic will contain a DSCP mark with a value of 0x08 and an 802.1p tag with a value of 2.
     * @type {Integer (Int32)}
     */
    static QOSTrafficTypeBackground => 1

    /**
     * Flow traffic has a network priority higher than <b>QOSTrafficTypeBestEffort</b>, yet lower than <b>QOSTrafficTypeAudioVideo</b>.  This traffic type should be used for data traffic that is more important than normal end-user scenarios, such as email.
 * 
 * Sent traffic will contain a DSCP mark with value of 0x28 and 802.1p tag with a value of 5.
     * @type {Integer (Int32)}
     */
    static QOSTrafficTypeExcellentEffort => 2

    /**
     * Flow traffic has a network priority higher than <b>QOSTrafficTypeExcellentEffort</b>, yet lower than <b>QOSTrafficTypeVoice</b>.  This traffic type should be used for A/V streaming scenarios such as MPEG2 streaming.
 * 
 * Sent traffic will contain a DSCP mark with a value of 0x28 and an 802.1p tag with a value of 5.
     * @type {Integer (Int32)}
     */
    static QOSTrafficTypeAudioVideo => 3

    /**
     * Flow traffic has a network priority higher than <b>QOSTrafficTypeAudioVideo</b>, yet lower than <b>QOSTrafficTypeControl</b>.  This traffic type should be used for realtime voice streams such as VOIP.
 * 
 * Sent traffic will contain a DSCP mark with a value of 0x38 and an 802.1p tag with a value of 7.
     * @type {Integer (Int32)}
     */
    static QOSTrafficTypeVoice => 4

    /**
     * Flow traffic has the highest network priority.  This traffic type should only be used for the most critical of data.  For example, it may be used for data carrying user inputs.
 * 
 * Sent traffic will contain a DSCP mark with a value of 0x38 and an 802.1p tag with a value of 7.
     * @type {Integer (Int32)}
     */
    static QOSTrafficTypeControl => 5
}
