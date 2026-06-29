#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a shadow copy storage area volume.
 * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/ns-vsmgmt-vss_diff_volume_prop
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct VSS_DIFF_VOLUME_PROP {
    #StructPack 8

    /**
     * The shadow copy storage area volume name, in <b>\\\\?\\</b><i>Volume</i><b>{</b><i>GUID</i><b>}\\</b> format.
     */
    m_pwszVolumeName : IntPtr

    /**
     * Points to a null-terminated Unicode string that can be displayed to a user, for example 
     *       <i>C</i><b>:\\</b>, for the shadow copy storage area volume.
     */
    m_pwszVolumeDisplayName : IntPtr

    /**
     * Free space, in bytes, on the shadow copy storage area volume.
     */
    m_llVolumeFreeSpace : Int64

    /**
     * Total space, in bytes, on the shadow copy storage area volume.
     */
    m_llVolumeTotalSpace : Int64

}
