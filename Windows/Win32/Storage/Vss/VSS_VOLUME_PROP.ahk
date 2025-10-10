#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the properties of a shadow copy source volume.
 * @see https://docs.microsoft.com/windows/win32/api//vsmgmt/ns-vsmgmt-vss_volume_prop
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_VOLUME_PROP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The volume name, in \\?&#92;<i>Volume</i>{<i>GUID</i>}\ format.
     * @type {Pointer<UInt16>}
     */
    m_pwszVolumeName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the shortest mount 
     *       point that can be displayed to the user. The mount point can be a drive letter, for example, C:\, or a mounted folder, for example, C:\WriterData\Archive.
     * @type {Pointer<UInt16>}
     */
    m_pwszVolumeDisplayName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
