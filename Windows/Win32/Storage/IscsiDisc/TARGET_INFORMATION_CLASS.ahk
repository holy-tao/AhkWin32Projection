#Requires AutoHotkey v2.0.0 64-bit

/**
 * TARGET_INFORMATION_CLASS enumeration specifies information about the indicated target device that the GetIScsiTargetInformation function retrieves.
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ne-iscsidsc-target_information_class
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class TARGET_INFORMATION_CLASS{

    /**
     * A value of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ne-iscsidsc-targetprotocoltype">TARGETPROTOCOLTYPE</a> structure, indicating the protocol that the initiator uses to communicate with the target device.
     * @type {Integer (Int32)}
     */
    static ProtocolType => 0

    /**
     * A <b>null</b>-terminated string that contains the alias of the target device.
     * @type {Integer (Int32)}
     */
    static TargetAlias => 1

    /**
     * A list of <b>null</b>-terminated strings that describe the discovery mechanisms that located the indicated target. The list is terminated by a double <b>null</b>.
     * @type {Integer (Int32)}
     */
    static DiscoveryMechanisms => 2

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_portal_groupa">ISCSI_TARGET_PORTAL_GROUP</a> structure that contains descriptions of the portals in the portal group associated with the target.
     * @type {Integer (Int32)}
     */
    static PortalGroups => 3

    /**
     * An array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_mappinga">ISCSI_TARGET_MAPPING</a> structures that contains information about the HBAs and buses through which the target can be reached. The array is preceded by a <b>ULONG</b> value that contains the number of elements in the array. Each <b>ISCSI_TARGET_MAPPING</b> structure is aligned on a 4-byte boundary.
     * @type {Integer (Int32)}
     */
    static PersistentTargetMappings => 4

    /**
     * A <b>null</b>-terminated string that contains the initiator HBA that connects to the target.
     * @type {Integer (Int32)}
     */
    static InitiatorName => 5

    /**
     * The flags associated with the target. The following table lists the flags that can be associated with a target.
 * 
 * <table>
 * <tr>
 * <th>Target Flag</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>ISCSI_TARGET_FLAG_HIDE_STATIC_TARGET</td>
 * <td>The target will not be reported as discovered unless it is also discovered dynamically.</td>
 * </tr>
 * </table>
     * @type {Integer (Int32)}
     */
    static TargetFlags => 6

    /**
     * A value of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_login_options">ISCSI_LOGIN_OPTIONS</a> structure that defines the login data.
     * @type {Integer (Int32)}
     */
    static LoginOptions => 7
}
