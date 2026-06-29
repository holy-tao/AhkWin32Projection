#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\APPLY_SNAPSHOT_VHDSET_VERSION.ahk" { APPLY_SNAPSHOT_VHDSET_VERSION }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains snapshot parameters, indicating information about the new snapshot to be applied.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-apply_snapshot_vhdset_parameters
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct APPLY_SNAPSHOT_VHDSET_PARAMETERS {
    #StructPack 4


    struct _Version1 {
        SnapshotId : Guid

        LeafSnapshotId : Guid

    }

    /**
     * An <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-apply_snapshot_vhdset_version">APPLY_SNAPSHOT_VHDSET_VERSION</a> 
     *      enumeration that specifies the version of the 
     *      <b>APPLY_SNAPSHOT_VHDSET_PARAMETERS</b> structure being passed to or from the VHD functions.
     */
    Version : APPLY_SNAPSHOT_VHDSET_VERSION

    Version1 : APPLY_SNAPSHOT_VHDSET_PARAMETERS._Version1

}
