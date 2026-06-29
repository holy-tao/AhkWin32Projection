#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the properties of a shadow copy source volume.
 * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/ns-vsmgmt-vss_volume_prop
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct VSS_VOLUME_PROP {
    #StructPack 8

    /**
     * The volume name, in \\?&#92;<i>Volume</i>{<i>GUID</i>}\ format.
     */
    m_pwszVolumeName : IntPtr

    /**
     * A pointer to a null-terminated Unicode string that contains the shortest mount 
     *       point that can be displayed to the user. The mount point can be a drive letter, for example, C:\, or a mounted folder, for example, C:\WriterData\Archive.
     */
    m_pwszVolumeDisplayName : IntPtr

}
