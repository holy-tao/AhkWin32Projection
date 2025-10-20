#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a shadow copy storage area volume.
 * @see https://docs.microsoft.com/windows/win32/api//vsmgmt/ns-vsmgmt-vss_diff_volume_prop
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_DIFF_VOLUME_PROP extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The shadow copy storage area volume name, in <b>\\\\?\\</b><i>Volume</i><b>{</b><i>GUID</i><b>}\\</b> format.
     * @type {Pointer<Integer>}
     */
    m_pwszVolumeName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Points to a null-terminated Unicode string that can be displayed to a user, for example 
     *       <i>C</i><b>:\\</b>, for the shadow copy storage area volume.
     * @type {Pointer<Integer>}
     */
    m_pwszVolumeDisplayName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Free space, in bytes, on the shadow copy storage area volume.
     * @type {Integer}
     */
    m_llVolumeFreeSpace {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Total space, in bytes, on the shadow copy storage area volume.
     * @type {Integer}
     */
    m_llVolumeTotalSpace {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }
}
