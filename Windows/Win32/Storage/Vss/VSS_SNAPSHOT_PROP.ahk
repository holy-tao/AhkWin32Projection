#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VSS_SNAPSHOT_STATE.ahk" { VSS_SNAPSHOT_STATE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains the properties of a shadow copy or shadow copy set.
 * @remarks
 * Requesters typically obtain a pointer to a <b>VSS_SNAPSHOT_PROP</b> structure by using the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getsnapshotproperties">IVssBackupComponents::GetSnapshotProperties</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/vsprov/nf-vsprov-ivsssoftwaresnapshotprovider-getsnapshotproperties">IVssSoftwareSnapshotProvider::GetSnapshotProperties</a> method. When this structure is no longer needed, the caller is responsible for freeing it by using the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-vssfreesnapshotproperties">VssFreeSnapshotProperties</a> function.
 * 
 * The shadow copy device object contained in <b>m_pwszSnapshotDeviceObject</b> is used to 
 *     address files on the shadow copy of the volume. For instance, if the original volume has a file with a path of 
 *     "\topleveldir\File.html", then the path to the shadow copy of the file is 
 *     "<b>m_pwszSnapshotDeviceObject</b>"+"\topleveldir\File.html".
 * 
 * When a shadow copy is exposed as a share, the value of 
 *     <b>m_pwszExposedName</b> will be the share name. When the shadow copy is exposed as a drive letter or mounted folder, the shadow copy <b>m_pwszExposedName</b> is a 
 *     drive letter followed by a colon—for example, "X:" or a mounted folder path 
 *     (for example, "Y:\MountX").
 * 
 * If a shadow copy is exposed as a drive letter or mounted folder, then (as with mounting 
 *     any device) the entire shadow copy starting at its root will be exposed at the mount point. In this case, 
 *     <b>m_pwszExposedPath</b> will be null.
 * 
 * If the shadow copy is exposed as a share, the value of 
 *     <b>m_pwszExposedPath</b> will be the path to the portion of the volume that is shared.
 * @see https://learn.microsoft.com/windows/win32/api/vss/ns-vss-vss_snapshot_prop
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct VSS_SNAPSHOT_PROP {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/VSS/volume-shadow-copy-api-data-types">VSS_ID</a> (GUID) uniquely 
     *       identifying the shadow copy identifier.
     */
    m_SnapshotId : Guid

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/VSS/volume-shadow-copy-api-data-types">VSS_ID</a> (GUID) 
     *       uniquely identifying the shadow copy set containing the shadow copy.
     */
    m_SnapshotSetId : Guid

    /**
     * Number of volumes included with the shadow copy in the shadow copy set when it was created. Because it is 
     *       possible for applications to release individual shadow copies without releasing the shadow copy set, at any 
     *       given time the number of shadow copies in the shadow copy set may be less than 
     *       <b>m_LSnapshotsCount</b>. 
     *       
     * 
     * The maximum number of shadow-copied volumes permitted in a shadow copy set is 64.
     */
    m_lSnapshotsCount : Int32

    /**
     * Null-terminated wide character string containing the name of the device object for the shadow copy of the 
     *       volume. The device object can be thought of as the root of a shadow copy of a volume. Requesters will use this 
     *       device name when accessing files on a shadow-copied volume that it needs to work with. 
     *       
     * 
     * The device name does not contain a trailing "\".
     */
    m_pwszSnapshotDeviceObject : IntPtr

    /**
     * Null-terminated wide character string containing the name of the volume that had been shadow copied.
     */
    m_pwszOriginalVolumeName : IntPtr

    /**
     * Null-terminated wide character string containing the name of the machine containing the original 
     *       volume.
     */
    m_pwszOriginatingMachine : IntPtr

    /**
     * Null-terminated wide character string containing the name of the machine running the Volume Shadow Copy 
     *       Service that created the shadow copy.
     */
    m_pwszServiceMachine : IntPtr

    /**
     * Null-terminated wide character string containing the name of the shadow copy when it is exposed. This is a 
     *       drive letter or mounted folder (if the shadow copy is exposed as a local volume), or a share name. Corresponds to 
     *       the <i>wszExpose</i> parameter of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-exposesnapshot">IVssBackupComponents::ExposeSnapshot</a> 
     *       method.
     */
    m_pwszExposedName : IntPtr

    /**
     * Null-terminated wide character string indicating the portion of the shadow copy of a volume made available 
     *       if it is exposed as a share. Corresponds to the <i>wszPathFromRoot</i> parameter of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-exposesnapshot">IVssBackupComponents::ExposeSnapshot</a> 
     *       method.
     */
    m_pwszExposedPath : IntPtr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/VSS/volume-shadow-copy-api-data-types">VSS_ID</a> (GUID) 
     *       uniquely identifying the provider used to create this shadow copy.
     */
    m_ProviderId : Guid

    /**
     * The attributes of the shadow copy expressed as a bit mask (or bitwise OR) of members of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_volume_snapshot_attributes">_VSS_VOLUME_SNAPSHOT_ATTRIBUTES</a> 
     *       enumeration.
     */
    m_lSnapshotAttributes : Int32

    /**
     * Time stamp indicating when the shadow copy was created. The exact time is determined by the provider. See 
     *       <a href="https://docs.microsoft.com/windows/desktop/VSS/volume-shadow-copy-api-data-types">VSS_TIMESTAMP</a> for 
     *       information about the time-stamp format.
     */
    m_tsCreationTimestamp : Int64

    /**
     * Current shadow copy creation status. See 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_snapshot_state">VSS_SNAPSHOT_STATE</a>.
     */
    m_eStatus : VSS_SNAPSHOT_STATE

}
