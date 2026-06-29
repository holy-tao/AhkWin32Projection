#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DELETE_SNAPSHOT_VHDSET_VERSION.ahk" { DELETE_SNAPSHOT_VHDSET_VERSION }

/**
 * Contains snapshot deletion parameters, designating which snapshot to delete from the VHD Set.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-delete_snapshot_vhdset_parameters
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct DELETE_SNAPSHOT_VHDSET_PARAMETERS {
    #StructPack 4


    struct _Version1 {
        SnapshotId : Guid

    }

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-delete_snapshot_vhdset_version">DELETE_SNAPSHOT_VHDSET_VERSION</a> enumeration that is the discriminant for the union.
     */
    Version : DELETE_SNAPSHOT_VHDSET_VERSION

    Version1 : DELETE_SNAPSHOT_VHDSET_PARAMETERS._Version1

}
