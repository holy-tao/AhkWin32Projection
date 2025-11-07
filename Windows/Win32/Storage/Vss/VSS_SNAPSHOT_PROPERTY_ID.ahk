#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the property to be set for a shadow copy.
 * @see https://docs.microsoft.com/windows/win32/api//vss/ne-vss-vss_snapshot_property_id
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_SNAPSHOT_PROPERTY_ID{

    /**
     * The property is not known.
     * 
     * This value indicates an application error.
     * @type {Integer (Int32)}
     */
    static VSS_SPROPID_UNKNOWN => 0

    /**
     * The shadow copy identifier. For more information, see the <b>m_SnapshotId</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure.
     * @type {Integer (Int32)}
     */
    static VSS_SPROPID_SNAPSHOT_ID => 1

    /**
     * The shadow copy set identifier. For more information, see the <b>m_SnapshotSetId</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure.
     * @type {Integer (Int32)}
     */
    static VSS_SPROPID_SNAPSHOT_SET_ID => 2

    /**
     * The number of volumes included with the shadow copy in the shadow copy set when it was created. For more
     *      information, see the <b>m_lSnapshotsCount</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure.
     * @type {Integer (Int32)}
     */
    static VSS_SPROPID_SNAPSHOTS_COUNT => 3

    /**
     * Null-terminated wide character string that specifies the name of the device object for the shadow copy of the 
     *       volume. For more information, see the <b>m_pwszSnapshotDeviceObject</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure.
     * @type {Integer (Int32)}
     */
    static VSS_SPROPID_SNAPSHOT_DEVICE => 4

    /**
     * A null-terminated wide character string that specifies the name of the original volume. For more information, see the <b>m_pwszOriginalVolumeName</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure.
     * @type {Integer (Int32)}
     */
    static VSS_SPROPID_ORIGINAL_VOLUME => 5

    /**
     * A null-terminated wide character string that specifies the name of the machine that contains the original 
     *       volume. For more information, see the <b>m_pwszOriginatingMachine</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure.
     * @type {Integer (Int32)}
     */
    static VSS_SPROPID_ORIGINATING_MACHINE => 6

    /**
     * A null-terminated wide character string that specifies the name of the machine that is running the Volume Shadow Copy 
     *       Service that created the shadow copy. For more information, see the <b>m_pwszServiceMachine</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure.
     * @type {Integer (Int32)}
     */
    static VSS_SPROPID_SERVICE_MACHINE => 7

    /**
     * A null-terminated wide character string that specifies the name of the shadow copy when it is exposed. For more information, see the <b>m_pwszExposedName</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure.
     * @type {Integer (Int32)}
     */
    static VSS_SPROPID_EXPOSED_NAME => 8

    /**
     * A null-terminated wide character string that specifies the portion of the volume that is made available 
     *       when the shadow copy is exposed as a file share. For more information, see the <b>m_pwszExposedPath</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure.
     * @type {Integer (Int32)}
     */
    static VSS_SPROPID_EXPOSED_PATH => 9

    /**
     * The provider identifier. For more information, see the <b>m_ProviderId</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure.
     * @type {Integer (Int32)}
     */
    static VSS_SPROPID_PROVIDER_ID => 10

    /**
     * A bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_volume_snapshot_attributes">_VSS_VOLUME_SNAPSHOT_ATTRIBUTES</a> values that specify the properties of the shadow copy. For more information, see the <b>m_lSnapshotAttributes</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure.
     * @type {Integer (Int32)}
     */
    static VSS_SPROPID_SNAPSHOT_ATTRIBUTES => 11

    /**
     * A time stamp that specifies when the shadow copy was created. For more information, see the <b>m_tsCreationTimestamp</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure.
     * @type {Integer (Int32)}
     */
    static VSS_SPROPID_CREATION_TIMESTAMP => 12

    /**
     * The status of the current shadow copy creation operation. For more information, see the <b>m_eStatus</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure.
     * @type {Integer (Int32)}
     */
    static VSS_SPROPID_STATUS => 13
}
